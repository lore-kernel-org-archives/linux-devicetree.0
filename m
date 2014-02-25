From: Felipe Balbi <balbi@ti.com>
Subject: Re: [Patch v7 2/2] dmaengine: add Qualcomm BAM dma driver
Date: Mon, 24 Feb 2014 18:09:13 -0600
Message-ID: <20140225000913.GA10801@saruman.home>
References: <1393283500-18599-1-git-send-email-agross@codeaurora.org>
 <1393283500-18599-3-git-send-email-agross@codeaurora.org>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393283500-18599-3-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 24, 2014 at 05:11:40PM -0600, Andy Gross wrote:
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 605b016..f87cef9 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -401,4 +401,13 @@ config DMATEST
>  config DMA_ENGINE_RAID
>  	bool
> =20
> +config QCOM_BAM_DMA
> +	tristate "QCOM BAM DMA support"
> +	depends on ARCH_QCOM || (COMPILE_TEST && OF && ARM)

do you really want to make it depend on ARM even when COMPILE_TEST=3Dy ?

--=20
balbi

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTC98pAAoJEIaOsuA1yqREKWoP/1ndytYVrZlrSXoXdWRDlkeU
Z/43bjqoun/P7iqXgyB/4eB1pYXTxJBEMzGqgHVuD9Z/2mM2wMWe+1pzFxAhAa2R
HIrHEsteuufXRlQ9dKfM9OuvVfa3OZy8LIQXdO3g7G7VZyqqyn5xiF5F/bEcNeK/
FmN0/pJf8nVWbqJI9Iv5WinQlQSAxcpGjboO3sET0zEXYezf7oRhOunwtV6CgZMU
dCdJLK+l2cZ/pV1RKv2ak92Np9I91klmM4p16y9uo/bapXWGFQeL9TNTAAfj0bjD
Vv17/qiSgOSXDfDV05FWoEzyOGWsAm5+yYU0kha4sZScysgRRck1g9tjmtpp+bxu
nqSy3xgvbzxOG+GV5GQfRy42q9IZ3IxWGu1JpqoYWwTQU2zBmlgEMPOLGQKseWUz
NuuZXNUEakLWM1c24+j8HsSlHaklQ/z1NisgFHVT+OK1t003xQJk3bBzPzNuUoi/
598pggN1/Oz9pyZf2D2zcTLrMuvFOtiH8BhKaJdIvCmVx0TCzPo1GTXI5pHyIJJf
eIdzSdGOdaweZKiZXbyIQrof87hGfvUvsqds248PNN6MpNNt/teomih68nrH2Z9f
E2wmslozAlZAfRIIYJByI+7uK4ymheRb/JeGTVPSCNA9Y/jFQT26AryXuZ/Zo0xq
UbdK4kIktjLwZQvLpTvx
=0Hc7
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
