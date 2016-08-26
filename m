From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: sun8i: Add touchscreen node for
 sun8i-a23-gt90h
Date: Fri, 26 Aug 2016 22:46:37 +0200
Message-ID: <20160826204637.GC3165@lukather>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-4-git-send-email-hdegoede@redhat.com>
 <20160822183009.GX7104@lukather>
 <cf0186a0-f4ea-173c-4f93-df8798941199@redhat.com>
 <20160823092614.GF2598@lukather>
 <a8de228d-2ba9-e23e-0c0c-e9a78dbe6e6a@redhat.com>
 <20160823151738.GM2598@lukather>
 <8541f3c3-c83b-bd20-42cf-03fdfb3a33d9@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8541f3c3-c83b-bd20-42cf-03fdfb3a33d9-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 05:59:50PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 08/23/2016 05:17 PM, Maxime Ripard wrote:
> >On Tue, Aug 23, 2016 at 11:39:06AM +0200, Hans de Goede wrote:
> >>Hi,
> >>
> >>On 23-08-16 11:26, Maxime Ripard wrote:
> >>>On Mon, Aug 22, 2016 at 09:03:57PM +0200, Hans de Goede wrote:
> >>>>Hi,
> >>>>
> >>>>On 22-08-16 20:30, Maxime Ripard wrote:
> >>>>>On Mon, Aug 08, 2016 at 09:43:14PM +0200, Hans de Goede wrote:
> >>>>>>The gt90h tablet has a gsl3675 touchscreen, add a dt node describin=
g it.
> >>>>>>
> >>>>>>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>>>>---
> >>>>>>arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts | 8 ++++++++
> >>>>>>1 file changed, 8 insertions(+)
> >>>>>>
> >>>>>>diff --git a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts b/arch/arm/bo=
ot/dts/sun8i-a23-gt90h-v4.dts
> >>>>>>index f27ebbb..da55b5a 100644
> >>>>>>--- a/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>>>>>+++ b/arch/arm/boot/dts/sun8i-a23-gt90h-v4.dts
> >>>>>>@@ -53,6 +53,14 @@
> >>>>>>	status =3D "okay";
> >>>>>>};
> >>>>>>
> >>>>>>+&gsl1680 {
> >>>>>>+	compatible =3D "silead,gsl3675";
> >>>>>>+	touchscreen-fw-name =3D "silead/gsl3675-gt90h.fw";
> >>>>>
> >>>>>That's not documented anywhere, and looks really suspicious.
> >>>>
> >>>>Ugh, that should have been in:
> >>>>
> >>>>Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> >>>>
> >>>>But somehow it is not (I believe it was there in earlier revisions of
> >>>>the patch), I'll send a patch to fix this.
> >>>>
> >>>>About it being suspicious, this is not really firmware it is a bunch
> >>>>of configuration data / lookup tables for the controller which tell
> >>>>it in which order the touchscreen horizontal / vertical sensor
> >>>>lines are connected to its sense pins, and what values to send
> >>>>for finger x% between line z and line z+1, which differs per
> >>>>tablet model, since not all tablets use the same digitizer.
> >>>
> >>>It's not really the firmware itself that I find suspicious, but more
> >>>the encoding of a path to a file in the DT,
> >>
> >>It is not a path it is a filename. We could drop the "silead/" prefix
> >>and put that in the driver instead to really make it a filename.
> >>
> >>>especially when you can
> >>>apparently derive it from other informations already found in the DT
> >>>(<vendor>/<compatible>-<board>.fw)
> >>
> >>That will not work, sometimes different boards use the same digitizer
> >>and thus the same firmware. Also in case of the q8 tablets, we need
> >>different firmware for different variants (this is to be dealt with
> >>by the q8-hardware-manager I'm working on), since although they
> >>all use the same digitizer they do not wire it up to the controllers
> >>pins the same in all models, so we need different firmware files
> >>corresponding to different wirings.
> >>
> >>TL;DR: There is no 1:1 mapping between board and the firmware filename.
> >
> >The point still holds. It's exactly the same case than the broadcom
> >nvram filename discussion, and it raised the same issues.
>=20
> No it is not, in this case we also want to be able to specify
> different fw names on devices using the same base dts, here
> is a tablet for all the q8 tablets with gsl1680 I've:

At least two other dev told you exactly that in that thread though:
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-June/439978.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-June/440024.html

>=20
> a13-94v-0:		a082 a23-tj-a23-q88-v4.0_20140815/GSL1680E_700_FW.fw	1024x600=
 inverted-x
> a13-tzx-713b-v2.1:	a082 a23-tj-a23-q88-v4.0_20140815/GSL1680E_700_FW.fw	1=
024x600
> a23-q8h-v3:		a082 a23-tj-a23-q88-v4.0_20140815/GSL1688_A70_FW.fw	 800x480=
 swapped-x-y
> a23-tj-a23-q88-v4.0:	a082 a23-tj-a23-q88-v4.0_20140815/GSL1680E_700_FW.fw=
	1024x600
> a23-tw-ao721-v41:	a082 a23-tj-a23-q88-v4.0_20140815/GSL1680E_700_FW.fw	10=
24x600 inverted-x
> a23-ippo-q8h-v1.2:	a082 a23-tj-a23-q88-v4.0_20140815/GSL1688_A70_FW.fw	 8=
00x480 swapped-x-y
> a33-ippo-q8h-v1.2:	a082 a23-tj-a23-q88-v4.0_20140815/GSL1688_A70_FW.fw	 8=
00x480 swapped-x-y
> a33-tzx-723q4:		b482 a33-Q8_V2.4_1118/GSL1680_FW_D702.fw		 960x640 invert=
ed-x
> a33-q8-v2.4-1118:	b482 a33-Q8_V2.4_1118/GSL1680_FW_D702.fw		 960x640
> a33-q8h-v1.5:		b482 a33-q8h-v1.5/GSL1688_A70_FW.fw			 960x640
>=20
> I'm working on a q8hardware-mgr (inspired by the beagle bone cape mgr)
> to automatically detect the touchscreen controller as well as the control=
ler id
> (the 2nd column above), and it will need to set a filename for the firmwa=
re
> file based on this, deriving this from the machine compatible will
> simply not work here.

I'm not sure why we need to stick to some insane naming scheme. Or why
can't we use symlinks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwKqtAAoJEBx+YmzsjxAghl8QAJ4Ld7QFUv9sKjBUr9ZpycH+
QdD58oKhGKKhyl4g88UFQzkpTUevJ4hrr/wl5MC/jtYwxYMy7qzNiLELROwUo3i5
LXIjwt6Hxnvp8lb1EyQTIQmszkK3LBHgVaBUN4FW3uRsloi/mVjRXNfA75nXD3lQ
ag4IakfZFl5DRFMhc9zAJUb7SNJM8d1HcvdE5n12YtZeBZhFknd6pYqMkEgbXkFT
T2l88xQAZ0LmrUExBUIbE2b6fLaMk7T4rHkpgVabRIRDx2i+02Q505FRGaiKKISJ
01sk7TRJfPfDW1VnaxNz34RO/LL0Ia9JSlZlAOgLPF3l+EOerBqv2mEhE0IJAH9d
pr7srAcv6pGzc/NO5zHtTifoXD+LCcW+Gg3LOjcTSPOeZvENjvUEtrULTaMAiPzc
4BahWz5MWJxIUd/ZDndDly2XUAL3dC1+tw9XUuzlxODQpjRF9VshBZanpXSwpZM4
ig1/Di3NP+dvwV0dPSuPuRaxGBpTA6vtTe8eJ2vj4819nkZ6WIcsGwbvbWpLZh3n
m2/koAWge5fc592ADTh/NDz3FoxcSYCSA0l/PnmqjhVUNINYzdKJQiHGe9meiudO
cJO/JkI9lciOvEGG2WnO5zIJ9bjQ61kF1wYKH/KyVqhiGYuKfS57mhqzlQlK/nrZ
582hbwt1KTVOuwEUR2vs
=tNC6
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
