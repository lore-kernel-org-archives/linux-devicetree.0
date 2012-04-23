From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: Add basic support for imx6q-sabresd
Date: Mon, 23 Apr 2012 09:16:28 +0800
Message-ID: <20120423011626.GG26306@S2101-09.ap.freescale.net>
References: <1335028028-3214-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335028028-3214-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 21, 2012 at 02:07:08PM -0300, Fabio Estevam wrote:
> Add basic support for imx6q-sabresd.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Changes since v2:
> - Add SDHC2 and SDHC3 support
> 
> Changes since v1:
> 
> - Added entry into Documentation
> - Added entry in arch/arm/mach-imx/Makefile.boot
> - Fixed ethernet
> - Dropped SDHC for now
>  Documentation/devicetree/bindings/arm/fsl.txt |    4 ++
>  arch/arm/boot/dts/imx6q-sabresd.dts           |   54 +++++++++++++++++++++++++
>  arch/arm/mach-imx/Makefile.boot               |    3 +-
>  arch/arm/mach-imx/mach-imx6q.c                |    1 +
>  4 files changed, 61 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx6q-sabresd.dts
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index fecb580..0fc2da7 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -33,6 +33,10 @@ i.MX6 Quad SABRE Lite Board
>  Required root node properties:
>      - compatible = "fsl,imx6q-sabrelite", "fsl,imx6q";
>  
> +i.MX6 Quad SABRE Smart Device Board
> +Required root node properties:
> +    - compatible = "fsl,imx6q-sabresd", "fsl,imx6q";
> +
>  Generic i.MX boards
>  -------------------
>  
> diff --git a/arch/arm/boot/dts/imx6q-sabresd.dts b/arch/arm/boot/dts/imx6q-sabresd.dts
> new file mode 100644
> index 0000000..93d1e17
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx6q-sabresd.dts
> @@ -0,0 +1,54 @@
> +/*
> + * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2011 Linaro Ltd.
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
> +/include/ "imx6q.dtsi"
> +
> +/ {
> +	model = "Freescale i.MX6Q SABRE Smart Device Board";
> +	compatible = "fsl,imx6q-sabresd", "fsl,imx6q";
> +
> +	memory {
> +		reg = <0x10000000 0x40000000>;
> +	};
> +
> +	soc {
> +
> +		aips-bus@02000000 { /* AIPS1 */
> +			spba-bus@02000000 {
> +				uart1: uart@02020000 {

I have it rebased on imx/dt branch, where node name has been renamed
to serial.

> +				status = "okay";

It misses one tab indent.

> +				};
> +			};
> +		};
> +
> +		aips-bus@02100000 { /* AIPS2 */
> +			enet@02188000 {
> +				phy-mode = "rgmii";
> +				status = "okay";
> +			};
> +
> +			usdhc@02194000 { /* uSDHC2 */
> +				cd-gpios = <&gpio2 2 0>;
> +				wp-gpios = <&gpio2 3 0>;
> +				status = "okay";
> +			};
> +
> +			usdhc@02198000 { /* uSDHC3 */
> +				cd-gpios = <&gpio2 0 0>;
> +				wp-gpios = <&gpio2 1 0>;
> +				status = "okay";
> +			};
> +

Unnecessary new line.

I fixed all above and applied the patch, thanks.

Regards,
Shawn

> +		};
> +	};
> +};
> diff --git a/arch/arm/mach-imx/Makefile.boot b/arch/arm/mach-imx/Makefile.boot
> index 3851d8a..05541cf 100644
> --- a/arch/arm/mach-imx/Makefile.boot
> +++ b/arch/arm/mach-imx/Makefile.boot
> @@ -42,4 +42,5 @@ dtb-$(CONFIG_MACH_IMX51_DT) += imx51-babbage.dtb
>  dtb-$(CONFIG_MACH_IMX53_DT) += imx53-ard.dtb imx53-evk.dtb \
>  			       imx53-qsb.dtb imx53-smd.dtb
>  dtb-$(CONFIG_SOC_IMX6Q)	+= imx6q-arm2.dtb \
> -			   imx6q-sabrelite.dtb
> +			   imx6q-sabrelite.dtb \
> +			   imx6q-sabresd.dtb \
> diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
> index da6c1d9..512c18d 100644
> --- a/arch/arm/mach-imx/mach-imx6q.c
> +++ b/arch/arm/mach-imx/mach-imx6q.c
> @@ -132,6 +132,7 @@ static struct sys_timer imx6q_timer = {
>  static const char *imx6q_dt_compat[] __initdata = {
>  	"fsl,imx6q-arm2",
>  	"fsl,imx6q-sabrelite",
> +	"fsl,imx6q-sabresd",
>  	"fsl,imx6q",
>  	NULL,
>  };
> -- 
> 1.7.1
> 
