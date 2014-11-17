From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] dt-bindings: simplefb-sunxi: Add sunxi
 simplefb extensions
Date: Mon, 17 Nov 2014 16:55:14 +0100
Message-ID: <20141117155514.GU6414@lukather>
References: <1416224086-5698-1-git-send-email-hdegoede@redhat.com>
 <1416224086-5698-3-git-send-email-hdegoede@redhat.com>
 <20141117124721.GQ6414@lukather>
 <CACxGe6vqiC08sP+o3bduGfvUdwRtHm8+_7EdZccJjS86qVKvxQ@mail.gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/FJxnyttrH06HRq2"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBCFXVCRQKGQEGKCKEBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vqiC08sP+o3bduGfvUdwRtHm8+_7EdZccJjS86qVKvxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--/FJxnyttrH06HRq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2014 at 01:39:18PM +0000, Grant Likely wrote:
> On Mon, Nov 17, 2014 at 12:47 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Mon, Nov 17, 2014 at 12:34:46PM +0100, Hans de Goede wrote:
> >> If pre-filled framebuffer nodes are used, the firmware may need extra
> >> properties to find the right node. This documents the properties to use
> >> for this on sunxi platforms.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>  .../bindings/video/simple-framebuffer-sunxi.txt    | 33 +++++++++++++=
+++++++++
> >>  1 file changed, 33 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/video/simple-fra=
mebuffer-sunxi.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/video/simple-framebuffe=
r-sunxi.txt b/Documentation/devicetree/bindings/video/simple-framebuffer-su=
nxi.txt
> >> new file mode 100644
> >> index 0000000..84ca264
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/video/simple-framebuffer-sunxi=
=2Etxt
> >> @@ -0,0 +1,33 @@
> >> +Sunxi specific Simple Framebuffer bindings
> >> +
> >> +This binding documents sunxi specific extensions to the simple-frameb=
uffer
> >> +bindings. The sunxi simplefb u-boot code relies on the devicetree con=
taining
> >> +pre-populated simplefb nodes.
> >> +
> >> +These extensions are intended so that u-boot can select the right nod=
e based
> >> +on which pipeline and output is being used. As such they are solely i=
ntended
> >> +for firmware / bootloader use, and the OS should ignore them.
> >> +
> >> +Required properties:
> >> +- compatible: "sunxi,framebuffer"
> >> +- sunxi,pipeline:
> >> +  <0> for the de_be0 -> lcdc0 -> output pipeline
> >> +  <1> for the de_be1 -> lcdc1 -> output pipeline
> >> +- sunxi,output: One of: "hdmi", "lcd", "vga", and "composite"
> >> +
> >> +Example:
> >> +
> >> +chosen {
> >> +     #address-cells =3D <1>;
> >> +     #size-cells =3D <1>;
> >> +     ranges;
> >> +
> >> +     framebuffer@0 {
> >> +             compatible =3D "sunxi,framebuffer", "simple-framebuffer";
> >> +             sunxi,pipeline =3D <0>;
> >> +             sunxi,output =3D "hdmi";
> >> +             clocks =3D <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
> >> +                      <&ahb_gates 44>;
> >
> > If we're going that way, then maybe having to specify clock-names
> > would be better in order to know which clock is what?
>=20
> I wouldn't go that way with this binding since the driver has no need
> to differentiate between the clocks, and driver authors shouldn't be
> encouraged to do so. The purpose of the clocks in this node is only
> for itemizing dependencies, not for how to configure the clocks.
> Firmware shouldn't care at all about the clocks list, it only needs to
> find the correct pre-populated node to fill in and enable.

Well, if we want to play the "DT as an ABI" stuff, you have no
guarantee that in the future, simplefb will still be the driver bound
to "sunxi,framebuffer", and that this driver doesn't need to
differentiate which clocks it needs to protect and which are not
needed. Especially with the combination of the output that you now
hardcode.

Of course, if now we don't care at all about this ABI thing, it's
completely fine for me. But I'll archive this email preciously.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/FJxnyttrH06HRq2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUahpiAAoJEBx+YmzsjxAgF9MP/3JJDUkLoPPay+gVVO9ojprF
Gq9meAy/x2Jkc+0sXWBnZHChmg+OreqWlhHeMlEN8aJYEzHUNS6tNUR38yXMUAL3
va1TLRYAp20wT1ot7iAdeLdmxmZySIsVd+4V9cwZdTdmX3WctD4RJ6H1x8NRtI5F
Rv/96eU/lhqWhxgiH3zud6T2NDPEhnbdeXFWUTRYRnO0BAs86c2lkSIpdpjhib0v
+I4hVlZ7uEK9xIh+DQAVA/2axHnXF53m6K1SxuP0VAbl/xM1TjjWturtjA/BBpbn
PJouTCTioZxf5WRc87eroMJFOvdflYoUf7DVfCZVg8x926w6dl+Z9oaAaI6vtZY2
sN+d7IEg4ArzugzppniGsXWUOiDuvNH1RSGD73in2WBJbPyAPDGwU/wSJcPoVM33
x5sQRMKNejVVHJGKvPDsXLIzGeSD3adlVDfGGxe3XNkWQmnmBVTgc/MC4+xWmUs5
VIBZtPpgDDIuYWhxJL0cyGg79Nr4GnqGIkDlLmKMq6QPg0nxTJ+DqQXw+j6bbXy/
w5qhUdtHF0y/dffOtgapBkU7DQC0VSM9/HwdC4i2rGJZpQBC/v1y3tyY6FQDQEHb
kkXSpiaqyLiyCIQ3sJ3LEpcI9wHZtHQmsJRBsvWjfQDUojZhMOMvN9IqDyRmiIBF
c6mJJl7/7Qp2PsmW/E6N
=9uTc
-----END PGP SIGNATURE-----

--/FJxnyttrH06HRq2--
