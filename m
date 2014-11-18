From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: simplefb-sunxi: Add sunxi
 simplefb extensions
Date: Tue, 18 Nov 2014 10:29:21 +0100
Message-ID: <20141118092921.GZ6414@lukather>
References: <1416224086-5698-1-git-send-email-hdegoede@redhat.com>
 <1416224086-5698-3-git-send-email-hdegoede@redhat.com>
 <20141117124721.GQ6414@lukather>
 <CACxGe6vqiC08sP+o3bduGfvUdwRtHm8+_7EdZccJjS86qVKvxQ@mail.gmail.com>
 <20141117155514.GU6414@lukather>
 <546B0026.2010107@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RLVVO53zhS75EYih"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7VDVSRQKGQELMI356Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <546B0026.2010107-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--RLVVO53zhS75EYih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 09:15:34AM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 11/17/2014 04:55 PM, Maxime Ripard wrote:
> > On Mon, Nov 17, 2014 at 01:39:18PM +0000, Grant Likely wrote:
> >> On Mon, Nov 17, 2014 at 12:47 PM, Maxime Ripard
> >> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >>> On Mon, Nov 17, 2014 at 12:34:46PM +0100, Hans de Goede wrote:
> >>>> If pre-filled framebuffer nodes are used, the firmware may need extra
> >>>> properties to find the right node. This documents the properties to =
use
> >>>> for this on sunxi platforms.
> >>>>
> >>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >>>> ---
> >>>>  .../bindings/video/simple-framebuffer-sunxi.txt    | 33 +++++++++++=
+++++++++++
> >>>>  1 file changed, 33 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/video/simple-f=
ramebuffer-sunxi.txt
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/video/simple-framebuf=
fer-sunxi.txt b/Documentation/devicetree/bindings/video/simple-framebuffer-=
sunxi.txt
> >>>> new file mode 100644
> >>>> index 0000000..84ca264
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer-sun=
xi.txt
> >>>> @@ -0,0 +1,33 @@
> >>>> +Sunxi specific Simple Framebuffer bindings
> >>>> +
> >>>> +This binding documents sunxi specific extensions to the simple-fram=
ebuffer
> >>>> +bindings. The sunxi simplefb u-boot code relies on the devicetree c=
ontaining
> >>>> +pre-populated simplefb nodes.
> >>>> +
> >>>> +These extensions are intended so that u-boot can select the right n=
ode based
> >>>> +on which pipeline and output is being used. As such they are solely=
 intended
> >>>> +for firmware / bootloader use, and the OS should ignore them.
> >>>> +
> >>>> +Required properties:
> >>>> +- compatible: "sunxi,framebuffer"
> >>>> +- sunxi,pipeline:
> >>>> +  <0> for the de_be0 -> lcdc0 -> output pipeline
> >>>> +  <1> for the de_be1 -> lcdc1 -> output pipeline
> >>>> +- sunxi,output: One of: "hdmi", "lcd", "vga", and "composite"
> >>>> +
> >>>> +Example:
> >>>> +
> >>>> +chosen {
> >>>> +     #address-cells =3D <1>;
> >>>> +     #size-cells =3D <1>;
> >>>> +     ranges;
> >>>> +
> >>>> +     framebuffer@0 {
> >>>> +             compatible =3D "sunxi,framebuffer", "simple-framebuffe=
r";
> >>>> +             sunxi,pipeline =3D <0>;
> >>>> +             sunxi,output =3D "hdmi";
> >>>> +             clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> >>>> +                      <&ahb_gates 44>;
> >>>
> >>> If we're going that way, then maybe having to specify clock-names
> >>> would be better in order to know which clock is what?
> >>
> >> I wouldn't go that way with this binding since the driver has no need
> >> to differentiate between the clocks, and driver authors shouldn't be
> >> encouraged to do so. The purpose of the clocks in this node is only
> >> for itemizing dependencies, not for how to configure the clocks.
> >> Firmware shouldn't care at all about the clocks list, it only needs to
> >> find the correct pre-populated node to fill in and enable.
> >=20
> > Well, if we want to play the "DT as an ABI" stuff, you have no
> > guarantee that in the future, simplefb will still be the driver bound
> > to "sunxi,framebuffer"
>=20
> Huh? We do have that guarantee, or at least that a simplefb bindings
> compatible driver is, the "sunxi,framebuffer" bindings live in:
>=20
> Documentation/devicetree/bindings/video/simple-framebuffer-sunxi.txt
>=20
> With the filename already being a big hint, further more it states that:

Yeah, well, that can change. The compatible itself can't, but we're
free to move around the drivers however we see fit (as long as the
user-space is not impacted)

> "This binding documents sunxi specific extensions to the simple-framebuff=
er
> bindings. The sunxi simplefb u-boot code relies on the devicetree contain=
ing
> pre-populated simplefb nodes.
>=20
> These extensions are intended so that u-boot can select the right node ba=
sed
> on which pipeline is being used. As such they are solely intended for
> firmware / bootloader use, and the OS should ignore them."
>=20
> Which to me seems to guarantee that we're talking about a simple-framebuf=
fer
> compatible node here. The scope of these extensions are very narrow, there
> only purpose is to allow the bootloader to find the right pre-populated s=
implefb
> node, everything else is specified by the simplefb bindings, not these
> extensions.

My point was that what we might need to know these clocks at some
point in the future. But if you don't believe we will, it's fine for
me.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--RLVVO53zhS75EYih
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUaxFxAAoJEBx+YmzsjxAgk+YQAIdHMlMk/TSQPzTXzN+BMPU/
AUMws3OixsbLa3eRn55g3ZICDPmZisF8nhsfIXLuNGvL9mo8DHb6LHLjxI2w/NGs
rYoRYtnKvaTpNMpbsFeheSZBlZ1afBlx1yWpycGS6lXlC66akzPzZP9vrE/UjYB+
HvQTcYy8Q13n/5TmkWk4jB8BSGMVlMUItaXxfi09AQEuZ1y6S6MeZwxuIAOHHUpt
Mb9MuvSJCY7nHyKPg0kHkIkZr7J008SYRr2Z8ipUqATE5bezN5Tzo86mAzFkJ+wa
Stl5tchgt1wD9S+mRdIOjr13MAn+FVrl41ET/AJ3L17etzxtPuvKxAh9ulA6Nodl
q28lawuDdaBg2wjDhS+YMQ1O4pT4z+JSn9BXrM47z3LK+JB3xf/H+aT10Ysg+9sZ
ASqF1CR+aAPezIW6Sp4J/WFQgsgB406HNNaEouZXqRETQP4IHWDliduoSDEiU/n5
ZwiSxV/bv+bbdf5IS+cztPuFk7vzFXXnJLr/K7u7NdZt0ZEhST9UT7lGZxhtJHDR
tmxnRXPkGb85eGByWDiZufJcpar5wHPaHU3gV91jUNs+myGF8McwVvY0ItBnXBab
Eg88CW0+X1qCHLArVslAHzvM648JfhCjDYGaFKYBH9kol9FzCTIJ67ZiyVlZd8tN
b541etJx5xppFJqW9TuI
=JhZB
-----END PGP SIGNATURE-----

--RLVVO53zhS75EYih--
