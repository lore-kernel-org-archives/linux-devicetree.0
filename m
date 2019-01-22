From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 3/6] gnss: sirf: add support for configurations
 without wakeup signal
Date: Tue, 22 Jan 2019 18:56:43 +0100
Message-ID: <20190122175643.GR3691@localhost>
References: <20190116211812.6337-1-andreas@kemnade.info>
 <20190116211812.6337-4-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116211812.6337-4-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 10:18:09PM +0100, Andreas Kemnade wrote:
> Some Wi2Wi devices do not have a wakeup output, so device state can
> only be indirectly detected by looking whether there is communitcation

communication

> over the serial lines.
> This approach requires a report cycle set to a low value to be reliable.

How low? Better to spell out your current assumptions so people can
configure accordingly.

> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v3:
>  - was 2/5 earlier
>  - changed commit headline
>  - more style cleanup
>  - split out initial power off as 2/6
>  - introduced SIRF_REPORT_CYCLE constant
>  - added documentation about limitations
>  - ignore first data after power state on so no
>    shutdown meassages are treated as power on success
>  - clearer logic in sirf_wait_for_power_state
> 
> Changes in v2:
>  - style cleanup
>  - do not keep serdev open just because runtime is active,
>    only when needed (gnss device is opened or state is changed)
>  - clearer timeout semantics
> 
> 
>  drivers/gnss/sirf.c | 117 +++++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 93 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index c7706b91f6f0..943a2ec9b708 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -25,6 +25,16 @@
>  #define SIRF_ON_OFF_PULSE_TIME		100
>  #define SIRF_ACTIVATE_TIMEOUT		200
>  #define SIRF_HIBERNATE_TIMEOUT		200
> +/*
> + * If no data arrives for this time, we expect the chip to be off.

"we assume that the chip is off"?

> + * REVISIT: The report cycle is configurable and can be several minutes long,
> + * so this will only work reliably if the report cycle is set to a reasonable
> + * low value. Also power saving settings (like send data only on movement)
> + * might things work even worse.
> + * Workaround might be to parse shutdown or bootup messages.
> + * This problem mainly makes error checking uncertain.

I'd drop the last sentence. You could also fail to detect the state and
waste power indefinitely, right?

> + */
> +#define SIRF_REPORT_CYCLE	2000
>  
>  struct sirf_data {
>  	struct gnss_device *gdev;
> @@ -39,9 +49,45 @@ struct sirf_data {
>  	struct mutex gdev_mutex;
>  	bool open;
>  
> +	/*
> +	 * Using the same mutex inside a serdev callback
> +	 * and around a serdev call leads to lockdep problems.

Lockdep is not a problem; a possible deadlock is. Just drop this comment.

> +	 */
> +	struct mutex serdev_mutex;
> +	int serdev_count;
> +
>  	wait_queue_head_t power_wait;
>  };
>  
> +static int sirf_serdev_open(struct sirf_data *data)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&data->serdev_mutex);
> +	if (++data->serdev_count == 1) {
> +		ret = serdev_device_open(data->serdev);
> +		if (ret) {
> +			data->serdev_count--;
> +			mutex_unlock(&data->serdev_mutex);

Use a common "out_unlock:" path below.

> +			return ret;
> +		}
> +
> +		serdev_device_set_baudrate(data->serdev, data->speed);
> +		serdev_device_set_flow_control(data->serdev, false);
> +	}
> +	mutex_unlock(&data->serdev_mutex);
> +
> +	return ret;
> +}
 
> @@ -128,6 +170,11 @@ static int sirf_receive_buf(struct serdev_device *serdev,
>  	struct gnss_device *gdev = data->gdev;
>  	int ret = 0;
>  
> +	if (!data->wakeup && !data->active) {
> +		data->active = true;
> +		wake_up_interruptible(&data->power_wait);
> +	}
> +
>  	mutex_lock(&data->gdev_mutex);
>  	if (data->open)
>  		ret = gnss_insert_raw(gdev, buf, count);
> @@ -163,6 +210,24 @@ static int sirf_wait_for_power_state(struct sirf_data *data, bool active,
>  {
>  	int ret;
>  
> +	if (!data->wakeup) {

You currently don't share any code with the wakeup-case; better to keep
this in a separate helper if so.

> +		/* Wait for boot or shutdown messages */

	/* Wait for state change (including any shutdown messages). */

> +		msleep(timeout);
> +		data->active = false;
> +		/* Now check if it is really off. */

You now also use this code to check for activate state:

	/* Wait for data reception or timeout. */

> +		ret = wait_event_interruptible_timeout(data->power_wait,
> +					data->active,
> +					msecs_to_jiffies(SIRF_REPORT_CYCLE));
> +		if (ret < 0)
> +			return ret;
> +
> +		if ((ret > 0 && !active) ||
> +		    (ret == 0 && active))

Split these cases in two add add comments (failed suspend and failed
resume) for readability.

> +			return -ETIMEDOUT;
> +
> +		return 0;
> +	}
> +
>  	ret = wait_event_interruptible_timeout(data->power_wait,
>  			data->active == active, msecs_to_jiffies(timeout));
>  	if (ret < 0)
> @@ -195,18 +260,29 @@ static int sirf_set_active(struct sirf_data *data, bool active)
>  	else
>  		timeout = SIRF_HIBERNATE_TIMEOUT;
>  
> +	if (!data->wakeup) {
> +		ret = sirf_serdev_open(data);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	do {
> -		sirf_pulse_on_off(data);
> +		/*
> +		 * Try to avoid unneeded, time-consuming state toggles
> +		 * in the configurations without wakeup signal. This counts
> +		 * especially for the initial off state check.
> +		 */
> +		if (data->wakeup || data->active || active)
> +			sirf_pulse_on_off(data);

Special casing like this only hurts readability. This is better handled
as a I did for the wakeup case in the series I just posted, that is, by
making sure the receiver is hibernated in probe. You just need to add a
helper to determine the state for no-wakeup.

> +
>  		ret = sirf_wait_for_power_state(data, active, timeout);
> -		if (ret < 0) {
> -			if (ret == -ETIMEDOUT)
> -				continue;
> +	} while (ret == -ETIMEDOUT && retries--);

Why change this?

>  
> -			return ret;

A break should do right?

> -		}
> +	if (!data->wakeup)
> +		sirf_serdev_close(data);
>  
> -		break;
> -	} while (retries--);
> +	if (ret)
> +		return ret;
>  
>  	if (retries < 0)
>  		return -ETIMEDOUT;

Johan
