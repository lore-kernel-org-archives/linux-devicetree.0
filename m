From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: juno: fix few unit address format
 warnings
Date: Wed, 19 Apr 2017 11:08:06 +0100
Message-ID: <20170419100806.GI10078@e110455-lin.cambridge.arm.com>
References: <1492538279-16405-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492538279-16405-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 06:57:58PM +0100, Sudeep Holla wrote:
> This patch fixes the following set of warnings on juno.
> 
>  smb@08000000 unit name should not have leading 0s
>  sysctl@020000 simple-bus unit address format error, expected "20000"
>  apbregs@010000 simple-bus unit address format error, expected "10000"
>  mmci@050000 simple-bus unit address format error, expected "50000"
>  kmi@060000 simple-bus unit address format error, expected "60000"
>  kmi@070000 simple-bus unit address format error, expected "70000"
>  wdt@0f0000 simple-bus unit address format error, expected "f0000"
> 
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Thanks!
Liviu

> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi        |  2 +-
>  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 8ffaff2043d0..bfe7d683a42e 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -699,7 +699,7 @@
>  		      <0x00000008 0x80000000 0x1 0x80000000>;
>  	};
> 
> -	smb@08000000 {
> +	smb@8000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <2>;
>  		#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> index 098601657f82..2ac43221ddb6 100644
> --- a/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-motherboard.dtsi
> @@ -137,7 +137,7 @@
>  				#size-cells = <1>;
>  				ranges = <0 3 0 0x200000>;
> 
> -				v2m_sysctl: sysctl@020000 {
> +				v2m_sysctl: sysctl@20000 {
>  					compatible = "arm,sp810", "arm,primecell";
>  					reg = <0x020000 0x1000>;
>  					clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&mb_clk24mhz>;
> @@ -148,7 +148,7 @@
>  					assigned-clock-parents = <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
>  				};
> 
> -				apbregs@010000 {
> +				apbregs@10000 {
>  					compatible = "syscon", "simple-mfd";
>  					reg = <0x010000 0x1000>;
> 
> @@ -216,7 +216,7 @@
>  					};
>  				};
> 
> -				mmci@050000 {
> +				mmci@50000 {
>  					compatible = "arm,pl180", "arm,primecell";
>  					reg = <0x050000 0x1000>;
>  					interrupts = <5>;
> @@ -228,7 +228,7 @@
>  					clock-names = "mclk", "apb_pclk";
>  				};
> 
> -				kmi@060000 {
> +				kmi@60000 {
>  					compatible = "arm,pl050", "arm,primecell";
>  					reg = <0x060000 0x1000>;
>  					interrupts = <8>;
> @@ -236,7 +236,7 @@
>  					clock-names = "KMIREFCLK", "apb_pclk";
>  				};
> 
> -				kmi@070000 {
> +				kmi@70000 {
>  					compatible = "arm,pl050", "arm,primecell";
>  					reg = <0x070000 0x1000>;
>  					interrupts = <8>;
> @@ -244,7 +244,7 @@
>  					clock-names = "KMIREFCLK", "apb_pclk";
>  				};
> 
> -				wdt@0f0000 {
> +				wdt@f0000 {
>  					compatible = "arm,sp805", "arm,primecell";
>  					reg = <0x0f0000 0x10000>;
>  					interrupts = <7>;
> --
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
