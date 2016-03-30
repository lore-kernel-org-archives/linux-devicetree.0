From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Add support for Engicam IMX6UL module
Date: Wed, 30 Mar 2016 19:47:59 +0800
Message-ID: <20160330114748.GF28207@tiger>
References: <1455963652-24618-1-git-send-email-michael@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455963652-24618-1-git-send-email-michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 20, 2016 at 11:20:48AM +0100, Michael Trimarchi wrote:
> Thi patch series add the support for Engicam IMXUL product
>=20
> https://community.freescale.com/docs/DOC-328428
>=20
> Based on Freescale=E2=84=A2 i.MX 6UltraLite processor, a high perform=
ance,
> ultra-efficient processor family featuring an advanced implementation
> of a single ARM=E2=84=A2 Cortex=E2=84=A2-A7 core, which operates at s=
peeds up to 528 MHz.
>=20
> The new ENGICAM GEA M6UL module is suitable for cost effective HMI
> applications requiring high performance CPU.
>=20
> Michael Trimarchi (4):
>   ARM: dts: imx6ul: Add flexcan1 and flexcan2 support
>   ARM: dts: imx6ul: Add LCDIF support
>   ARM: dts: imx6ul: Add GPMI nand controller support
>   ARM: dts: imx6ul-geam: Add Engicam IMX6UL GEA M6UL initial support

There are quite some changes around imx6ul.dtsi getting into 4.6-rc1.
Can you please rebase onto 4.6-rc1 and resend?

Shawn

>=20
>  arch/arm/boot/dts/Makefile             |   3 +-
>  arch/arm/boot/dts/imx6ul-geam-kit.dts  | 102 +++++++++
>  arch/arm/boot/dts/imx6ul-geam.dtsi     | 371 +++++++++++++++++++++++=
++++++++++
>  arch/arm/boot/dts/imx6ul.dtsi          |  68 ++++++
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |  10 +
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h |   6 +-
>  6 files changed, 557 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/imx6ul-geam-kit.dts
>  create mode 100644 arch/arm/boot/dts/imx6ul-geam.dtsi
>=20
> --=20
> 2.7.0
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
