From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v3 5/6] ARM: STiH407: Add nodes for
 RemoteProc
Date: Thu, 3 Sep 2015 16:26:38 +0100
Message-ID: <20150903152638.GD7093@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
 <1441208289-17330-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441208289-17330-6-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Wed, 02 Sep 2015, Lee Jones wrote:

> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 40 +++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 33daa49..1c31918 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -608,5 +608,45 @@
>  			status		= "okay";
>  			tx-only;
>  		};
> +
> +		st231_gp0: st231-gp0@40000000 {
> +			compatible	= "st,st231-rproc";
> +			reg		= <0x40000000 0x01000000>;
> +			resets		= <&softreset STIH407_ST231_GP0_SOFTRESET>;
> +			reset-names	= "sw_reset";
> +			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_0>;
> +			clock-frequency	= <600000000>;
> +			st,syscfg	= <&syscfg_core 0x22c>;
> +		};
> +
> +		st231_gp1: st231-gp1@41000000 {
> +			compatible	= "st,st231-rproc";
> +			reg		= <0x41000000 0x01000000>;
> +			resets		= <&softreset STIH407_ST231_GP1_SOFTRESET>;
> +			reset-names	= "sw_reset";
> +			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_1>;
> +			clock-frequency = <600000000>;
> +			st,syscfg	= <&syscfg_core 0x220>;
> +		};
> +
> +		st231_audio: st231-audio@42000000 {
> +			compatible	= "st,st231-rproc";
> +			reg		= <0x42000000 0x01000000>;
> +			resets		= <&softreset STIH407_ST231_AUD_SOFTRESET>;
> +			reset-names	= "sw_reset";
> +			clocks		= <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
> +			clock-frequency	= <600000000>;
> +			st,syscfg	= <&syscfg_core 0x228>;
> +		};
> +
> +		st231_dmu: st231-dmu@43000000 {
> +			compatible	= "st,st231-rproc";
> +			reg		= <0x43000000 0x01000000>;
> +			resets		= <&softreset STIH407_ST231_DMU_SOFTRESET>;
> +			reset-names	= "sw_reset";
> +			clocks		= <&clk_s_c0_flexgen CLK_ST231_DMU>;

Thinking more about this more, I believe you will actually need to support enabling
and setting the frequency on a list of clocks.

The reason being that for the video ST231 for example you also need to enable
CLK_VID_DMU. This clock clocks the DeltaMU hw used by the video ST231 for
video decoding. I suspect if the video firmware is loading and working correctly
with this patchset, then it is most likely because the clock is being enabled
by the bootloader and not being disabled by CCF due to our platform booting
with clk_ignore_unused.

When yours (or Mikes) critical clock patches get merged, and we stop booting with
"clk_ignore_unused" you will find it no longer works.

I'm not aware of other hw which is used by the audio of gp ST231, but as the driver
also covers ST40 and potentially other co-processors in the future, having a list
of clocks seems nicely extendable to cover other permutations.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
