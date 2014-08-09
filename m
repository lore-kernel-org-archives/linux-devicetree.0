From: Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH] ARM: dts: Gateworks GW5520 support (i.MX6)
Date: Sat, 09 Aug 2014 21:20:08 +1200
Message-ID: <53E5E7C8.7020803@prisktech.co.nz>
References: <1407572602-14017-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1407572602-14017-1-git-send-email-tharvey@gateworks.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tim Harvey <tharvey@gateworks.com>, Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


On 09/08/14 20:23, Tim Harvey wrote:
> Add support for the Gateworks GW5520 board.
>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>   arch/arm/boot/dts/Makefile            |   2 +
>   arch/arm/boot/dts/imx6dl-gw552x.dts   |  20 +++
>   arch/arm/boot/dts/imx6q-gw552x.dts    |  24 +++
>   arch/arm/boot/dts/imx6qdl-gw552x.dtsi | 282 ++++++++++++++++++++++++++++++++++
>   4 files changed, 328 insertions(+)
>   create mode 100644 arch/arm/boot/dts/imx6dl-gw552x.dts
>   create mode 100644 arch/arm/boot/dts/imx6q-gw552x.dts
>   create mode 100644 arch/arm/boot/dts/imx6qdl-gw552x.dtsi
...

> diff --git a/arch/arm/boot/dts/imx6dl-gw552x.dts b/arch/arm/boot/dts/imx6dl-gw552x.dts
> new file mode 100644
> index 0000000..a4b700c
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6dl-gw552x.dts
> @@ -0,0 +1,20 @@
> +/*
> + * Copyright 2014 Gateworks Corporation
> + *
> + * The code contained herein is licensed under the GNU General Public
> + * License. You may obtain a copy of the GNU General Public License
> + * Version 2 or later at the following locations:
> + *
> + * http://www.opensource.org/licenses/gpl-license.html
> + * http://www.gnu.org/copyleft/gpl.html
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6dl.dtsi"
> +#include "imx6qdl-gw552x.dtsi"
> +
> +/ {
> +	model = "Gateworks Ventana i.MX6 DualLite/Solo GW552X";
> +	compatible = "gw,imx6dl-gw552x", "gw,ventana", "fsl,imx6dl";
> +};
I don't see 'gw' in the device tree vendor prefixes, so it should to be 
added to Documentation/devicetree/bindings/vendor-prefixes.txt as well.

Regards
Tony Prisk
