From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: DTS armada: Add support for 2 more mvebu model
Date: Fri, 3 Mar 2017 18:26:38 +0100
Message-ID: <20170303172638.GD1488@lunn.ch>
References: <1488560855-421-1-git-send-email-ansuelsmth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1488560855-421-1-git-send-email-ansuelsmth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>, jason@lakedaemon.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, gregory.clement@free-electrons.com, Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Mar 03, 2017 at 06:07:35PM +0100, Ansuel Smith wrote:
> This patch add support for 2 Linksys router model
> (shelby and rango). With this we now support all
> the mvebu board on the market.
> =

> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/armada-385-linksys-rango.dts  | 443 ++++++++++++++++++=
++++++
>  arch/arm/boot/dts/armada-385-linksys-shelby.dts | 115 ++++++
>  2 files changed, 558 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-385-linksys-rango.dts
>  create mode 100644 arch/arm/boot/dts/armada-385-linksys-shelby.dts
> =

> diff --git a/arch/arm/boot/dts/armada-385-linksys-rango.dts b/arch/arm/bo=
ot/dts/armada-385-linksys-rango.dts
> new file mode 100644
> index 0000000..61f4592
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-385-linksys-rango.dts
> @@ -0,0 +1,443 @@
> +/*
> + * Device Tree file for the Linksys WRT3200ACM (Rango)
> + *
> + * Copyright (C) 2016 Imre Kaloz <kaloz@openwrt.org>
> + *
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is licensed under the terms of the GNU General Public
> + *     License version 2.  This program is licensed "as is" without
> + *     any warranty of any kind, whether express or implied.
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
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "armada-385.dtsi"

Hi Ansuel

Please could you explain why you did not use armada-385-linksys.dtsi

Thanks
	Andrew
