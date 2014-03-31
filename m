From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: sun7i/sun6i: irqchip: Disable NMI
 before registering the handler
Date: Mon, 31 Mar 2014 13:06:31 +0200
Message-ID: <20140331110631.GF26751@lukather>
References: <1395939759-11135-1-git-send-email-carlo@caione.org>
 <1395939759-11135-3-git-send-email-carlo@caione.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBC424WMQKGQECPJR2SY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395939759-11135-3-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--p8PhoBjPxaQXD0vg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 06:02:39PM +0100, Carlo Caione wrote:
> From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> It is advisable to disable the NMI before registering the IRQ handler as
> registering the IRQ handler unmasks the IRQ on the GIC, so if U-Boot has
> left the NMI enabled and the NMI pin is active we will immediately get
> an interrupt before any driver has claimed the downstream interrupt of
> the NMI.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTOUw3AAoJEBx+YmzsjxAgvMUQAJzAORBD0p7bgWS+b4aRbS97
DWAoh+J1TGRDCCYfHbir6K4GuGHWVqNHwdAr24q3zxWr1hYNpmisBo5eFdbMaYYh
p3v0ciBVVOV1JMSrP7FQvqlbLeM8kRtIBUnVWjdkkuZudSx9AQxW4I2am+Uq9wi3
FJqvZL8cq4TZdSkTrK2c068Ebf0vQDGMuRxKEIT8rph4r+hFTEzvpJxwPaZw/M9B
2U9ktGrGQ7Be+cQYCDaLDkL47NKDSvjVucM1q15xqRuEo9yNNdcjD5gSpA9SMNik
qnKC1nhm+Ln6tnPkRnYKrph4w+UP3I39s10XgabNEPmgueBzJ7xsFsqavU8gxi2y
/XhkzsiM9Pu5ss1r3DCmoBD9XU36NPma2RJaFzb56+mOqk0iwXJIwU968WX50AYd
kUJr0xUahYS4ZjtXFeNB3UwCDpzI3lDGFo3EloggLHrdcDtu6VAYH8idqKeVuDCl
zYCVbQu7K1JEwWsp2ciaMoNMRXoAYn2hyUJIVRcplOiGGOf5nEjJvRQp3RCzxxQv
5HMp4pcWMp43FF8gcT+H9a/Caw+9cV1Lt7LS6htIbnZIs+4sk/ajOAV2S8CFTWI0
ZvoOUxfdBmClzq29HXc3H8MuLS7SdtfetVPeQirOqPOzaZ/2i6wU9iS954mQQn9t
L3v2cq8Fbvm1GygUWN/E
=CxKk
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
