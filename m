From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 3/5] usb: phy: add usb3.0 phy driver for mt65xx SoCs
Date: Wed, 22 Jul 2015 09:21:57 -0500
Message-ID: <20150722142157.GA10467@saruman.tx.rr.com>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
 <1437573945-31586-4-git-send-email-chunfeng.yun@mediatek.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1116378172387360475=="
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1437573945-31586-4-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1116378172387360475==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 22, 2015 at 10:05:43PM +0800, Chunfeng Yun wrote:
> support usb3.0 phy of mt65xx SoCs
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

you missed Kishon here.

> ---
>  drivers/phy/Kconfig           |   9 +
>  drivers/phy/Makefile          |   1 +
>  drivers/phy/phy-mt65xx-usb3.c | 426 ++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 436 insertions(+)
>  create mode 100644 drivers/phy/phy-mt65xx-usb3.c
>=20
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index c0e6ede..019cf8b 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -193,6 +193,15 @@ config PHY_HIX5HD2_SATA
>  	help
>  	  Support for SATA PHY on Hisilicon hix5hd2 Soc.
> =20
> +config PHY_MT65XX_USB3
> +	tristate "Mediatek USB3.0 PHY Driver"
> +	depends on ARCH_MEDIATEK && OF
> +	select GENERIC_PHY
> +	help
> +	  Say 'Y' here to add support for Mediatek USB3.0 PHY driver
> +	  for mt65xx SoCs. it supports two usb2.0 ports and
> +	  one usb3.0 port.
> +
>  config PHY_SUN4I_USB
>  	tristate "Allwinner sunxi SoC USB PHY driver"
>  	depends on ARCH_SUNXI && HAS_IOMEM && OF
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index f344e1b..3ceff2a 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_TI_PIPE3)			+=3D phy-ti-pipe3.o
>  obj-$(CONFIG_TWL4030_USB)		+=3D phy-twl4030-usb.o
>  obj-$(CONFIG_PHY_EXYNOS5250_SATA)	+=3D phy-exynos5250-sata.o
>  obj-$(CONFIG_PHY_HIX5HD2_SATA)		+=3D phy-hix5hd2-sata.o
> +obj-$(CONFIG_PHY_MT65XX_USB3)		+=3D phy-mt65xx-usb3.o
>  obj-$(CONFIG_PHY_SUN4I_USB)		+=3D phy-sun4i-usb.o
>  obj-$(CONFIG_PHY_SUN9I_USB)		+=3D phy-sun9i-usb.o
>  obj-$(CONFIG_PHY_SAMSUNG_USB2)		+=3D phy-exynos-usb2.o
> diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
> new file mode 100644
> index 0000000..5da4534
> --- /dev/null
> +++ b/drivers/phy/phy-mt65xx-usb3.c
> @@ -0,0 +1,426 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: Chunfeng.Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/resource.h>
> +
> +/*
> + * for sifslv2 register
> + * relative to USB3_SIF2_BASE base address
> + */
> +#define SSUSB_SIFSLV_SPLLC	(0x0000)
> +#define SSUSB_SIFSLV_U2PHY_COM_BASE	(0x0800)
> +#define SSUSB_SIFSLV_U3PHYD_BASE	(0x0900)
> +#define SSUSB_USB30_PHYA_SIV_B_BASE	(0x0b00)
> +#define SSUSB_SIFSLV_U3PHYA_DA_BASE	(0x0c00)
> +
> +/*port1 refs. +0x800(refer to port0)*/
> +#define U3P_PORT_INTERVAL (0x800)	/*based on port0 */
> +#define U3P_PHY_DELTA(index) ((U3P_PORT_INTERVAL) * (index))
> +
> +#define U3P_USBPHYACR0	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0000)
> +#define PA0_RG_U2PLL_FORCE_ON	(0x1 << 15)
> +
> +#define U3P_USBPHYACR2	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0008)
> +#define PA2_RG_SIF_U2PLL_FORCE_EN	(0x1 << 18)
> +
> +#define U3P_USBPHYACR5	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0014)
> +#define PA5_RG_U2_HSTX_SRCTRL		(0x7 << 12)
> +#define PA5_RG_U2_HSTX_SRCTRL_VAL(x)	((0x7 & (x)) << 12)
> +#define PA5_RG_U2_HS_100U_U3_EN		(0x1 << 11)
> +
> +#define U3P_USBPHYACR6	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0018)
> +#define PA6_RG_U2_ISO_EN		(0x1 << 31)
> +#define PA6_RG_U2_BC11_SW_EN	(0x1 << 23)
> +#define PA6_RG_U2_OTG_VBUSCMP_EN	(0x1 << 20)
> +
> +#define U3P_U2PHYACR4	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0020)
> +#define P2C_RG_USB20_GPIO_CTL	(0x1 << 9)
> +#define P2C_USB20_GPIO_MODE	(0x1 << 8)
> +#define P2C_U2_GPIO_CTR_MSK	(P2C_RG_USB20_GPIO_CTL | P2C_USB20_GPIO_MODE)
> +
> +#define U3D_U2PHYDCR0	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0060)
> +#define P2C_RG_SIF_U2PLL_FORCE_ON	(0x1 << 24)
> +
> +#define U3P_U2PHYDTM0	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0068)
> +#define P2C_FORCE_UART_EN	(0x1 << 26)
> +#define P2C_FORCE_DATAIN	(0x1 << 23)
> +#define P2C_FORCE_DM_PULLDOWN	(0x1 << 21)
> +#define P2C_FORCE_DP_PULLDOWN	(0x1 << 20)
> +#define P2C_FORCE_XCVRSEL	(0x1 << 19)
> +#define P2C_FORCE_SUSPENDM	(0x1 << 18)
> +#define P2C_FORCE_TERMSEL	(0x1 << 17)
> +#define P2C_RG_DATAIN		(0xf << 10)
> +#define P2C_RG_DATAIN_VAL(x)	((0xf & (x)) << 10)
> +#define P2C_RG_DMPULLDOWN	(0x1 << 7)
> +#define P2C_RG_DPPULLDOWN	(0x1 << 6)
> +#define P2C_RG_XCVRSEL		(0x3 << 4)
> +#define P2C_RG_XCVRSEL_VAL(x)	((0x3 & (x)) << 4)
> +#define P2C_RG_SUSPENDM		(0x1 << 3)
> +#define P2C_RG_TERMSEL		(0x1 << 2)
> +#define P2C_DTM0_PART_MASK \
> +		(P2C_FORCE_DATAIN | P2C_FORCE_DM_PULLDOWN | \
> +		P2C_FORCE_DP_PULLDOWN | P2C_FORCE_XCVRSEL | \
> +		P2C_FORCE_TERMSEL | P2C_RG_DMPULLDOWN | \
> +		P2C_RG_DPPULLDOWN | P2C_RG_TERMSEL)
> +
> +#define U3P_U2PHYDTM1	(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x006C)
> +#define P2C_RG_UART_EN		(0x1 << 16)
> +#define P2C_RG_VBUSVALID	(0x1 << 5)
> +#define P2C_RG_SESSEND		(0x1 << 4)
> +#define P2C_RG_AVALID		(0x1 << 2)
> +
> +#define U3P_U3_PHYA_REG0	(SSUSB_USB30_PHYA_SIV_B_BASE + 0x0000)
> +#define P3A_RG_U3_VUSB10_ON	(1 << 5)
> +
> +#define U3P_U3_PHYA_REG6	(SSUSB_USB30_PHYA_SIV_B_BASE + 0x0018)
> +#define P3A_RG_TX_EIDLE_CM	(0xf << 28)
> +#define P3A_RG_TX_EIDLE_CM_VAL(x)	((0xf & (x)) << 28)
> +
> +#define U3P_U3_PHYA_REG9	(SSUSB_USB30_PHYA_SIV_B_BASE + 0x0024)
> +#define P3A_RG_RX_DAC_MUX	(0x1f << 1)
> +#define P3A_RG_RX_DAC_MUX_VAL(x)	((0x1f & (x)) << 1)
> +
> +#define U3P_U3PHYA_DA_REG0	(SSUSB_SIFSLV_U3PHYA_DA_BASE + 0x0)
> +#define P3A_RG_XTAL_EXT_EN_U3	(0x3 << 10)
> +#define P3A_RG_XTAL_EXT_EN_U3_VAL(x)	((0x3 & (x)) << 10)
> +
> +#define U3P_PHYD_CDR1	(SSUSB_SIFSLV_U3PHYD_BASE + 0x5c)
> +#define P3D_RG_CDR_BIR_LTD1		(0x1f << 24)
> +#define P3D_RG_CDR_BIR_LTD1_VAL(x)	((0x1f & (x)) << 24)
> +#define P3D_RG_CDR_BIR_LTD0		(0x1f << 8)
> +#define P3D_RG_CDR_BIR_LTD0_VAL(x)	((0x1f & (x)) << 8)
> +
> +#define U3P_XTALCTL3		(SSUSB_SIFSLV_SPLLC + 0x18)
> +#define XC3_RG_U3_XTAL_RX_PWD		(0x1 << 9)
> +#define XC3_RG_U3_FRC_XTAL_RX_PWD	(0x1 << 8)
> +
> +#define MT65XX_MAX_PHYS	2
> +
> +struct mt65xx_phy_instance {
> +	struct phy *phy;
> +	u32 index;
> +	u32 delta; /* increament refers to port0 */
> +};
> +
> +struct mt65xx_u3phy {
> +	struct device *dev;
> +	void __iomem *sif_base;	/* include sif2 */
> +	struct clk *u3phya_ref;	/* reference clock of usb3 anolog phy */
> +	struct mt65xx_phy_instance phys[MT65XX_MAX_PHYS];
> +};
> +
> +static struct mt65xx_u3phy *to_usbdrd_phy(
> +	struct mt65xx_phy_instance *instance)
> +{
> +	return container_of((instance), struct mt65xx_u3phy,
> +			    phys[(instance)->index]);
> +}
> +
> +static void phy_instance_init(struct mt65xx_phy_instance *instance)
> +{
> +	struct mt65xx_u3phy *u3phy =3D to_usbdrd_phy(instance);
> +	void __iomem *sif_base =3D u3phy->sif_base + instance->delta;
> +	u32 index =3D instance->index;
> +	u32 tmp;
> +
> +	/* switch to USB function. (system register, force ip into usb mode) */
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM0);
> +	tmp &=3D ~P2C_FORCE_UART_EN;
> +	writel(tmp, sif_base + U3P_U2PHYDTM0);
> +
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM1);
> +	tmp &=3D ~P2C_RG_UART_EN;
> +	writel(tmp, sif_base + U3P_U2PHYDTM1);
> +
> +	if (!index) {
> +		tmp =3D readl(sif_base + U3P_U2PHYACR4);
> +		tmp &=3D ~P2C_U2_GPIO_CTR_MSK;
> +		writel(tmp, sif_base + U3P_U2PHYACR4);
> +	}
> +
> +	/* DP/DM BC1.1 path Disable */
> +	tmp =3D readl(sif_base + U3P_USBPHYACR6);
> +	tmp &=3D ~PA6_RG_U2_BC11_SW_EN;
> +	writel(tmp, sif_base + U3P_USBPHYACR6);
> +
> +	tmp =3D readl(sif_base + U3P_U3PHYA_DA_REG0);
> +	tmp &=3D ~P3A_RG_XTAL_EXT_EN_U3;
> +	tmp |=3D P3A_RG_XTAL_EXT_EN_U3_VAL(2);
> +	writel(tmp, sif_base + U3P_U3PHYA_DA_REG0);
> +
> +	tmp =3D readl(sif_base + U3P_U3_PHYA_REG9);
> +	tmp &=3D ~P3A_RG_RX_DAC_MUX;
> +	tmp |=3D P3A_RG_RX_DAC_MUX_VAL(4);
> +	writel(tmp, sif_base + U3P_U3_PHYA_REG9);
> +
> +	tmp =3D readl(sif_base + U3P_U3_PHYA_REG6);
> +	tmp &=3D ~P3A_RG_TX_EIDLE_CM;
> +	tmp |=3D P3A_RG_TX_EIDLE_CM_VAL(0xe);
> +	writel(tmp, sif_base + U3P_U3_PHYA_REG6);
> +
> +	tmp =3D readl(sif_base + U3P_PHYD_CDR1);
> +	tmp &=3D ~(P3D_RG_CDR_BIR_LTD0 | P3D_RG_CDR_BIR_LTD1);
> +	tmp |=3D P3D_RG_CDR_BIR_LTD0_VAL(0xc) | P3D_RG_CDR_BIR_LTD1_VAL(0x3);
> +	writel(tmp, sif_base + U3P_PHYD_CDR1);
> +
> +	dev_dbg(u3phy->dev, "%s(%d)\n", __func__, index);
> +}
> +
> +static void phy_instance_power_on(struct mt65xx_phy_instance *instance)
> +{
> +	struct mt65xx_u3phy *u3phy =3D to_usbdrd_phy(instance);
> +	void __iomem *sif_base =3D u3phy->sif_base + instance->delta;
> +	u32 index =3D instance->index;
> +	u32 tmp;
> +
> +	if (!index) {
> +		/* Set RG_SSUSB_VUSB10_ON as 1 after VUSB10 ready */
> +		tmp =3D readl(sif_base + U3P_U3_PHYA_REG0);
> +		tmp |=3D P3A_RG_U3_VUSB10_ON;
> +		writel(tmp, sif_base + U3P_U3_PHYA_REG0);
> +	}
> +
> +	/* (force_suspendm=3D0) (let suspendm=3D1, enable usb 480MHz pll) */
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM0);
> +	tmp &=3D ~(P2C_FORCE_SUSPENDM | P2C_RG_XCVRSEL);
> +	tmp &=3D ~(P2C_RG_DATAIN | P2C_DTM0_PART_MASK);
> +	writel(tmp, sif_base + U3P_U2PHYDTM0);
> +
> +	/* OTG Enable */
> +	tmp =3D readl(sif_base + U3P_USBPHYACR6);
> +	tmp |=3D PA6_RG_U2_OTG_VBUSCMP_EN;
> +	writel(tmp, sif_base + U3P_USBPHYACR6);
> +
> +	if (!index) {
> +		tmp =3D readl(sif_base + U3P_XTALCTL3);
> +		tmp |=3D XC3_RG_U3_XTAL_RX_PWD | XC3_RG_U3_FRC_XTAL_RX_PWD;
> +		writel(tmp, sif_base + U3P_XTALCTL3);
> +		/* [mt8173]disable Change 100uA current from SSUSB */
> +		tmp =3D readl(sif_base + U3P_USBPHYACR5);
> +		tmp &=3D ~PA5_RG_U2_HS_100U_U3_EN;
> +		writel(tmp, sif_base + U3P_USBPHYACR5);
> +	}
> +	udelay(800);
> +
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM1);
> +	tmp |=3D P2C_RG_VBUSVALID | P2C_RG_AVALID;
> +	tmp &=3D ~P2C_RG_SESSEND;
> +	writel(tmp, sif_base + U3P_U2PHYDTM1);
> +	/* USB 2.0 slew rate calibration */
> +	tmp =3D readl(sif_base + U3P_USBPHYACR5);
> +	tmp &=3D ~PA5_RG_U2_HSTX_SRCTRL;
> +	tmp |=3D PA5_RG_U2_HSTX_SRCTRL_VAL(4);
> +	writel(tmp, sif_base + U3P_USBPHYACR5);
> +
> +	dev_dbg(u3phy->dev, "%s(%d)(delta: 0x%x)\n", __func__,
> +		index, u3phy->phys[index].delta);
> +}
> +
> +static void phy_instance_power_off(struct mt65xx_phy_instance *instance)
> +{
> +	struct mt65xx_u3phy *u3phy =3D to_usbdrd_phy(instance);
> +	void __iomem *sif_base =3D u3phy->sif_base + instance->delta;
> +	u32 index =3D instance->index;
> +	u32 tmp;
> +
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM0);
> +	tmp &=3D ~(P2C_RG_XCVRSEL | P2C_RG_DATAIN);
> +	tmp |=3D P2C_RG_XCVRSEL_VAL(1) | P2C_RG_DATAIN_VAL(0);
> +	tmp |=3D P2C_FORCE_SUSPENDM;
> +	writel(tmp, sif_base + U3P_U2PHYDTM0);
> +
> +	/* OTG Disable */
> +	tmp =3D readl(sif_base + U3P_USBPHYACR6);
> +	tmp &=3D ~PA6_RG_U2_OTG_VBUSCMP_EN;
> +	writel(tmp, sif_base + U3P_USBPHYACR6);
> +	if (!index) {
> +		/* (also disable)Change 100uA current switch to USB2.0 */
> +		tmp =3D readl(sif_base + U3P_USBPHYACR5);
> +		tmp &=3D ~PA5_RG_U2_HS_100U_U3_EN;
> +		writel(tmp, sif_base + U3P_USBPHYACR5);
> +	}
> +	udelay(800);
> +
> +	/* let suspendm=3D0, set utmi into analog power down */
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM0);
> +	tmp &=3D ~P2C_RG_SUSPENDM;
> +	writel(tmp, sif_base + U3P_U2PHYDTM0);
> +	udelay(1);
> +
> +	tmp =3D readl(sif_base + U3P_U2PHYDTM1);
> +	tmp &=3D ~(P2C_RG_VBUSVALID | P2C_RG_AVALID);
> +	tmp |=3D P2C_RG_SESSEND;
> +	writel(tmp, sif_base + U3P_U2PHYDTM1);
> +
> +	if (!index) {
> +		tmp =3D readl(sif_base + U3P_U3_PHYA_REG0);
> +		tmp &=3D ~P3A_RG_U3_VUSB10_ON;
> +		writel(tmp, sif_base + U3P_U3_PHYA_REG0);
> +	}
> +
> +	dev_dbg(u3phy->dev, "%s(%d)\n", __func__, index);
> +}
> +
> +static int u3phy_clk_enable(struct mt65xx_u3phy *u3phy)
> +{
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(u3phy->u3phya_ref);
> +	if (ret) {
> +		dev_err(u3phy->dev, "failed to enable u3phya_ref\n");
> +		return ret;
> +	}
> +	udelay(100);
> +
> +	return 0;
> +}
> +
> +static int mt65xx_phy_init(struct phy *phy)
> +{
> +	struct mt65xx_phy_instance *instance =3D phy_get_drvdata(phy);
> +
> +	phy_instance_init(instance);
> +	return 0;
> +}
> +
> +static int mt65xx_phy_power_on(struct phy *phy)
> +{
> +	struct mt65xx_phy_instance *instance =3D phy_get_drvdata(phy);
> +
> +	phy_instance_power_on(instance);
> +	msleep(20);
> +	return 0;
> +}
> +
> +static int mt65xx_phy_power_off(struct phy *phy)
> +{
> +	struct mt65xx_phy_instance *instance =3D phy_get_drvdata(phy);
> +
> +	phy_instance_power_off(instance);
> +	return 0;
> +}
> +
> +static struct phy *mt65xx_phy_xlate(struct device *dev,
> +					struct of_phandle_args *args)
> +{
> +	struct mt65xx_u3phy *u3phy =3D dev_get_drvdata(dev);
> +
> +	if (WARN_ON(args->args[0] > MT65XX_MAX_PHYS))
> +		return ERR_PTR(-ENODEV);
> +
> +	return u3phy->phys[args->args[0]].phy;
> +}
> +
> +static struct phy_ops mt65xx_u3phy_ops =3D {
> +	.init		=3D mt65xx_phy_init,
> +	.power_on	=3D mt65xx_phy_power_on,
> +	.power_off	=3D mt65xx_phy_power_off,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct of_device_id mt65xx_u3phy_id_table[] =3D {
> +	{ .compatible =3D "mediatek,mt8173-u3phy",},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, mt65xx_u3phy_id_table);
> +
> +
> +static int mt65xx_u3phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct phy_provider *phy_provider;
> +	struct resource *sif_res;
> +	struct mt65xx_u3phy *u3phy;
> +	int i;
> +
> +	u3phy =3D devm_kzalloc(dev, sizeof(*u3phy), GFP_KERNEL);
> +	if (!u3phy)
> +		return -ENOMEM;
> +
> +	u3phy->dev =3D dev;
> +	platform_set_drvdata(pdev, u3phy);
> +
> +	sif_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	u3phy->sif_base =3D devm_ioremap_resource(dev, sif_res);
> +	if (IS_ERR(u3phy->sif_base)) {
> +		dev_err(dev, "failed to remap sif regs\n");
> +		return PTR_ERR(u3phy->sif_base);
> +	}
> +
> +	u3phy->u3phya_ref =3D devm_clk_get(dev, "u3phya_ref");
> +	if (IS_ERR(u3phy->u3phya_ref)) {
> +		dev_err(dev, "error to get u3phya_ref\n");
> +		return PTR_ERR(u3phy->u3phya_ref);
> +	}
> +
> +	for (i =3D 0; i < MT65XX_MAX_PHYS; i++) {
> +		struct mt65xx_phy_instance *instance;
> +		struct phy *phy;
> +
> +		phy =3D devm_phy_create(dev, NULL, &mt65xx_u3phy_ops);
> +		if (IS_ERR(phy)) {
> +			dev_err(dev, "failed to create mt65xx_u3phy phy\n");
> +			return PTR_ERR(phy);
> +		}
> +		instance =3D &u3phy->phys[i];
> +		instance->phy =3D phy;
> +		instance->index =3D i;
> +		instance->delta =3D U3P_PHY_DELTA(i);
> +		phy_set_drvdata(phy, instance);
> +	}
> +
> +	phy_provider =3D devm_of_phy_provider_register(dev, mt65xx_phy_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		dev_err(dev, "Failed to register phy provider\n");
> +		return PTR_ERR(phy_provider);
> +	}
> +
> +	return u3phy_clk_enable(u3phy);
> +}
> +
> +static int mt65xx_u3phy_remove(struct platform_device *pdev)
> +{
> +	struct mt65xx_u3phy *u3phy =3D platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(u3phy->u3phya_ref);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver mt65xx_u3phy_driver =3D {
> +	.probe		=3D mt65xx_u3phy_probe,
> +	.remove		=3D mt65xx_u3phy_remove,
> +	.driver		=3D {
> +		.name	=3D "mt65xx-u3phy",
> +		.of_match_table =3D mt65xx_u3phy_id_table,
> +	},
> +};
> +
> +module_platform_driver(mt65xx_u3phy_driver);
> +
> +MODULE_DESCRIPTION("Mt65xx USB PHY driver");
> +MODULE_LICENSE("GPL v2");
> --=20
> 1.8.1.1.dirty
>=20

--=20
balbi

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVr6cFAAoJEIaOsuA1yqRESscP/RduLX1UzqnQ88tI5jNFvkX3
Hb/gBuUvaXYH/YnpxK36/JR4q4YcWO6TPrGCqCohOkqsHYg0HJ7UYvlrhA2ojMqu
qlcBY3fmETinMzFYZmFB95kjwba7Pi7NgZPt2VgqgVNqk2Tirk8LI0fx8SuRcynU
PwkuNZchpnYOPqSp2Bm/ax3qdQ4rNqsDY2s2V/iiQvI9Sh+ZM2P/z3BbzetsBT9h
KZexSFzxPYlFCsMp3fLLG9Y+ijuIjwzVSSmUPFeFNcioCewyOLV4wnNA9O4yu29S
qn9D3Vl7pbyz2NA+FZAZTRb2QCPEoPVU02V98zonk3AEnS+75hAAAJ4AXWsSJb8N
YueEu9rPuEmE1T5rCYkMLfS1sDTwvZ5us4jVqev1uZSYAPXkvi5qGXXP95CrOiEW
ZjaZ+xH+V3WYzPK6x9qyYi73CpoEY6blm8AEQN62LcjrMhJmJvY0E/5h4LviiGOl
QMPRzlKtEgX9u6+ZS+zgkJv0G+OdX4ZrpPOvIkdrjoCFMz49F8maVfAFXku1mmV+
w7YiBgqHSZloHu9Rsn7nile8ySC+7TWqbKHqxv0Rr4Pv7/4CgsDxG/UjP3rHm9WJ
venTr+eDuYd8d5okfTO/sE2D29I2B4JKgsDurFIickpV4Y9ZH4e0PevySudcKJcD
o7A51on06sqYv0fjIttX
=cyfS
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--


--===============1116378172387360475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1116378172387360475==--
