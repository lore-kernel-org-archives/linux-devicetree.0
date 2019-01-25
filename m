From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v4 2/5] gnss: sirf: add support for configurations
 without wakeup signal
Date: Fri, 25 Jan 2019 15:31:53 +0100
Message-ID: <20190125143153.GF3691@localhost>
References: <20190124063439.29897-1-andreas@kemnade.info>
 <20190124063439.29897-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190124063439.29897-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 24, 2019 at 07:34:36AM +0100, Andreas Kemnade wrote:
> Some Wi2Wi devices do not have a wakeup output, so device state can
> only be indirectly detected by looking whether there is communication
> over the serial lines.
> This approach requires a report cycle set to a value less than 2 seconds
> to be reliable.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v4:
>  - was 3/6 earlier
>  - more cleanup
>  - separate no wakeup version for sirf_wait_for_power_state
>  - cleaned up optimisation for initial power off
> 
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
>  drivers/gnss/sirf.c | 124 ++++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 105 insertions(+), 19 deletions(-)

>  static int sirf_wait_for_power_state(struct sirf_data *data, bool active,
>  					unsigned long timeout)
>  {
>  	int ret;
>  
> +	if (!data->wakeup)
> +		return sirf_wait_for_power_state_nowakeup(data, active,
> +							  timeout);
> +
>  	ret = wait_event_interruptible_timeout(data->power_wait,
>  			data->active == active, msecs_to_jiffies(timeout));
>  	if (ret < 0)
> @@ -195,6 +267,12 @@ static int sirf_set_active(struct sirf_data *data, bool active)
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
>  		sirf_pulse_on_off(data);
>  		ret = sirf_wait_for_power_state(data, active, timeout);
> @@ -202,12 +280,17 @@ static int sirf_set_active(struct sirf_data *data, bool active)
>  			if (ret == -ETIMEDOUT)
>  				continue;
>  
> -			return ret;
>  		}
> -
>  		break;
> +
>  	} while (retries--);

I noticed there were some odd white-space changes here after you
reverted the modified error handling from v3 which initially looked a
little out of place to me.

I decided to add those changed back in instead after looking at the end
result and noticing that the (retries < 0) check below also becomes
superfluous.

> +	if (!data->wakeup)
> +		sirf_serdev_close(data);
> +
> +	if (ret)
> +		return ret;
> +
>  	if (retries < 0)
>  		return -ETIMEDOUT;

Series now applied, good job!

Johan
