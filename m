From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2 v2] device-tree: nexus7-flo: Remove power gpio key
 entry and use pmic8xxx-pwrkey
Date: Fri, 15 Apr 2016 10:22:12 -0700
Message-ID: <20160415172212.GW391@tuxbot>
References: <1460668031-12384-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460668031-12384-1-git-send-email-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 14 Apr 14:07 PDT 2016, John Stultz wrote:

> Since the pmic8xxx-pwrkey driver is already supported in the
> qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
> configure proper device shutdown when ps_hold goes low, it is
> better to use that driver then a generic gpio button.
> 
> Thus this patch remove the gpio power key entry here, so we
> don't get double input events from having two drivers enabled.
> 

This part has my ack.

> The one gotcha with the pmic8xxx-pwrkey is it has a fairly
> long debounce delay, which we shorten here to make the button
> behave as expected.
> 

It's set to 15ms, so this sounds like a bug.

> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Andy Gross <agross@codeaurora.org>
> Cc: Vinay Simha BN <simhavcs@gmail.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <stephen.boyd@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org

You don't have to mention everyone here...

> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
>  - Add wakeup-source entry as suggested by
>    Sudeep Holla <sudeep.holla@arm.com>
> 
>  arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
[..]
> @@ -190,6 +184,16 @@
>  			};
>  		};
>  
> +		/* override default debounce for power-key */
> +		qcom,ssbi@500000 {
> +			pmic@0 {
> +				pwrkey@1c {
> +					debounce = <1>;

The debounce is specified in microseconds, so if the 15625us that's
specified in the dtsi is too much for you we have a bug in the driver.

Further, comparing the math with downstream indicates that we're quite
off.

Could you please try the downstream calculation of "delay", by changing
pmic8xxx_pwrkey_probe() to include:

	delay = (kpb_delay << 6) / USEC_PER_SEC;
	delay = ilog2(delay);

Unfortunately I don't have the register documentation for this pmic.

Stephen, can you shed some light on the trig-delay (what I presume is
the bark timer in later versions) bits in PON_CNTRL_1 (0x1c) on PM8921.

> +					wakeup-source;

The driver already enables wakeup on itself, so I don't think this
should be necessary (i.e. you should be able to drop this entire node
from the dts).

> +				};
> +			};
> +		};
> +

Regards,
Bjorn
