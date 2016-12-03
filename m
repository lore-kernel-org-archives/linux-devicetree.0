From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v3 -next 2/2] ARM: dts: sunxi: add support
 for Orange Pi Zero board
Date: Sat, 03 Dec 2016 21:24:19 +0800
Message-ID: <20161203162455.OlDm27ch@smtp3m.mail.yandex.net>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/html; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBMEPRPBAKGQEADO565Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andre.przywara-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org

<p dir="ltr"><br>
2016&#24180;12&#26376;3&#26085; &#19979;&#21320;5:43&#20110; Jernej Skrabec &lt;jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt;&#20889;&#36947;&#65306;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Dne petek, 02. december 2016 17.42.04 UTC+1 je oseba Chen-Yu Tsai napisala:<br>
&gt;&gt;<br>
&gt;&gt; Hi, <br>
&gt;&gt;<br>
&gt;&gt; On Fri, Dec 2, 2016 at 11:05 PM, Icenowy Zheng &lt;ice...-ymACFijhrKM@public.gmane.org&gt; wrote: <br>
&gt;&gt; &gt; Orange Pi Zero is a board that came with the new Allwinner H2+ SoC and a <br>
&gt;&gt; &gt; SDIO Wi-Fi chip by Allwinner (XR819). <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Add a device tree file for it. <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Signed-off-by: Icenowy Zheng &lt;ice...-ymACFijhrKM@public.gmane.org&gt; <br>
&gt;&gt; &gt; --- <br>
&gt;&gt; &gt; Changes since v2: <br>
&gt;&gt; &gt; - Merged SDIO Wi-Fi patch into it. <br>
&gt;&gt; &gt; - SDIO Wi-Fi: add a ethernet1 alias to it, as it has no internal NVRAM. <br>
&gt;&gt; &gt; - SDIO Wi-Fi: changed pinctrl binding to generic pinconf <br>
&gt;&gt; &gt; - removed all gpio pinctrl nodes <br>
&gt;&gt; &gt; - changed h2plus to h2-plus <br>
&gt;&gt; &gt; Changes since v1: <br>
&gt;&gt; &gt; - Convert to generic pinconf bindings. <br>
&gt;&gt; &gt; - SDIO Wi-Fi: add patch. <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Some notes: <br>
&gt;&gt; &gt; - The uart1 and uart2 is available on the unsoldered gpio header. <br>
&gt;&gt; &gt; - The onboard USB connector has its Vbus directly connected to DCIN-5V (the <br>
&gt;&gt; &gt; &#160; power jack) <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; &#160;arch/arm/boot/dts/Makefile &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160;| &#160; 1 + <br>
&gt;&gt; &gt; &#160;arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 159 ++++++++++++++++++++++ <br>
&gt;&gt; &gt; &#160;2 files changed, 160 insertions(+) <br>
&gt;&gt; &gt; &#160;create mode 100644 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile <br>
&gt;&gt; &gt; index 6447abc..59f6e86 100644 <br>
&gt;&gt; &gt; --- a/arch/arm/boot/dts/Makefile <br>
&gt;&gt; &gt; +++ b/arch/arm/boot/dts/Makefile <br>
&gt;&gt; &gt; @@ -844,6 +844,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-a33-sinlinx-sina33.dtb \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-a83t-allwinner-h8homlet-v2.dtb \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-a83t-cubietruck-plus.dtb \ <br>
&gt;&gt; &gt; + &#160; &#160; &#160; sun8i-h2-plus-orangepi-zero.dtb \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-h3-bananapi-m2-plus.dtb \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-h3-nanopi-neo.dtb \ <br>
&gt;&gt; &gt; &#160; &#160; &#160; &#160; sun8i-h3-orangepi-2.dtb \ <br>
&gt;&gt; &gt; diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts <br>
&gt;&gt; &gt; new file mode 100644 <br>
&gt;&gt; &gt; index 0000000..d18807f <br>
&gt;&gt; &gt; --- /dev/null <br>
&gt;&gt; &gt; +++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts <br>
&gt;&gt; &gt; @@ -0,0 +1,159 @@ <br>
&gt;&gt; &gt; +/* <br>
&gt;&gt; &gt; + * Copyright (C) 2016 Icenowy Zheng &lt;ice...-ymACFijhrKM@public.gmane.org&gt; <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * Based on sun8i-h3-orangepi-one.dts, which is: <br>
&gt;&gt; &gt; + * &#160; Copyright (C) 2016 Hans de Goede &lt;hdeg...-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org&gt; <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * This file is dual-licensed: you can use it either under the terms <br>
&gt;&gt; &gt; + * of the GPL or the X11 license, at your option. Note that this dual <br>
&gt;&gt; &gt; + * licensing only applies to this file, and not this project as a <br>
&gt;&gt; &gt; + * whole. <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * &#160;a) This file is free software; you can redistribute it and/or <br>
&gt;&gt; &gt; + * &#160; &#160; modify it under the terms of the GNU General Public License as <br>
&gt;&gt; &gt; + * &#160; &#160; published by the Free Software Foundation; either version 2 of the <br>
&gt;&gt; &gt; + * &#160; &#160; License, or (at your option) any later version. <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * &#160; &#160; This file is distributed in the hope that it will be useful, <br>
&gt;&gt; &gt; + * &#160; &#160; but WITHOUT ANY WARRANTY; without even the implied warranty of <br>
&gt;&gt; &gt; + * &#160; &#160; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. &#160;See the <br>
&gt;&gt; &gt; + * &#160; &#160; GNU General Public License for more details. <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * Or, alternatively, <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * &#160;b) Permission is hereby granted, free of charge, to any person <br>
&gt;&gt; &gt; + * &#160; &#160; obtaining a copy of this software and associated documentation <br>
&gt;&gt; &gt; + * &#160; &#160; files (the "Software"), to deal in the Software without <br>
&gt;&gt; &gt; + * &#160; &#160; restriction, including without limitation the rights to use, <br>
&gt;&gt; &gt; + * &#160; &#160; copy, modify, merge, publish, distribute, sublicense, and/or <br>
&gt;&gt; &gt; + * &#160; &#160; sell copies of the Software, and to permit persons to whom the <br>
&gt;&gt; &gt; + * &#160; &#160; Software is furnished to do so, subject to the following <br>
&gt;&gt; &gt; + * &#160; &#160; conditions: <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * &#160; &#160; The above copyright notice and this permission notice shall be <br>
&gt;&gt; &gt; + * &#160; &#160; included in all copies or substantial portions of the Software. <br>
&gt;&gt; &gt; + * <br>
&gt;&gt; &gt; + * &#160; &#160; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, <br>
&gt;&gt; &gt; + * &#160; &#160; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES <br>
&gt;&gt; &gt; + * &#160; &#160; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND <br>
&gt;&gt; &gt; + * &#160; &#160; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT <br>
&gt;&gt; &gt; + * &#160; &#160; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, <br>
&gt;&gt; &gt; + * &#160; &#160; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING <br>
&gt;&gt; &gt; + * &#160; &#160; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR <br>
&gt;&gt; &gt; + * &#160; &#160; OTHER DEALINGS IN THE SOFTWARE. <br>
&gt;&gt; &gt; + */ <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +/dts-v1/; <br>
&gt;&gt; &gt; +#include "sun8i-h3.dtsi" <br>
&gt;&gt; &gt; +#include "sunxi-common-regulators.dtsi" <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +#include &lt;dt-bindings/gpio/gpio.h&gt; <br>
&gt;&gt; &gt; +#include &lt;dt-bindings/input/input.h&gt; <br>
&gt;&gt; &gt; +#include &lt;dt-bindings/pinctrl/sun4i-a10.h&gt; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +/ { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; model = "Xunlong Orange Pi Zero"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; compatible = "xunlong,orangepi-zero", "allwinner,sun8i-h2-plus"; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; aliases { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; serial0 = &amp;uart0; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; /* ethernet0 is the H3 emac, defined in sun8i-h3.dtsi */ <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; ethernet1 = &amp;xr819; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; chosen { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; stdout-path = "serial0:115200n8"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; leds { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; compatible = "gpio-leds"; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; pwr_led { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; label = "orangepi:green:pwr"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; gpios = &lt;&amp;r_pio 0 10 GPIO_ACTIVE_HIGH&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; default-state = "on"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; status_led { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; label = "orangepi:red:status"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; &#160; gpios = &lt;&amp;pio 0 17 GPIO_ACTIVE_HIGH&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; reg_vcc_wifi: reg_vcc_wifi { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; compatible = "regulator-fixed"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; regulator-min-microvolt = &lt;3300000&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; regulator-max-microvolt = &lt;3300000&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; regulator-name = "vcc-wifi"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; enable-active-high; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; gpio = &lt;&amp;pio 0 20 GPIO_ACTIVE_HIGH&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; wifi_pwrseq: wifi_pwrseq { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; compatible = "mmc-pwrseq-simple"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; reset-gpios = &lt;&amp;r_pio 0 7 GPIO_ACTIVE_LOW&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;ehci1 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;mmc0 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-names = "default"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-0 = &lt;&amp;mmc0_pins_a&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; vmmc-supply = &lt;&amp;reg_vcc3v3&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; bus-width = &lt;4&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; cd-gpios = &lt;&amp;pio 5 6 GPIO_ACTIVE_HIGH&gt;; /* PF6 */ <br>
&gt;&gt; &gt; + &#160; &#160; &#160; cd-inverted; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;mmc1 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-names = "default"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-0 = &lt;&amp;mmc1_pins_a&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; vmmc-supply = &lt;&amp;reg_vcc_wifi&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; mmc-pwrseq = &lt;&amp;wifi_pwrseq&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; bus-width = &lt;4&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; non-removable; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; + &#160; &#160; &#160; /* <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160;* Explicitly define the sdio device, so that we can add an ethernet <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160;* alias for it (which e.g. makes u-boot set a mac-address). <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160;*/ <br>
&gt;&gt; &gt; + &#160; &#160; &#160; xr819: sdio_wifi@1 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; &#160; &#160; &#160; &#160; reg = &lt;1&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; }; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;mmc1_pins_a { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; bias-pull-up; <br>
&gt;&gt;<br>
&gt;&gt; This is already set in h3.dtsi <br>
&gt;&gt;<br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;ohci1 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;uart0 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-names = "default"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-0 = &lt;&amp;uart0_pins_a&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;uart1 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-names = "default"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-0 = &lt;&amp;uart1_pins&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "disabled"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;uart2 { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-names = "default"; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; pinctrl-0 = &lt;&amp;uart2_pins&gt;; <br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "disabled"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; + <br>
&gt;&gt; &gt; +&amp;usbphy { <br>
&gt;&gt; &gt; + &#160; &#160; &#160; /* USB VBUS is always on */ <br>
&gt;&gt;<br>
&gt;&gt; I think this comment could use a little work. <br>
&gt;&gt;<br>
&gt;&gt; AFAIK this board doesn't have an actual USB port. <br>
&gt;&gt; It's just the D+/D- pins on the pin header, along <br>
&gt;&gt; with the board-wide 5V, also on the pin header. <br>
&gt;<br>
&gt;<br>
&gt; How is addon board handled then? It has two USBs,<br>
&gt; IR, audio, mic and probably also TV out. I can't see<br>
&gt; any obvious way how to detect that the addon board<br>
&gt; is plugged in from the image.</p>
<p dir="ltr">It cannot be detected.</p>
<p dir="ltr">However, the pins on it are nearly all not muxed (maybe except IR).</p>
<p dir="ltr">&gt;<br>
&gt; https://www.aliexpress.com/item/New-Orange-Pi-Zreo-Expansion-board-Interface-board-Development-board-beyond-Raspberry-Pi/32770665186.html<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Jernej &#352;krabec<br>
&gt; &#160;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; ChenYu <br>
&gt;&gt;<br>
&gt;&gt; &gt; + &#160; &#160; &#160; status = "okay"; <br>
&gt;&gt; &gt; +}; <br>
&gt;&gt; &gt; -- <br>
&gt;&gt; &gt; 2.10.2 <br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; -- <br>
&gt;&gt; &gt; You received this message because you are subscribed to the Google Groups "linux-sunxi" group. <br>
&gt;&gt; &gt; To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi...-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org <br>
&gt;&gt; &gt; For more options, visit https://groups.google.com/d/optout. <br>
</p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an email to <a href="mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href="https://groups.google.com/d/optout">https://groups.google.com/d/optout</a>.<br />
