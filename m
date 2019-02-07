From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/6] mfd: mt6397: extract irq related code from core
 driver
Date: Thu, 7 Feb 2019 09:08:30 +0000
Message-ID: <20190207090830.GG4672@dell>
References: <1548839891-20932-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1548839891-20932-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548839891-20932-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, 30 Jan 2019, Hsin-Hsiung Wang wrote:

> In order to support different types of irq design,
> we decide to add separate irq drivers for different
> design and keep mt6397 mfd core simple and reusable
> to all generations of PMICs so far.

Why have you cut these lines so short?

In all cases:

 s/irq/IRQ/
 s/mfd/MFD
 s/mt6397/MT6397/

> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile            |   2 +-
>  drivers/mfd/mt6397-core.c       | 235 +++++++---------------------------------
>  drivers/mfd/mt6397-irq.c        | 214 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h |  12 ++
>  4 files changed, 265 insertions(+), 198 deletions(-)
>  create mode 100644 drivers/mfd/mt6397-irq.c
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 12980a4..088e249 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -230,7 +230,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
> -obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o
> +obj-$(CONFIG_MFD_MT6397)	+= mt6397-core.o mt6397-irq.o
>  
>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
>  obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 77b64bd..a72524d 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -12,23 +12,19 @@
>   * GNU General Public License for more details.
>   */
>  
> -#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/core.h>

> -#include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/core.h>
> -#include <linux/mfd/mt6397/registers.h>
> +#include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6397/registers.h>

I will ignore these unrelated changes!

>  #define MT6397_RTC_BASE		0xe000
>  #define MT6397_RTC_SIZE		0x3e
>  
> -#define MT6323_CID_CODE		0x23
> -#define MT6391_CID_CODE		0x91
> -#define MT6397_CID_CODE		0x97

CID_CODE is a bit cryptic.

Why not use *_CHIP_ID instead?

[...]

> +static const struct chip_data mt6323_core = {
> +	.cid_addr = MT6323_CID,
> +};

Does the chip ID address change from device to device?

If not, you can get rid of all of this hoop jumping.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
