From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: sun8i: Add touchscreen node for
 sun8i-a23-gt90h
Date: Tue, 23 Aug 2016 11:26:14 +0200
Message-ID: <20160823092614.GF2598@lukather>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-4-git-send-email-hdegoede@redhat.com>
 <20160822183009.GX7104@lukather>
 <cf0186a0-f4ea-173c-4f93-df8798941199@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ChQOR20MqfxkMJg9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf0186a0-f4ea-173c-4f93-df8798941199-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 09:03:57PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 22-08-16 20:30, Maxime Ripard wrote:
> >On Mon, Aug 08, 2016 at 09:43:14PM +0200, Hans de Goede wrote:
> >>The gt90h tablet has a gsl3675 touchscreen, add a dt node describing it.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>---
> >> arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts | 8 ++++++++
> >> 1 file changed, 8 insertions(+)
> >>
> >>diff --git a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts b/arch/arm/boot/d=
ts/sun8i-a23-gt90h-v4.dts
> >>index f27ebbb..da55b5a 100644
> >>--- a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>+++ b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>@@ -53,6 +53,14 @@
> >> 	status =3D "okay";
> >> };
> >>
> >>+&gsl1680 {
> >>+	compatible =3D "silead,gsl3675";
> >>+	touchscreen-fw-name =3D "silead/gsl3675-gt90h.fw";
> >
> >That's not documented anywhere, and looks really suspicious.
>=20
> Ugh, that should have been in:
>=20
> Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
>=20
> But somehow it is not (I believe it was there in earlier revisions of
> the patch), I'll send a patch to fix this.
>=20
> About it being suspicious, this is not really firmware it is a bunch
> of configuration data / lookup tables for the controller which tell
> it in which order the touchscreen horizontal / vertical sensor
> lines are connected to its sense pins, and what values to send
> for finger x% between line z and line z+1, which differs per
> tablet model, since not all tablets use the same digitizer.

It's not really the firmware itself that I find suspicious, but more
the encoding of a path to a file in the DT, especially when you can
apparently derive it from other informations already found in the DT
(<vendor>/<compatible>-<board>.fw)

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvBa2AAoJEBx+YmzsjxAgH18P/2qlMNfXbNc5OakAtI954TYe
K+BcOgMFKL0N5EHOScrITDFZKIsGYAZ0mxnf+0ncmhaWLwWFf0xyTNsRtcF41fFP
ps05hQOtJl8B9dw3PbwZlNgLjIBgwaJMOWMpF4Hgvgv0TC5NVl2saVAgq1bZIIXR
k6Yqas/Lpb8DqlmASitUeeccThrLN/TZkeeVnzVSpsvRpGPFCFBc3R8suAp8CQTh
a3ocDYR3KKklZvVgoP/6x/xvmTQM9m+QZGE6H5352cet6elZXBOTJZJ2doWbu6LV
nKrL0tjHicrKN5TI/IEbMmc2stTQgiC9Kmx0Fv0Rbf3jnHPJZMer8zuutx28L1tJ
ssc7Tbhnr2uLhN8YMbp1ICPEHg9x/ua55UEQw45zYWukt1MzwF79MJX9BNW3Mr8D
hFnbYLb1aBNr9CXjpRn5wtCkIFPXZnqVPMT9RJ/1eJIJmaHQ11uldSzC33+l0HL9
xLKJveU2YLqVJXXCWDvawPJAXxBcQtdwVShK+W2/jj2U+Kjgg1VyaJBVMyFhM8TO
oNz0QinlmMnKhMnSYgZeKw8wPoayh7NgQmld2dk2RrqBJhg1kBjNC34fhEJ7iAc8
IPirJt4jr+Be6HhOMQrjdGLO0StYkc7bMnF7DEEnDVyd6HE5ZygMrRGhrqJjjEuA
f6a/JuoWlKPuV86H5sec
=rXo0
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
