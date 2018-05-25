From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: RE: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ PTP
 clock driver
Date: Fri, 25 May 2018 04:47:05 +0000
Message-ID: <DB6PR0401MB2536456CAA9C94839E534CCBF8690@DB6PR0401MB2536.eurprd04.prod.outlook.com>
References: <20180525044038.37756-1-yangbo.lu@nxp.com>
 <20180525044038.37756-5-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180525044038.37756-5-yangbo.lu@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Y.b. Lu" <yangbo.lu@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Richard Cochran <richardcochran@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This patch has a dependency which is now on staging git tree.
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?=
h=3Dstaging-next&id=3D7fd899fff5907dbb02089494102ef628988f2330


> -----Original Message-----
> From: Yangbo Lu [mailto:yangbo.lu@nxp.com]
> Sent: Friday, May 25, 2018 12:41 PM
> To: netdev@vger.kernel.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; Richard Cochran <richardcochran@gmail.com>;
> Claudiu Manoil <claudiu.manoil@nxp.com>; Rob Herring <robh+dt@kernel.org>
> Cc: Y.b. Lu <yangbo.lu@nxp.com>
> Subject: [PATCH 5/5] MAINTAINERS: add myself as maintainer for QorIQ PTP
> clock driver
>=20
> Added myself as maintainer for QorIQ PTP clock driver.
> Since gianfar_ptp.c was renamed to ptp_qoriq.c, let's also maintain it un=
der
> QorIQ PTP clock driver.
>=20
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> ---
>  MAINTAINERS |   17 +++++++++--------
>  1 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b65225..a71d4fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4411,12 +4411,6 @@ L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/fsl-dpaa2/ethsw
>=20
> -DPAA2 PTP CLOCK DRIVER
> -M:	Yangbo Lu <yangbo.lu@nxp.com>
> -L:	linux-kernel@vger.kernel.org
> -S:	Maintained
> -F:	drivers/staging/fsl-dpaa2/rtc
> -
>  DPT_I2O SCSI RAID DRIVER
>  M:	Adaptec OEM Raid Solutions <aacraid@microsemi.com>
>  L:	linux-scsi@vger.kernel.org
> @@ -5648,7 +5642,6 @@ M:	Claudiu Manoil <claudiu.manoil@nxp.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/ethernet/freescale/gianfar*
> -X:	drivers/net/ethernet/freescale/gianfar_ptp.c
>  F:	Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
>=20
>  FREESCALE GPMI NAND DRIVER
> @@ -5695,6 +5688,15 @@ S:	Maintained
>  F:	drivers/net/ethernet/freescale/fman
>  F:	Documentation/devicetree/bindings/powerpc/fsl/fman.txt
>=20
> +FREESCALE QORIQ PTP CLOCK DRIVER
> +M:	Yangbo Lu <yangbo.lu@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	drivers/staging/fsl-dpaa2/rtc
> +F:	drivers/ptp/ptp_qoriq.c
> +F:	include/linux/fsl/ptp_qoriq.h
> +F:	Documentation/devicetree/bindings/ptp/ptp-qoriq.txt
> +
>  FREESCALE QUAD SPI DRIVER
>  M:	Han Xu <han.xu@nxp.com>
>  L:	linux-mtd@lists.infradead.org
> @@ -11429,7 +11431,6 @@ S:	Maintained
>  W:
> 	https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fli
> nuxptp.sourceforge.net%2F&data=3D02%7C01%7Cyangbo.lu%40nxp.com%7Cd7
> 840089f091467d11de08d5c1f9e801%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636628201433493648&sdata=3DXhJjFQyrROZzMU7zUGsUkA
> BjJD%2BJ25q2Jq77vdHoco0%3D&reserved=3D0
>  F:	Documentation/ABI/testing/sysfs-ptp
>  F:	Documentation/ptp/*
> -F:	drivers/net/ethernet/freescale/gianfar_ptp.c
>  F:	drivers/net/phy/dp83640*
>  F:	drivers/ptp/*
>  F:	include/linux/ptp_cl*
> --
> 1.7.1
