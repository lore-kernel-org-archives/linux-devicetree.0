From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v8 0/3] ARM: sun7i/sun6i: irqchip: Irqchip
 driver for NMI controller
Date: Thu, 27 Mar 2014 09:18:14 +0100
Message-ID: <20140327081814.GG6120@lukather>
References: <1395870648-17240-1-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBNN6Z6MQKGQEDEWUOKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395870648-17240-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 10:50:45PM +0100, Carlo Caione wrote:
> Allwinner A20/A31 SoCs have a special interrupt controller for managing N=
MI.
> Three register are present to (un)mask, control and acknowledge NMI.
> These two patches add a new irqchip driver in cascade with GIC.
>=20
> Changes since v1:
>         - added binding document
>=20
> Changes since v2:
>         - fixed trigger type in DTS
>         - new explanations in binding documentation
>         - added support for A31 (sun6i)
>=20
> Changes since v3:
>         - changed compatibles
>=20
> Changes since v4:
>         - fixed binding documentation
>=20
> Changes since v5:
>         - switched to handle_fasteoi_irq handler to avoid the double
>           interrupts issue
>=20
> Changes since v6:
> 	- changed node name
> 	- deleted defaulted interrupt-parent property
>=20
> Changes since v7:
> 	- fixed IRQ number in sun6i
> 	- NMI disabled before registering the IRQ handler

As far as I know, these patches have been merged already. Please send
followup patches to avoid having to drop merged patches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTM97GAAoJEBx+YmzsjxAgE2cP/1+d74THRNaw7uA9HbPSJ5zm
zA0cQOnCS5IG5BIGCnHPMW9Oj2MlB/IxaYYnxrZoR/bUbZ6SeS/sfEsUmRc5r3ng
W+wlU6k9nD8fskuL1XALMrD+eIuLTypZbngQcKh38uDkFJ6lFl2orLld1sd+Gc5f
G8xVmDTpAcrVcFmwH926Swa16kVQvkdoG8v0X5s/cKpXubG2spT9CRP7TVqKb/90
eFDjhHVwtyTSluy8GqSjG0yilU9A4f35ITFJuk/BdLK4S/YhQLeK0YQTdpM2vRvk
XEnLpGFjdrDffJpiFaBFj5VKwskhsOu7qd6ViGxQH1fjP047dYVCb42ne3OzfMyD
s8p+6hVc0HE+x+LXvy/gSycKU3qg7DKi+XPXkzHrGLbsFNgn6bDZE8ngv7buZtcV
+jnEdpquemhLj9sVL0kq88pXp6/+7erKh0sc2fJCV6+D9maJvzFaFiwow9pdTGsK
QyjpbNHLEPI20B9XPrcc8RlgVhDr5KjyWx6NIjnGYadPkFQnR0U2UFBqj9HKl/Sb
9xgJ7w7g034AzaDP97cU3u2aDQKwHYObLomL/lmJ/JFn1wrRUTVsUzQZTIYBrg+z
AIedO39Nxwb/l3ZLdp+bRkVt6XBCFWrAxfi4s/kpPkX8He8km+/GX4rsIqexmsGx
M5O2xnZgv1Moct2Pgaib
=OGXE
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
