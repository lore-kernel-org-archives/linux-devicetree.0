From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/5] ARM: dts: sun4i: Add Itead A10 Core support
Date: Mon, 18 Jan 2016 20:44:10 +0100
Message-ID: <20160118194410.GS4581@lukather>
References: <1452766555-16409-1-git-send-email-codekipper@gmail.com>
 <1452766555-16409-5-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQqDiQVflaif2hna"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBC4B6W2AKGQEIZVXI5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452766555-16409-5-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--NQqDiQVflaif2hna
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Thu, Jan 14, 2016 at 11:15:54AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> The A10 Itead Core module comes with 4GB NAND and 1GB DDR RAM. All of the
> I/O interfaces are exposed via 4 groups of 2*30 1mm pitched female headers.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun4i-a10-itead-core.dtsi | 86 +++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun4i-a10-itead-core.dtsi
> 
> diff --git a/arch/arm/boot/dts/sun4i-a10-itead-core.dtsi b/arch/arm/boot/dts/sun4i-a10-itead-core.dtsi
> new file mode 100644
> index 0000000..97f653a
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun4i-a10-itead-core.dtsi
> @@ -0,0 +1,86 @@
> +/*
> + * Copyright 2015 - Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
> +#include "sun4i-a10.dtsi"
> +#include "sunxi-itead-core-common.dtsi"
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins_a>;
> +	status = "okay";
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupts = <0>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1400000>;
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
> -- 
> 2.7.0

Is there any difference with the A20 one?

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--NQqDiQVflaif2hna--
