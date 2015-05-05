From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/3] phy: Add binding document for Pistachio USB2.0 PHY
Date: Tue, 5 May 2015 23:43:52 +0100
Message-ID: <20150505224352.GA18183@jhogan-linux.le.imgtec.org>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
 <1428444258-25852-2-git-send-email-abrestic@chromium.org>
 <20150505220116.GE17687@jhogan-linux.le.imgtec.org>
 <CAL1qeaFacmDaCW6VSp247HZx+RwJKjYTWQhu5qxjH5JE3ET6Nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaFacmDaCW6VSp247HZx+RwJKjYTWQhu5qxjH5JE3ET6Nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 03:16:23PM -0700, Andrew Bresticker wrote:
> Hi James,
>=20
> On Tue, May 5, 2015 at 3:01 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrot=
e:
> > Hi Andrew,
> >
> > On Tue, Apr 07, 2015 at 03:04:16PM -0700, Andrew Bresticker wrote:
> >> Add a binding document for the USB2.0 PHY found on the IMG Pistachio S=
oC.
> >>
> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> ---
> >> No changes from v1.
> >> ---
> >>  .../devicetree/bindings/phy/pistachio-usb-phy.txt  | 29 +++++++++++++=
+++++++++
> >>  include/dt-bindings/phy/phy-pistachio-usb.h        | 16 ++++++++++++
> >>  2 files changed, 45 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/phy/pistachio-us=
b-phy.txt
> >>  create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb-phy.t=
xt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
> >> new file mode 100644
> >> index 0000000..afbc7e2
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
> >> @@ -0,0 +1,29 @@
> >> +IMG Pistachio USB PHY
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +
> >> +Required properties:
> >> +--------------------
> >> + - compatible: Must be "img,pistachio-usb-phy".
> >> + - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
> >> + - clocks: Must contain an entry for each entry in clock-names.
> >> +   See ../clock/clock-bindings.txt for details.
> >> + - clock-names: Must include "usb_phy".
> >> + - img,cr-top: Must constain a phandle to the CR_TOP syscon node.
> >> + - img,refclk: Indicates the reference clock source for the USB PHY.
> >> +   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of valid valu=
es.
> >
> > Possibly dumb question: why isn't the reference clock source specified
> > in the normal ways like the "usb_phy" clock is?
> >
> > Does the value required here depend on what usb_phy clock gets muxed
> > from or something?
>=20
> Right, the value indicates what clock "usb_phy" is: whether it comes
> from the core clock controller, the XO crystal, or is some external
> clock.  It's a mux internal to the PHY.

Okay. If its a software controllable mux, is there a particular reason
the DT doesn't describe it as such, i.e. have all 3 clock inputs, and
the driver somehow work out which to use?

Cheers
James

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVSUeoAAoJEGwLaZPeOHZ6ocsP/iNuBvivgZwJD+T0nymJ/ihN
PPYqHXefGdnvpUISrorcu3ng8G8E6EzfNxEEMDNjsA2FgTMKS7L5aEoA7Tm4srrk
v21l84CtGw5lEA1EMNcqaHm1EgBlshe8Ldn7QkqKJnstrBLhwSopaOsq8pSC3wlg
CtIEAoN/WKBTpoTKDYOiLjMKToG2hHulJzjhQK5E9Cfx2lLDOeemxPCWUM7ApmQ2
fsVl5NW3jmGFTWdWTb0RuQCJ1uu2gRsy6tJq8NGp+hUaxSMnT+AjCzcqygpUkN6e
+pk6qijnzju2xlUOVcgVeaFClh5RZCPLDp9BCNYN3BBtMj8gN/IHKvOaz5g+ZYwd
WnwIa+Ss3n+vZk0+f/fLRwxwpNkoJINPQ3LcYWYPCluWXtQPn3yYu9Sshcc+x1nO
LmuSt/vmc0u8fIKT+/zH4e/a181P373pGBneiJVxzFe/IXrAXOF6xJ66vGmQe7Dv
zGvolYaFjKfJ+3UpFay9pjmReSOdAurmCBmhiip2gaAJsSIsyowQlUp69m0/SyGT
ZUnAkkBwJh0lBxT/BJRndusu+XQvKQEiYYFUnA8WB/n5f5GNb4g2ux74YjVp+GIi
/BWrv0O0n5qbEkzn73PPnHK1hApyZRw5U5O7fJl3GTN8hTO7vC6f7o9OdYfZg/b/
3dLkbEOJt/xF4CQEFX8b
=q+qw
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
