From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: sun4i: Add dts file for
 Chuwi V7 CW0825 tablet
Date: Wed, 14 Jan 2015 20:51:13 +0100
Message-ID: <20150114195113.GG4891@lukather>
References: <1421145872-17828-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hplhpi8yEJNNWiIl"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBIET3OSQKGQEGECDSPI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421145872-17828-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Hplhpi8yEJNNWiIl
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Tue, Jan 13, 2015 at 11:44:30AM +0100, Hans de Goede wrote:
> The Chuwi V7 is an A10 (sun4i) based tablet with 1G of RAM, 16G of nand flash,
> microsd slot, 7" 1024x768 lvds ips panel, mini hdmi out, headphones out,
> stereo speakers, front & back camera and usb wifi.
> 
> It is clearly marked "CHUWI", "V7" and "Model: CW0825" on the back of the
> tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - Use cpp style includes
> - Use GPIO header for the GPIO flags
> - Address nodes by reference rather then by their full dt path
> ---
>  arch/arm/boot/dts/Makefile                      |  1 +
>  arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts | 99 +++++++++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index a86f232..548520f 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -445,6 +445,7 @@ dtb-$(CONFIG_ARCH_STI)+= stih407-b2120.dtb \
>  dtb-$(CONFIG_MACH_SUN4I) += \
>  	sun4i-a10-a1000.dtb \
>  	sun4i-a10-ba10-tvbox.dtb \
> +	sun4i-a10-chuwi-v7-cw0825.dtb \
>  	sun4i-a10-cubieboard.dtb \
>  	sun4i-a10-mini-xplus.dtb \
>  	sun4i-a10-hackberry.dtb \
> diff --git a/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> new file mode 100644
> index 0000000..0654d30
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-chuwi-v7-cw0825.dts
> @@ -0,0 +1,99 @@
> +/*
> + * Copyright 2015 Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of the
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + *     You should have received a copy of the GNU General Public
> + *     License along with this file; if not, write to the Free
> + *     Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
> + *     MA 02110-1301 USA
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +/dts-v1/;
> +#include "sun4i-a10.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model = "Chuwi V7 CW0825";
> +	compatible = "chuwi,v7-cw0825", "allwinner,sun4i-a10";
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_reference_design>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	cd-gpios = <&pio 7 1 GPIO_ACTIVE_HIGH>; /* PH1 */
> +	cd-inverted;
> +	status = "okay";
> +};

MMC0 base address: 01c0f000

> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pins_a>;
> +	status = "okay";
> +};

UART0 base address: 0x01c28000

> +&usbphy {
> +	usb2_vbus-supply = <&reg_usb2_vbus>;
> +	status = "okay";
> +};

USB PHY base address: 01c13400 

See what I meant?

I'm not blaming anyone, it's just a fact. If you made that mistake, as
experienced as you are, we can expect from all the newcomers to do it.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Hplhpi8yEJNNWiIl--
