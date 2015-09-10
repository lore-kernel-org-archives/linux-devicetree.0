From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sun4i: Add dts file for iNet-1 based
 tablets
Date: Thu, 10 Sep 2015 18:43:21 +0200
Message-ID: <20150910164321.GL9885@lukather>
References: <1441787004-4660-1-git-send-email-hdegoede@redhat.com>
 <1441787004-4660-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CgTrtGVSVGoxAIFj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441787004-4660-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--CgTrtGVSVGoxAIFj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2015 at 10:23:24AM +0200, Hans de Goede wrote:
> The iNet-tek iNet-1 PCB is a PCB found in various generic 10.1" 1024x600
> A10 based tablets such as the Point of View Protab2 XXL and the
> Cherry M1007.
>=20
> This patch has been tested on both rev2 and rev5 of this board / these
> tablets.
>=20
> It comes with a rtl8188cus usb wifi connected to ehci1, focal ft5406ee8
> touchscreen connected to i2c2 addr 0x38, bosch bma 250 accelerometer
> connected to i2c1 addr 0x18 and the usual connectors: headphone,
> mini hdmi, power-barrel, mini-usb and a micro-sd slot.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--CgTrtGVSVGoxAIFj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8bMpAAoJEBx+YmzsjxAgVkMP/j80vXITJr3U1QeO7ZaZksUI
sqCfm72mRfn3kLcKxEchPk88K2iTGt/NeVzMbYlHhRdOTS3CRknETnwwrPyECcid
ELN5ahmtum5Qg622FbBbB0/A2sMJTciHN9r99mX54G1WfQa3j4/ycyU2eBnvEXJ6
to1BQp+XJ8GtaBABn0v2lFXJkM8avcIPm8yrVOPUCm/lps4GttxiFtb8cbfunQY+
2WPq7vYkaDhV5uLHcV0qZz1r2gEUlWMHuizEjKDvy3cVKaURkklF7MWmNzYdYmrA
JmHcOfBoHHy2sIfgkBWH7FPVtLOaRGg8Zoy1RaHojQXYR4aBQmbIBuk2VauxDF5I
fL/N9welk0fY1KMCG82S8YTlF9/FMAzWJxbHpqLsN1IyGOhyGdt0goVkY745hVFH
lRNsTTDUD0WghQC91VANJnjta5uvAFxMcUfbu5lzySoAk1qkuDhn8SQt9H698QFp
dSST77TpFtVtfr20EbAziNT6qGAAXROe5unsEYokhfFRvceQBMOs3EGaULSVX3Sb
ylyrAl5ZZUM1WqR/tK1XE/Htp97Vm7pL0nwb8VKuK98xu21vD30qtOX0tMogoxtB
5vL/K6LAVhGrHNZNgBeBr0l/clFQDeKomGp0uFSuqinCIg37o0F7vvMaGLHyLjtD
T4udrwlaIvb3fanBJ5Pf
=7SEZ
-----END PGP SIGNATURE-----

--CgTrtGVSVGoxAIFj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
