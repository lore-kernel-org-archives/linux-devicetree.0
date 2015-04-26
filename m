From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/6] ARM: dts: berlin: relicense the berlin2q dtsi under
 GPLv2/X11
Date: Sun, 26 Apr 2015 23:19:48 +0200
Message-ID: <20150426211948.GB3872@piout.net>
References: <1430057013-12842-1-git-send-email-antoine.tenart@free-electrons.com>
 <1430057013-12842-2-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430057013-12842-2-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 26/04/2015 at 16:03:28 +0200, Antoine T=E9nart wrote :
> The current GPLv2 only licensing on this dtsi makes it very impractic=
al
> for other software components licensed under another license.
>=20
> In order to make it easier for them to reuse our device trees, relice=
nse
> this dtsi under a GPLv2/X11 dual-license.
>=20
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

> ---
>  arch/arm/boot/dts/berlin2q.dtsi | 34 +++++++++++++++++++++++++++++++=
---
>  1 file changed, 31 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berl=
in2q.dtsi
> index be5397288d24..703ce384e0d7 100644
> --- a/arch/arm/boot/dts/berlin2q.dtsi
> +++ b/arch/arm/boot/dts/berlin2q.dtsi
> @@ -1,9 +1,37 @@
>  /*
>   * Copyright (C) 2014 Antoine T=E9nart <antoine.tenart@free-electron=
s.com>
>   *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dua=
l
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is licensed under the terms of the GNU General Publ=
ic
> + *     License version 2. This program is licensed "as is" without a=
ny
> + *     warranty of any kind, whether express or implied.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentatio=
n
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom th=
e
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall b=
e
> + *     included in all copies or substantial portions of the Softwar=
e.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIN=
D,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTI=
ES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
>   */
> =20
>  #include <dt-bindings/clock/berlin2q.h>
> --=20
> 2.3.6
>=20

--=20
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
