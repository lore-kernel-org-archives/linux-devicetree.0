From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v4 8/8] arm64: dts: rockchip: Add Landingship config
Date: Tue, 29 Mar 2016 22:18:59 +0200
Message-ID: <3754303.PKl0CGdnnX@diego>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
 <1458136727-32075-9-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1458136727-32075-9-git-send-email-afaerber@suse.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 16. M=E4rz 2016, 14:58:46 schrieb Andreas F=E4rber:

This needs a commit message explaining the i2c1/i2c2 voodoo below - especia=
lly =

as this is the only difference to the core geekbox board.

And I'm still not fully convinced about having the landing ship separate.
I guess I'll just go to the talk about "Portable Device Tree Connector: =

Painless Expansion Board Support" [0] on monday to help make up my mind ;-)=
 .


Heiko


[0] http://openiotelc2016.sched.org/event/6DA4/portable-device-tree-connect=
or-painless-expansion-board-support-pantelis-antoniou-konsulko-group


> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---
>  v3 -> v4: Unchanged
> =

>  v2 -> v3:
>  * Changed compatible string to include geekbox- (Heiko)
>  * Rebroke compatible strings line
>  * Disabled i2c1 to avoid hang (next-20160304)
> =

>  v2: New - showcases inclusion of GeekBox module config
> =

>  arch/arm64/boot/dts/rockchip/Makefile              |  1 +
>  .../dts/rockchip/rk3368-geekbox-landingship.dts    | 57
> ++++++++++++++++++++++ 2 files changed, 58 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts
> =

> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile index df37865e8ced..201bcd9863ce
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox-landingship.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
> =

>  always		:=3D $(dtb-y)
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts
> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts new file mo=
de
> 100644
> index 000000000000..a28ace9512bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox-landingship.dts
> @@ -0,0 +1,57 @@
> +/*
> + * Copyright (c) 2016 Andreas F=E4rber
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
> +#include "rk3368-geekbox.dts"
> +
> +/ {
> +	model =3D "GeekBox on Landingship";
> +	compatible =3D "geekbuying,geekbox-landingship",
> +		     "geekbuying,geekbox", "rockchip,rk3368";
> +};
> +
> +&i2c1 {
> +	status =3D "disabled";
> +};
> +
> +&i2c2 {
> +	status =3D "okay";
> +};
