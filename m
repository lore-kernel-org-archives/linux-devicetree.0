From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 10/12] arm64: allwinner: a64: add DTSI
 file for AXP803 PMIC
Date: Tue, 18 Apr 2017 15:20:09 +0800
Message-ID: <CAGb2v64DRQeKAkBiVCLTpsGGi3vSYzztthmgCt1z6HeCRb0PHQ@mail.gmail.com>
References: <20170417115747.7300-1-icenowy@aosc.io> <20170417115747.7300-11-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQX423DQKGQE3XFEV3A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170417115747.7300-11-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Apr 17, 2017 at 7:57 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> As nearly all A64 boards are using AXP803 PMIC, add a DTSI file for it,
> like the old DTSI files for AXP20x/22x, for the common parts of the
> PMIC.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm64/boot/dts/allwinner/axp803.dtsi | 150 ++++++++++++++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/axp803.dtsi
>
> diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
> new file mode 100644
> index 000000000000..f0e53a7fffbd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
> @@ -0,0 +1,150 @@
> +/*
> + * Copyright 2017 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
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
> +/*
> + * AXP803 Integrated Power Management Chip
> + * http://files.pine64.org/doc/datasheet/pine64/AXP803_Datasheet_V1.0.pdf
> + */
> +
> +&axp803 {
> +       interrupt-controller;
> +       #interrupt-cells = <1>;
> +
> +       regulators {
> +               /* Default work frequency for buck regulators */
> +               x-powers,dcdc-freq = <3000>;
> +
> +               reg_dcdc1: dcdc1 {
> +                       regulator-name = "dcdc1";
> +               };
> +
> +               reg_dcdc2: dcdc2 {
> +                       regulator-name = "dcdc2";
> +               };
> +
> +               reg_dcdc3: dcdc3 {
> +                       regulator-name = "dcdc3";
> +               };
> +
> +               reg_dcdc4: dcdc4 {
> +                       regulator-name = "dcdc4";
> +               };
> +
> +               reg_dcdc5: dcdc5 {
> +                       regulator-name = "dcdc5";
> +               };
> +
> +               reg_dcdc6: dcdc6 {
> +                       regulator-name = "dcdc6";
> +               };
> +
> +               reg_dc1sw: dc1sw {
> +                       regulator-name = "dc1sw";
> +               };
> +
> +               reg_aldo1: aldo1 {
> +                       regulator-name = "aldo1";
> +               };
> +
> +               reg_aldo2: aldo2 {
> +                       regulator-name = "aldo2";
> +               };
> +
> +               reg_aldo3: aldo3 {
> +                       regulator-name = "aldo3";
> +               };
> +
> +               reg_dldo1: dldo1 {
> +                       regulator-name = "dldo1";
> +               };
> +
> +               reg_dldo2: dldo2 {
> +                       regulator-name = "dldo2";
> +               };
> +
> +               reg_dldo3: dldo3 {
> +                       regulator-name = "dldo3";
> +               };
> +
> +               reg_dldo4: dldo4 {
> +                       regulator-name = "dldo4";
> +               };
> +
> +               reg_eldo1: eldo1 {
> +                       regulator-name = "eldo1";
> +               };
> +
> +               reg_eldo2: eldo2 {
> +                       regulator-name = "eldo2";
> +               };
> +
> +               reg_eldo3: eldo3 {
> +                       regulator-name = "eldo3";
> +               };
> +
> +               reg_fldo1: fldo1 {
> +                       regulator-name = "fldo1";
> +               };
> +
> +               reg_fldo2: fldo2 {
> +                       regulator-name = "fldo2";
> +               };
> +
> +               reg_ldo_io0: ldo_io0 {
> +                       regulator-name = "ldo_io0";

Please use hyphens instead of underscores for the node name,
and preferably, for the regulator name as well.

ChenYu
