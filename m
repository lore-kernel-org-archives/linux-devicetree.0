From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 4/8] ARM: dts: sun8i: Add touchscreen node for
 sun8i-a23-gt90h
Date: Tue, 23 Aug 2016 17:17:38 +0200
Message-ID: <20160823151738.GM2598@lukather>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-4-git-send-email-hdegoede@redhat.com>
 <20160822183009.GX7104@lukather>
 <cf0186a0-f4ea-173c-4f93-df8798941199@redhat.com>
 <20160823092614.GF2598@lukather>
 <a8de228d-2ba9-e23e-0c0c-e9a78dbe6e6a@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7461079702224835551=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <a8de228d-2ba9-e23e-0c0c-e9a78dbe6e6a@redhat.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: devicetree <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============7461079702224835551==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0+35XlDF45POFHfm"
Content-Disposition: inline


--0+35XlDF45POFHfm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 11:39:06AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 23-08-16 11:26, Maxime Ripard wrote:
> >On Mon, Aug 22, 2016 at 09:03:57PM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 22-08-16 20:30, Maxime Ripard wrote:
> >>>On Mon, Aug 08, 2016 at 09:43:14PM +0200, Hans de Goede wrote:
> >>>>The gt90h tablet has a gsl3675 touchscreen, add a dt node describing =
it.
> >>>>
> >>>>Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>---
> >>>>arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts | 8 ++++++++
> >>>>1 file changed, 8 insertions(+)
> >>>>
> >>>>diff --git a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts b/arch/arm/boot=
/dts/sun8i-a23-gt90h-v4.dts
> >>>>index f27ebbb..da55b5a 100644
> >>>>--- a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>>>+++ b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>>>@@ -53,6 +53,14 @@
> >>>>	status =3D "okay";
> >>>>};
> >>>>
> >>>>+&gsl1680 {
> >>>>+	compatible =3D "silead,gsl3675";
> >>>>+	touchscreen-fw-name =3D "silead/gsl3675-gt90h.fw";
> >>>
> >>>That's not documented anywhere, and looks really suspicious.
> >>
> >>Ugh, that should have been in:
> >>
> >>Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> >>
> >>But somehow it is not (I believe it was there in earlier revisions of
> >>the patch), I'll send a patch to fix this.
> >>
> >>About it being suspicious, this is not really firmware it is a bunch
> >>of configuration data / lookup tables for the controller which tell
> >>it in which order the touchscreen horizontal / vertical sensor
> >>lines are connected to its sense pins, and what values to send
> >>for finger x% between line z and line z+1, which differs per
> >>tablet model, since not all tablets use the same digitizer.
> >
> >It's not really the firmware itself that I find suspicious, but more
> >the encoding of a path to a file in the DT,
>=20
> It is not a path it is a filename. We could drop the "silead/" prefix
> and put that in the driver instead to really make it a filename.
>=20
> >especially when you can
> >apparently derive it from other informations already found in the DT
> >(<vendor>/<compatible>-<board>.fw)
>=20
> That will not work, sometimes different boards use the same digitizer
> and thus the same firmware. Also in case of the q8 tablets, we need
> different firmware for different variants (this is to be dealt with
> by the q8-hardware-manager I'm working on), since although they
> all use the same digitizer they do not wire it up to the controllers
> pins the same in all models, so we need different firmware files
> corresponding to different wirings.
>=20
> TL;DR: There is no 1:1 mapping between board and the firmware filename.

The point still holds. It's exactly the same case than the broadcom
nvram filename discussion, and it raised the same issues.

> Also note that this is not the first driver to introduce a firmware
> filename in a dts binding, a quick grep shows at least:
>=20
> Documentation/devicetree/bindings/remoteproc/wkup_m3_rproc.txt
>=20
> Also does this, as well as several dt-bindings where board specific
> firmware gets embedded in the device tree itself.

Which has never been acked by any of the DT maintainers.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--0+35XlDF45POFHfm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvGkSAAoJEBx+YmzsjxAgtwEP/3Fpu3YvyaxIYVo4FDc5RTda
8c/ZysQ2k0ML++4T50pNexv+90aONbi37rohzToX7N9tBjduwXeSyHCyqiOsc9Yr
fiZWv4NbNgkpemx2RRiJZMrFxnYmQ/zHyG0mBt17pnfNNI0B1jj0Xlw4N1X3H6JS
yF4VcpoTGL/5dbzb49YQ213DxZoaKO5V4S4lBZVP4ZfSgspN11mL8lzXbG6LfqaG
EdujVW+IDT1lXEkcxny57EOgNklMTdH7CXIybbMoaScSJH1tt63+t4Y8b/Lrl/ki
lo6zyownRSEy8vZH5+Gh7a+FftZOU0gXyZ2xd/w7s63hik0BnL56nJjhQpnolaK+
Ok3zeZRVKH2ktYxTfFGpAcGs+dJw7gU4HSrQ8bAJWrtCu8g/T4V7V7FxhiTANjDG
sNxMiWqg1JsuVtvULaoevDZpatyiy7/eyg3Ie3GAW6AnNDIS6gtKQlAA9YjS33rX
ODon5f+qf8BCOq4WwaLJxmkfZS3qHGCigOaX3jkAbnsSFhcW1jhnoPQ1TeaVEZjz
E6MEiFv9BzmzQjZmasK6q/1cp/stxUeLVs+fugt7nZiNomBEJ8iKTYZ3I5g6U3b4
94n3FO+CxgJ89UW3yinoZsgcfOG4lVaKMBGwnbRVaZRUkFn2SjnvLhZa3x9BSf3X
d2KXP+XjJ9lYesgalCO/
=bQMa
-----END PGP SIGNATURE-----

--0+35XlDF45POFHfm--


--===============7461079702224835551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7461079702224835551==--
