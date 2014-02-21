From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH v10 01/15] usb: doc: phy-mxs: Add more compatible strings
Date: Fri, 21 Feb 2014 10:46:41 +0100
Message-ID: <53072081.2000407@pengutronix.de>
References: <1392873284-9386-1-git-send-email-peter.chen@freescale.com> <1392873284-9386-2-git-send-email-peter.chen@freescale.com> <20140221091345.GA7541@e106331-lin.cambridge.arm.com> <5e4d795b507a4ea7b9faa69dd05148c4@BL2PR03MB226.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="hJ8kBaXLGAPCShd4AHR4kkeC9uTrSVxbW"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5e4d795b507a4ea7b9faa69dd05148c4@BL2PR03MB226.namprd03.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <Peter.Chen@freescale.com>, Mark Rutland <mark.rutland@arm.com>
Cc: "balbi@ti.com" <balbi@ti.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Pawel Moll <Pawel.Moll@arm.com>, "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com" <festevam@gmail.com>, "marex@denx.de" <marex@denx.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>, "Frank.Li@freescale.com" <Frank.Li@freescale.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hJ8kBaXLGAPCShd4AHR4kkeC9uTrSVxbW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/21/2014 10:40 AM, Peter Chen wrote:
> =20
>>>
>>>  Required properties:
>>> -- compatible: Should be "fsl,imx23-usbphy"
>>> +- compatible: "fsl,imx23-usbphy" for imx23 and imx28, "fsl,imx6q-
>> usbphy"
>>> +  for imx6dq and imx6dl, "fsl,imx6sl-usbphy" for imx6sl
>>
>> Minor nit, but could we restructure this as something like the followi=
ng,
>> with each string on a new line:
>>
>> - compatible: should contain:
>>     * "fsl,imx23-usbphy" for imx23 and imx28
>>     * "fsl,imx6q-usbphy" for imx6dq and imx6dl
>>     * "fsl,imx6sl-usbphy" for imx6sl
>>
>> It makes it a bit easier to read.
>=20
> Thanks, will change like above.
>=20
>>
>> I see the existing "fsl,imx23-usbphy" is used as a fallback for
>> "fsl,imx28-usbphy", "fsl,imx6q-usbphy", and "fsl,imx6sl-usbphy" in
>> existing DTs.
>>
>> Is this expected going forward? It might be worth mentioning.
>>
>=20
> These SoCs used the same FSL imx PHY, but different versions.
> imx23/imx28 are the first version, more improvements are at
> later SoCs (like imx6x) version. Keep "fsl,imx23-usbphy" at
> imx6 dts will be user know it is from imx23's. If you think
> it does not need, I can delete "fsl,imx23-usbphy" from imx6 dts.

You should go after compatibility here. List (all) phys that are
comaptible, start with most specific end with most generic.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--hJ8kBaXLGAPCShd4AHR4kkeC9uTrSVxbW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Using GnuPG with Icedove - http://www.enigmail.net/

iEYEARECAAYFAlMHIIEACgkQjTAFq1RaXHM3dwCfU9J2GfbRb3c7FBXKnbChC1Yp
/EkAn2QxDnTeNfF/1sGPI7XhGS3U7AXo
=c4OH
-----END PGP SIGNATURE-----

--hJ8kBaXLGAPCShd4AHR4kkeC9uTrSVxbW--
