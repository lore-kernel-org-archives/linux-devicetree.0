From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 09/17] usb: phy-mxs: Enable IC fixes for related SoCs
Date: Tue, 03 Dec 2013 09:43:25 +0100
Message-ID: <529D99AD.3010304@pengutronix.de>
References: <1386056231-17258-1-git-send-email-peter.chen@freescale.com> <1386056231-17258-10-git-send-email-peter.chen@freescale.com> <529D95F7.8060705@pengutronix.de> <F281D0F91ED19E4D8E63A7504E8A649804140F64@039-SN2MPN1-021.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="I8Cl2rLH76o82FNhHpWXXwiE6T8cB80SR"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F281D0F91ED19E4D8E63A7504E8A649804140F64-RL0Hj/+nBVAqqAZmXiz6tK4g8xLGJsHaLnY5E4hWTkheoWH0uzbU5w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I8Cl2rLH76o82FNhHpWXXwiE6T8cB80SR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12/03/2013 09:38 AM, Peter Chen wrote:
> =20
>>
>> On 12/03/2013 08:37 AM, Peter Chen wrote:
>>> Some PHY bugs are fixed by IC logic, but these bits are not
>>> enabled by default, so we enable them at driver.
>>>
>>> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>> ---
>>>  drivers/usb/phy/phy-mxs-usb.c |   20 ++++++++++++++++++++
>>>  1 files changed, 20 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-=

>> usb.c
>>> index 8738890..0908d74 100644
>>> --- a/drivers/usb/phy/phy-mxs-usb.c
>>> +++ b/drivers/usb/phy/phy-mxs-usb.c
>>> @@ -31,6 +31,10 @@
>>>  #define HW_USBPHY_CTRL_SET			0x34
>>>  #define HW_USBPHY_CTRL_CLR			0x38
>>>
>>> +#define HW_USBPHY_IP				0x90
>>> +#define HW_USBPHY_IP_SET			0x94
>>> +#define HW_USBPHY_IP_CLR			0x98
>>> +
>>>  #define BM_USBPHY_CTRL_SFTRST			BIT(31)
>>>  #define BM_USBPHY_CTRL_CLKGATE			BIT(30)
>>>  #define BM_USBPHY_CTRL_ENAUTOSET_USBCLKS	BIT(26)
>>> @@ -42,6 +46,8 @@
>>>  #define BM_USBPHY_CTRL_ENUTMILEVEL2		BIT(14)
>>>  #define BM_USBPHY_CTRL_ENHOSTDISCONDETECT	BIT(1)
>>>
>>> +#define BM_USBPHY_IP_FIX                       (BIT(17) | BIT(18))
>>> +
>>>  #define to_mxs_phy(p) container_of((p), struct mxs_phy, phy)
>>>
>>>  /* Do disconnection between PHY and controller without vbus */
>>> @@ -97,6 +103,16 @@ struct mxs_phy {
>>>  	struct regmap *regmap_anatop;
>>>  };
>>>
>>> +static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
>>> +{
>>> +	return mxs_phy->data =3D=3D &imx6q_phy_data;
>>> +}
>>> +
>>> +static inline bool is_imx6sl_phy(struct mxs_phy *mxs_phy)
>>> +{
>>> +	return mxs_phy->data =3D=3D &imx6sl_phy_data;
>>> +}
>>
>> Why don't you use a a BIT() here as in Patch 2/17, too?
>>
> =20
> Thanks, I will define the two PHY problems as the register bit
> position at 2/17, and use those two MACROs at this patch.
> Is it your point?

I was wondering if the driver looks more uniform if you use something
like this:

#define MXS_PHY_NEED_IP_FIX		BIT(3)

>  static int mxs_phy_hw_init(struct mxs_phy *mxs_phy)
>  {
>  	int ret;
> @@ -123,6 +139,10 @@ static int mxs_phy_hw_init(struct mxs_phy *mxs_phy=
)
>  		BM_USBPHY_CTRL_ENUTMILEVEL3,
>  	       base + HW_USBPHY_CTRL_SET);
> =20
> +	/* Enable IC solution */
> +	if (is_imx6q_phy(mxs_phy) || is_imx6sl_phy(mxs_phy))

	if (mxs_phy->data->flags & MXS_PHY_NEED_IP_FIX)

> +		writel(BM_USBPHY_IP_FIX, base + HW_USBPHY_IP_SET);
> +
>  	return 0;
>  }

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--I8Cl2rLH76o82FNhHpWXXwiE6T8cB80SR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlKdma0ACgkQjTAFq1RaXHPxrACdFvCKSTlmRs8kfXOSxAqfeix9
G6UAn2jI1rMit3FLKW02Jk15DjvhXrMD
=5Xgz
-----END PGP SIGNATURE-----

--I8Cl2rLH76o82FNhHpWXXwiE6T8cB80SR--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
