From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] device-tree: nexus7-flo: Remove power gpio key entry and
 use pmic8xxx-pwrkey
Date: Wed, 13 Apr 2016 18:24:26 +0100
Message-ID: <570E80CA.3080100@arm.com>
References: <1460567784-28017-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460567784-28017-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 13/04/16 18:16, John Stultz wrote:
> Since the pmic8xxx-pwrkey driver is already supported in the
> qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
> configure proper device shutdown when ps_hold goes low, it is
> better to use that driver then a generic gpio button.
>
> Thus this patch remove the gpio power key entry here, so we
> don't get double input events from having two drivers enabled.
>
> The one gotcha with the pmic8xxx-pwrkey is it has a fairly
> long debounce delay, which we shorten here to make the button
> behave as expected.
>
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
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> index c535b3f..7ac1c65 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
> @@ -29,12 +29,6 @@
>
>   	gpio-keys {
>   		compatible = "gpio-keys";
> -		power {
> -			label = "Power";
> -			gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
> -			linux,code = <KEY_POWER>;
> -			gpio-key,wakeup;

You are dropping wakeup with this change. Is that intentional ?

If not, while you are at this, replace it with "wakeup-source"
which is standard binding.

If yes, then it solves the problem :). I had a patch to replace it, but
was waiting to check if any new files in linux-next before posting. For
now, this is the only legacy entry.

-- 
Regards,
Sudeep
