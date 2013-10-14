From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v3 01/13] usb: phy: msm: Move mach depndend code to
 platform data
Date: Mon, 14 Oct 2013 17:52:07 -0500
Message-ID: <20131014225207.GD7446@radagast>
References: <1381764280-28420-1-git-send-email-iivanov@mm-sol.com>
 <1381764280-28420-2-git-send-email-iivanov@mm-sol.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8367902417022722866=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381764280-28420-2-git-send-email-iivanov@mm-sol.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, dwalker@fifo99.com, linux@arm.linux.org.uk, swarren@wwwdotorg.org, grant.likely@linaro.org, davidb@codeaurora.org, devicetree@vger.kernel.org, jackp@codeaurora.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, linux-arm-msm@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, dsegal@codeaurora.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, balbi@ti.com, mgautam@codeaurora.org, bryanh@codeaurora.org, rob@landley.net
List-Id: devicetree@vger.kernel.org

--===============8367902417022722866==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline

--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 14, 2013 at 06:24:28PM +0300, Ivan T. Ivanov wrote:
> From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
>=20
> This patch fix compilation error and is an intermediate step
> before the addition of DeviceTree support for newer targets.
>=20
> Cc: David Brown <davidb@codeaurora.org>
> Cc: Daniel Walker <dwalker@fifo99.com>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ivan T. Ivanov <iivanov@mm-sol.com>
> ---
>  arch/arm/mach-msm/board-msm7x30.c |   35 +++++++++++++++++++++++++++++++=
++++
>  arch/arm/mach-msm/board-qsd8x50.c |   35 +++++++++++++++++++++++++++++++=
++++
>  drivers/usb/phy/phy-msm-usb.c     |   34 ++++++++++++++-----------------=
---
>  include/linux/usb/msm_hsusb.h     |    3 +++
>  4 files changed, 87 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/arm/mach-msm/board-msm7x30.c b/arch/arm/mach-msm/board-=
msm7x30.c
> index f9af5a4..46de789 100644
> --- a/arch/arm/mach-msm/board-msm7x30.c
> +++ b/arch/arm/mach-msm/board-msm7x30.c
> @@ -30,6 +30,7 @@
>  #include <asm/memory.h>
>  #include <asm/setup.h>
> =20
> +#include <mach/clk.h>
>  #include <mach/msm_iomap.h>
>  #include <mach/dma.h>
> =20
> @@ -60,10 +61,44 @@ static int hsusb_phy_init_seq[] =3D {
>  	-1
>  };
> =20
> +static int hsusb_link_clk_reset(struct clk *link_clk, bool assert)
> +{
> +	int ret;
> +
> +	if (assert) {
> +		ret =3D clk_reset(link_clk, CLK_RESET_ASSERT);
> +		if (ret)
> +			pr_err("usb hs_clk assert failed\n");
> +	} else {
> +		ret =3D clk_reset(link_clk, CLK_RESET_DEASSERT);
> +		if (ret)
> +			pr_err("usb hs_clk deassert failed\n");
> +	}
> +	return ret;
> +}
> +
> +static int hsusb_phy_clk_reset(struct clk *phy_clk)
> +{
> +	int ret;
> +
> +	ret =3D clk_reset(phy_clk, CLK_RESET_ASSERT);
> +	if (ret) {
> +		pr_err("usb phy clk assert failed\n");
> +		return ret;
> +	}
> +	usleep_range(10000, 12000);
> +	ret =3D clk_reset(phy_clk, CLK_RESET_DEASSERT);
> +	if (ret)
> +		pr_err("usb phy clk deassert failed\n");
> +	return ret;
> +}
> +
>  static struct msm_otg_platform_data msm_otg_pdata =3D {
>  	.phy_init_seq		=3D hsusb_phy_init_seq,
>  	.mode                   =3D USB_PERIPHERAL,
>  	.otg_control		=3D OTG_PHY_CONTROL,
> +	.link_clk_reset		=3D hsusb_link_clk_reset,
> +	.phy_clk_reset		=3D hsusb_phy_clk_reset,
>  };
> =20
>  struct msm_gpiomux_config msm_gpiomux_configs[GPIOMUX_NGPIOS] =3D {
> diff --git a/arch/arm/mach-msm/board-qsd8x50.c b/arch/arm/mach-msm/board-=
qsd8x50.c
> index 5f933bc..9169ec3 100644
> --- a/arch/arm/mach-msm/board-qsd8x50.c
> +++ b/arch/arm/mach-msm/board-qsd8x50.c
> @@ -31,6 +31,7 @@
>  #include <mach/irqs.h>
>  #include <mach/sirc.h>
>  #include <mach/vreg.h>
> +#include <mach/clk.h>
>  #include <linux/platform_data/mmc-msm_sdcc.h>
> =20
>  #include "devices.h"
> @@ -81,10 +82,44 @@ static int hsusb_phy_init_seq[] =3D {
>  	-1
>  };
> =20
> +static int hsusb_link_clk_reset(struct clk *link_clk, bool assert)
> +{
> +	int ret;
> +
> +	if (assert) {
> +		ret =3D clk_reset(link_clk, CLK_RESET_ASSERT);
> +		if (ret)
> +			pr_err("usb hs_clk assert failed\n");
> +	} else {
> +		ret =3D clk_reset(link_clk, CLK_RESET_DEASSERT);
> +		if (ret)
> +			pr_err("usb hs_clk deassert failed\n");
> +	}
> +	return ret;
> +}
> +
> +static int hsusb_phy_clk_reset(struct clk *phy_clk)
> +{
> +	int ret;
> +
> +	ret =3D clk_reset(phy_clk, CLK_RESET_ASSERT);
> +	if (ret) {
> +		pr_err("usb phy clk assert failed\n");
> +		return ret;
> +	}
> +	usleep_range(10000, 12000);
> +	ret =3D clk_reset(phy_clk, CLK_RESET_DEASSERT);
> +	if (ret)
> +		pr_err("usb phy clk deassert failed\n");
> +	return ret;
> +}
> +
>  static struct msm_otg_platform_data msm_otg_pdata =3D {
>  	.phy_init_seq		=3D hsusb_phy_init_seq,
>  	.mode                   =3D USB_PERIPHERAL,
>  	.otg_control		=3D OTG_PHY_CONTROL,
> +	.link_clk_reset		=3D hsusb_link_clk_reset,
> +	.phy_clk_reset		=3D hsusb_phy_clk_reset,
>  };
> =20
>  static struct platform_device *devices[] __initdata =3D {
> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
> index e9d4cd9..118798d 100644
> --- a/drivers/usb/phy/phy-msm-usb.c
> +++ b/drivers/usb/phy/phy-msm-usb.c
> @@ -40,8 +40,6 @@
>  #include <linux/usb/msm_hsusb_hw.h>
>  #include <linux/regulator/consumer.h>
> =20
> -#include <mach/clk.h>
> -
>  #define MSM_USB_BASE	(motg->regs)
>  #define DRIVER_NAME	"msm_otg"
> =20
> @@ -308,33 +306,29 @@ static void ulpi_init(struct msm_otg *motg)
> =20
>  static int msm_otg_link_clk_reset(struct msm_otg *motg, bool assert)
>  {
> -	int ret;
> +	int ret =3D 0;
> +
> +	if (!motg->pdata->link_clk_reset)
> +		return ret;
> +
> +	ret =3D motg->pdata->link_clk_reset(motg->clk, assert);
> +	if (ret)
> +		dev_err(motg->phy.dev, "usb link clk reset failed\n");
> =20
> -	if (assert) {
> -		ret =3D clk_reset(motg->clk, CLK_RESET_ASSERT);
> -		if (ret)
> -			dev_err(motg->phy.dev, "usb hs_clk assert failed\n");
> -	} else {
> -		ret =3D clk_reset(motg->clk, CLK_RESET_DEASSERT);
> -		if (ret)
> -			dev_err(motg->phy.dev, "usb hs_clk deassert failed\n");
> -	}
>  	return ret;
>  }
> =20
>  static int msm_otg_phy_clk_reset(struct msm_otg *motg)
>  {
> -	int ret;
> +	int ret =3D 0;
> =20
> -	ret =3D clk_reset(motg->phy_reset_clk, CLK_RESET_ASSERT);
> -	if (ret) {
> -		dev_err(motg->phy.dev, "usb phy clk assert failed\n");
> +	if (!motg->pdata->phy_clk_reset)
>  		return ret;
> -	}
> -	usleep_range(10000, 12000);
> -	ret =3D clk_reset(motg->phy_reset_clk, CLK_RESET_DEASSERT);
> +
> +	ret =3D motg->pdata->phy_clk_reset(motg->phy_reset_clk);
>  	if (ret)
> -		dev_err(motg->phy.dev, "usb phy clk deassert failed\n");
> +		dev_err(motg->phy.dev, "usb phy clk assert failed\n");

seems like you're doing more than *just* fixing the build error. Which
build error do you get ?

--=20
balbi

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSXHWXAAoJEIaOsuA1yqREoRsP/3IZMAhbIhJB/xFvtcP/5EkK
k98/Wfe5rXenQ/lVmFW9er7b2rjtwESm4o51ucIB7U0Kq8fBHixDFu5l83YwHRG3
vduxWjb27e+8MXPeTSjD2EOQKLoHmg8GOY9R/lVjoGDJaYacHxo9nlnSVLLe1PBt
/LVOR3l3lh0j+tnfC5snCkTO+55xausMLFx8bppZGrZseA+WEOsfPrGoQYExFdA9
iY++asCsP+ZxL1hgvS3VcnCyVw9t3fSSsMqCrROtuPopVwnbNK0W7GMnnfMG6fhd
lG63fJs+DtaA1xE7IJlQNwWXNQOx24uFhKT8u7iVsHrGxndWlUGOtaqqUPA4okNq
zAExjdZCL0bQb3SzT5UNLSsB3qS7jOVhf61egCwMuKNaHre+Zw0pXZBuryiq0qAx
Zx/NYPDqVT6Gs6GzF7LAiU83hC/OYsqW/XwjoXfpDt0uHg8wAGCngTx6xDTMFQ4g
1l87/mc0w7zVLaRljaETSnXNc54tbTwAcwtEgo934dMUiNfMDIAb8JckmWdmmlsB
OUc8NZtsdXBm33+9ees4XV25Z9e6LNNuICfy1MjCJuzmVUGPxBlJBJ7inb6A6UBb
Eue3AZ4O/dPPGbcx5x9mwbaTBtUQAJRKTsBI2d5eZgiRYDAf8/5Szo4d4dKVA+0G
dDD4H4a8YAu6gobcbana
=zOgI
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--


--===============8367902417022722866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8367902417022722866==--
