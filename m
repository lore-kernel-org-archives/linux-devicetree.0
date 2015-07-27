From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] ARM: dts: sunxi: Add regulators and
 board-specific operating points for LeMaker BananaPi
Date: Mon, 27 Jul 2015 10:07:55 +0200
Message-ID: <55B5E6DB.8020009@redhat.com>
References: <1437960486-2809-1-git-send-email-public_timo.s@silentcreek.de>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBYWN26WQKGQEB4NVSAI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1437960486-2809-1-git-send-email-public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 27-07-15 03:28, Timo Sigurdsson wrote:
> sun7i-a20-bananapi.dts doesn't contain regulator nodes for the AXP209 PMU
> driver, so add them to allow for voltage-scaling with cpufreq-dt. With the
> regulators enabled, we can define board-specific operating points. The defined
> CPU voltages are more conservative (based on the values used by the vendor),
> so they should be more failsafe across all boards of this kind out there.
>
> I'm posting this as RFC as I would like to make a few more remarks and raise
> questions along the way (plus, I'm anything but an experienced developer, so a
> a critical review might help).
>
> I checked the regulator definitions against the schematics released by LeMaker.
> I also compared that to the DT and schematics of Cubiboard 2 and Cubietruck. Of
> course, I also tested the patch on the actual hardware and it works fine for me.
> The CPU voltages are slightly higher than those set in sun7i-a20.dtsi and even
> though they work well for me, I thought it might be safer to use the more
> conservative values used by LeMaker in their old fex file. Would you agree?
> Besides, it it ok to have this in one patch or should it be splitted in two
> (one for the regulators and one for the opp)? Did I miss something important?
>
> Signed-off-by: Timo Sigurdsson <public_timo.s-fWgRPtSzPNU3WX+qO2AYSQ@public.gmane.org>

I've a simular patch here:

https://github.com/jwrdegoede/linux-sunxi/commit/6a30b7d5be6012b81e5e1439a444e41c0ac1afc1

I did not submit this upstream yet as it is part of a series to enable the otg
controller on the bananapi which needs axp-usb-power-supply support for which
the actual powersupply driver changes are still pending.

As you can see other then you adding the cpu operating points are patches are
identical, which is good :)

IMHO we should just stick with the standard operating points unless we know
that there are stability issues with them (such as e.g. on the A10 OlinuxIno Lime).

Regards,

Hans



> ---
>   arch/arm/boot/dts/sun7i-a20-bananapi.dts | 47 +++++++++++++++++++++++++++++---
>   1 file changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> index 9f7b472..2bcbb0e 100644
> --- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
> @@ -92,6 +92,22 @@
>   	status = "okay";
>   };
>
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +	operating-points = <
> +		/* kHz	  uV */
> +		1008000	1450000
> +		960000	1425000
> +		912000	1425000
> +		864000	1350000
> +		720000	1250000
> +		528000	1150000
> +		312000	1100000
> +		144000	1050000
> +		>;
> +	cooling-max-level = <7>;
> +};
> +
>   &ehci0 {
>   	status = "okay";
>   };
> @@ -119,13 +135,9 @@
>   	status = "okay";
>
>   	axp209: pmic@34 {
> -		compatible = "x-powers,axp209";
>   		reg = <0x34>;
>   		interrupt-parent = <&nmi_intc>;
>   		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> -
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
>   	};
>   };
>
> @@ -182,6 +194,33 @@
>   	};
>   };
>
> +#include "axp209.dtsi"
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1050000>;
> +	regulator-max-microvolt = <1450000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1400000>;
> +	regulator-name = "vdd-int-dll";
> +};
> +
> +&reg_ldo1 {
> +	regulator-name = "vdd-rtc";
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "avcc";
> +};
> +
>   &reg_usb1_vbus {
>   	status = "okay";
>   };
>
