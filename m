From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm/mx5: parse iomuxc pad configuratoin from device
	tree
Date: Tue, 26 Jul 2011 08:39:14 +0200
Message-ID: <20110726063914.GB20587@pengutronix.de>
References: <1311606467-28985-1-git-send-email-shawn.guo@linaro.org>
	<1311606467-28985-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1311606467-28985-2-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 25, 2011 at 11:07:46PM +0800, Shawn Guo wrote:
> It adds function mxc_iomuxc_dt_init() to parse iomuxc pad configuration
> from device tree.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/fsl/iomuxc.txt         |   47 +++++++++++++
>  arch/arm/mach-mx5/Makefile                         |    2 +
>  arch/arm/mach-mx5/iomuxc-dt.c                      |   72 ++++++++++++++++++++
>  arch/arm/plat-mxc/include/mach/common.h            |    3 +
>  4 files changed, 124 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/fsl/iomuxc.txt
>  create mode 100644 arch/arm/mach-mx5/iomuxc-dt.c
> 
> + */
> +
> +#include <linux/of.h>
> +#include <asm/io.h>

linux/io.h

> +
> +#define IOMUXC_CONFIG_SION	(1 << 4)
> +
> +void mxc_iomuxc_dt_init(const struct of_device_id *match)
> +{
> +	struct device_node *node = of_find_matching_node(NULL, match);
> +	struct device_node *child;
> +	void __iomem *base;
> +	u32 reg[2], select_input[2];
> +	u32 mux_mode, pad_ctl;
> +
> +	if (!node) {
> +		pr_warn("%s: no iomuxc node found\n", __func__);
> +		return;
> +	}

Please remove this warning. Some boards may intentionally do the iomux
setup in the bootloader and skip the iomux setup nodes in the device
tree.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
