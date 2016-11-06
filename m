From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH] ARM: dts: add panel and tcon nodes to
 Allwinner A33 Q8 tablet dts
Date: Sun, 6 Nov 2016 15:27:11 +0100
Message-ID: <948897e3-12a2-b02c-ed26-929921ff04b2@redhat.com>
References: <20161106111119.14927-1-icenowy@aosc.xyz>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBR737TAAKGQESKO3ZRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161106111119.14927-1-icenowy-ymACFijhrKM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06-11-16 12:11, Icenowy Zheng wrote:
> All A33 Q8 tablets features a LCD panel, with a resolution of either
> 800x480 or 1024x600.
>
> Add "bone" device nodes to the device tree.

Bone ?

>
> Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>

He, as discussed in the other thread since sun8i-a33-q8-tablet.dts
is used for both 800x480 and 1024x600 versions we really need to
introduce new sun8i-a33-q8-tablet-800x600.dts and
sun8i-a33-q8-tablet-1024x600.dts files, which include
sun8i-a33-q8-tablet.dts and then add just the panel bits; and patch
newer u-boots to use those instead.

This way people who stick with an old u-boot will just not get
the drm driver, rather then all of a sudden getting a wrong
resolution.

Icenowy, can you please also submit a matching u-boot patch
(both the new dts file, as well as updating the defconfig you
  use to the new dts file)?

Regards,

Hans



> ---
>
> Maybe it will be better to add them to sun8i-q8-reference-tablet.dtsi, as
> these pin configurations are part of reference design of both A23 and A33,
> not only restricted to Q8.
>
> The DTS file is tested by me, after cherry-picks this patch from Chen-Yu Tsai:
> https://github.com/wens/linux/commit/2823b887a289fbee5f97f3c6b45ed6c74a6368c6
>
> And add these commands to my U-Boot boot command:
>
> fdt addr 0x43000000
> fdt resize
> fdt set /panel compatible "urt,umsh-8596md-t"
> fdt set /panel status "okay"
> fdt set /display-engine status "okay"
> fdt set /soc@01c00000/lcd-controller@01c0c000 status "okay"
>
>  arch/arm/boot/dts/sun8i-a33-q8-tablet.dts | 44 +++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts b/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts
> index b0bc236..871a20c 100644
> --- a/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts
> +++ b/arch/arm/boot/dts/sun8i-a33-q8-tablet.dts
> @@ -47,4 +47,48 @@
>  / {
>  	model = "Q8 A33 Tablet";
>  	compatible = "allwinner,q8-a33", "allwinner,sun8i-a33";
> +
> +	panel: panel {
> +		/* compatible should be set according to the panel */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lcd_en_q8>;
> +		backlight = <&backlight>;
> +		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +		power-supply = <&reg_dc1sw>;
> +		status = "disabled";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			panel_input: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&tcon0_out_lcd>;
> +			};
> +		};
> +	};
> +};
> +
> +&tcon0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&lcd_rgb666_pins>;
> +};
> +
> +&tcon0_out {
> +	tcon0_out_lcd: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&panel_input>;
> +	};
> +};
> +
> +&pio {
> +	lcd_en_q8: lcd_en@0 {
> +		allwinner,pins = "PH7";
> +		allwinner,function = "gpio_out";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
>  };
>
