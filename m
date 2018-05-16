Return-Path: <SRS0=lpWp=ID=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50052.outbound.protection.outlook.com ([40.107.5.52]:3776
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750995AbeEPIf5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 16 May 2018 04:35:57 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH v5 12/14] staging: typec: tcpci: keep the not connecting
 cc line open
Date: Wed, 16 May 2018 08:35:50 +0000
Message-ID: <HE1PR04MB1450507C65FD86DA4BE46F7B8B920@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <1525307094-27402-1-git-send-email-jun.li@nxp.com>
 <1525307094-27402-13-git-send-email-jun.li@nxp.com>
In-Reply-To: <1525307094-27402-13-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Jun Li <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "gsomlo@gmail.com" <gsomlo@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

=20
>=20
> While set polarity, we should keep the not connecting cc line to be open.
>=20

keep the disconnected cc line open?

Peter

> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/staging/typec/tcpci.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.=
c index
> 5c48810..5c0c5e3 100644
> --- a/drivers/staging/typec/tcpci.c
> +++ b/drivers/staging/typec/tcpci.c
> @@ -185,15 +185,25 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc=
,
>  			      enum typec_cc_polarity polarity)  {
>  	struct tcpci *tcpci =3D tcpc_to_tcpci(tcpc);
> +	unsigned int reg;
>  	int ret;
>=20
> -	ret =3D regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
> -			   (polarity =3D=3D TYPEC_POLARITY_CC2) ?
> -			   TCPC_TCPC_CTRL_ORIENTATION : 0);
> +	/* Keep the disconnect cc line open */
> +	ret =3D regmap_read(tcpci->regmap, TCPC_ROLE_CTRL, &reg);
>  	if (ret < 0)
>  		return ret;
>=20
> -	return 0;
> +	if (polarity =3D=3D TYPEC_POLARITY_CC2)
> +		reg |=3D TCPC_ROLE_CTRL_CC_OPEN <<
> TCPC_ROLE_CTRL_CC1_SHIFT;
> +	else
> +		reg |=3D TCPC_ROLE_CTRL_CC_OPEN <<
> TCPC_ROLE_CTRL_CC2_SHIFT;
> +	ret =3D regmap_write(tcpci->regmap, TCPC_ROLE_CTRL, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
> +			   (polarity =3D=3D TYPEC_POLARITY_CC2) ?
> +			   TCPC_TCPC_CTRL_ORIENTATION : 0);
>  }
>=20
>  static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
> --
> 2.7.4

