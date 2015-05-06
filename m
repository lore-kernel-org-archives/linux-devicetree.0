From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/3] phy: Add binding document for Pistachio USB2.0 PHY
Date: Wed, 6 May 2015 09:25:43 +0100
Message-ID: <20150506082543.GC18183@jhogan-linux.le.imgtec.org>
References: <1428444258-25852-1-git-send-email-abrestic@chromium.org>
 <1428444258-25852-2-git-send-email-abrestic@chromium.org>
 <20150505220116.GE17687@jhogan-linux.le.imgtec.org>
 <CAL1qeaFacmDaCW6VSp247HZx+RwJKjYTWQhu5qxjH5JE3ET6Nw@mail.gmail.com>
 <20150505224352.GA18183@jhogan-linux.le.imgtec.org>
 <CAL1qeaG=O7LYo6RRxEMZw2da=eKAp0Dd+LxhBX32TojyBkr=xA@mail.gmail.com>
 <20150505233534.GB18183@jhogan-linux.le.imgtec.org>
 <CAL1qeaE9O3RBNVv9DrZZRu6sebkK2GOnbv6hWQsUR5MHKMcGgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qtZFehHsKgwS5rPz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaE9O3RBNVv9DrZZRu6sebkK2GOnbv6hWQsUR5MHKMcGgA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--qtZFehHsKgwS5rPz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:06:08PM -0700, Andrew Bresticker wrote:
> On Tue, May 5, 2015 at 4:35 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrot=
e:
> > On Tue, May 05, 2015 at 04:09:31PM -0700, Andrew Bresticker wrote:
> >> On Tue, May 5, 2015 at 3:43 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> w=
rote:
> >> > On Tue, May 05, 2015 at 03:16:23PM -0700, Andrew Bresticker wrote:
> >> >> Hi James,
> >> >>
> >> >> On Tue, May 5, 2015 at 3:01 PM, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org=
> wrote:
> >> >> > Hi Andrew,
> >> >> >
> >> >> > On Tue, Apr 07, 2015 at 03:04:16PM -0700, Andrew Bresticker wrote:
> >> >> >> Add a binding document for the USB2.0 PHY found on the IMG Pista=
chio SoC.
> >> >> >>
> >> >> >> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> >> >> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >> >> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> >> >> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> >> >> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> >> >> >> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> >> >> ---
> >> >> >> No changes from v1.
> >> >> >> ---
> >> >> >>  .../devicetree/bindings/phy/pistachio-usb-phy.txt  | 29 +++++++=
+++++++++++++++
> >> >> >>  include/dt-bindings/phy/phy-pistachio-usb.h        | 16 +++++++=
+++++
> >> >> >>  2 files changed, 45 insertions(+)
> >> >> >>  create mode 100644 Documentation/devicetree/bindings/phy/pistac=
hio-usb-phy.txt
> >> >> >>  create mode 100644 include/dt-bindings/phy/phy-pistachio-usb.h
> >> >> >>
> >> >> >> diff --git a/Documentation/devicetree/bindings/phy/pistachio-usb=
-phy.txt b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
> >> >> >> new file mode 100644
> >> >> >> index 0000000..afbc7e2
> >> >> >> --- /dev/null
> >> >> >> +++ b/Documentation/devicetree/bindings/phy/pistachio-usb-phy.txt
> >> >> >> @@ -0,0 +1,29 @@
> >> >> >> +IMG Pistachio USB PHY
> >> >> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> >> >> +
> >> >> >> +Required properties:
> >> >> >> +--------------------
> >> >> >> + - compatible: Must be "img,pistachio-usb-phy".
> >> >> >> + - #phy-cells: Must be 0.  See ./phy-bindings.txt for details.
> >> >> >> + - clocks: Must contain an entry for each entry in clock-names.
> >> >> >> +   See ../clock/clock-bindings.txt for details.
> >> >> >> + - clock-names: Must include "usb_phy".
> >> >> >> + - img,cr-top: Must constain a phandle to the CR_TOP syscon nod=
e.
> >> >> >> + - img,refclk: Indicates the reference clock source for the USB=
 PHY.
> >> >> >> +   See <dt-bindings/phy/phy-pistachio-usb.h> for a list of vali=
d values.
> >> >> >
> >> >> > Possibly dumb question: why isn't the reference clock source spec=
ified
> >> >> > in the normal ways like the "usb_phy" clock is?
> >> >> >
> >> >> > Does the value required here depend on what usb_phy clock gets mu=
xed
> >> >> > from or something?
> >> >>
> >> >> Right, the value indicates what clock "usb_phy" is: whether it comes
> >> >> from the core clock controller, the XO crystal, or is some external
> >> >> clock.  It's a mux internal to the PHY.
> >> >
> >> > Okay. If its a software controllable mux, is there a particular reas=
on
> >> > the DT doesn't describe it as such, i.e. have all 3 clock inputs, and
> >> > the driver somehow work out which to use?
> >>
> >> Well, I'm not sure how the driver would determine which clock to use
> >> without a device-tree property like the one I've got here :).  Also,
> >
> > Does it make sense to just look for the "best" usable source clock based
> > on the supported rates listed in fsel_rate_map[] (for some definition of
> > "best" such as "fastest" / "slowest" / "first usable"), or are things
> > just not that simple?
> >
> > I'm just wondering how the DT writer would decide, since it seems to
> > come down to a policy decision rather than a description of the
> > hardware, which should probably be avoided in DT bindings if possible.
>=20
> Ah, sorry if that was unclear - this *is* describing a hardware
> property.  The DT author would pick a value by looking at which clock
> is connected to the PHY in the schematic.

Okay cool. Sorry for the noise.

Thanks
James

--qtZFehHsKgwS5rPz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVSdAHAAoJEGwLaZPeOHZ6xxwP/jKHty710vHJJYfovVyvvMOB
mFHIOLYOwbOh2H532NnbBUBKVmsxwfXRfLCdl3mWb+phoodwzA0A9a0pALj3O4iH
Uc/HTTV7HOI3d5SFkioOeHNzue1DDnAWnMsEJFsdebdpjz/RC8TZFMI5GnD3bgi9
OmhHgpOLzr03X0Xi/D3cQtpB0VpZIaXRM12gbKn3yrzM8gZP2Rk8jY2xUQz15B9j
W0Q0FUxNRhg3JZlhI+5XilJw7b+Php6X8BHlYF/0yumRFL3oi0h6/FpEROXzeTqN
8lQlX8w37OiHyDl9rV+h+pqXc0X9kGeKMBCSgZsy2RBlXCKpOWXxgAKv1KIizUPz
EhlbdAzBQ6F2OEFudN/dQSxvWO99c0Ot1o7Vk/eOJvKO+yWp9qbS1oNYEdLy85+Q
lNrMdnNGQy4G219Ort5pOy9OU0OgK/oLYJ9QpKXW9Xq5sK2UKvZZpxhGEZv908Ry
xWDWeQM7aNxgWxifxkwhK10S6ZDkjnoUL31yQQIlBb3Ef2c+j9/WMhl+g72ACsGM
9r49fdsdeEtGOb8g4ymIQp3j/pOLDj1gyMGhI0jzn4po0c6dlAP8qTWTnDCGDzoo
18dS0m9eKo/pTcj0qeOD+X0l9RUTTlEB8dSQs2Apq2r0haoWaj58CkMQv19FueU4
qCpcmnlWAWcg3zn3ZuM7
=LHaj
-----END PGP SIGNATURE-----

--qtZFehHsKgwS5rPz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
