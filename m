From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v3 2/6] gnss: sirf: set power state initially off
Date: Tue, 22 Jan 2019 18:22:15 +0100
Message-ID: <20190122172215.GQ3691@localhost>
References: <20190116211812.6337-1-andreas@kemnade.info>
 <20190116211812.6337-3-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190116211812.6337-3-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: letux-kernel@openphoenux.org, johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 10:18:08PM +0100, Andreas Kemnade wrote:
> On the GTA04 mobile phone, it was observed that the gps was powered
> on sometimes intially. Generally a reboot without powering the device
> off (direct reset of the processor, reboot from a system where gps
> power toggle was done in userspace) or glitches on the gpio pin during
> power on could cause this problem.
> This has the drawback that probing takes some seconds on
> systems without wakeup signal. On systems with wakeup signal
> this penalty is much lower.
> But if the chip is initially on and that is not fixed, the suspend
> current will be multiple times higher, so this sacrifice should
> be justified
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> - was part of 2/5 in v2
> 
>  drivers/gnss/sirf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
> index b21e14351b82..c7706b91f6f0 100644
> --- a/drivers/gnss/sirf.c
> +++ b/drivers/gnss/sirf.c
> @@ -367,6 +367,13 @@ static int sirf_probe(struct serdev_device *serdev)
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		pm_runtime_set_suspended(dev);	/* clear runtime_error flag */
>  		pm_runtime_enable(dev);
> +		/*
> +		 * Device might be enabled at boot, so ensure it is off.
> +		 * This was observed in practice on GTA04.
> +		 */
> +		ret = sirf_set_active(data, false);
> +		if (ret < 0)
> +			goto err_disable_rpm;

I want to handle this case a bit differently. First, we shouldn't
penalise the common case where the receiver is already off by power
cycling when not needed. Second, the above could race with runtime pm.
Third, we mustn't call sirf_set_active() when we have no on-off gpio.

I've prepare a small series which implements this force hibernate mode
at probe if already active. This should be easy to extend with a
function retrieving the current state at boot also for the no-wakeup
case (e.g. keep the port open for one report cycle).

This also allows for a cleaner implementation of sirf_set_active() for
the no-wakeup case (I noticed you added some optimisation there after I
implemented force-hibernate-at-probe).

Johan
