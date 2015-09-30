From: Felipe Balbi <balbi@ti.com>
Subject: Re: [RFC PATCH 1/2] usb: doc: Add bindings for ULPI platform driver
Date: Wed, 30 Sep 2015 11:18:03 -0500
Message-ID: <20150930161803.GI32625@saruman.tx.rr.com>
References: <1443012841-13673-1-git-send-email-sbhatta@xilinx.com>
 <20150924091034.GB27847@shlinux2>
 <F1B223389110CE49B4CF055ABA2E5D3D78C9BCBF@XAP-PVEXMBX02.xlnx.xilinx.com>
 <CAL_JsqK-aAY+DAwt0YH-mbBo+a9c7WPrBwJJoy3=FkT6ZX2A5w@mail.gmail.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK-aAY+DAwt0YH-mbBo+a9c7WPrBwJJoy3=FkT6ZX2A5w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, Peter Chen <peter.chen@freescale.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>, "kishon@ti.com" <kishon@ti.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 11:18:01AM -0500, Rob Herring wrote:
> On Thu, Sep 24, 2015 at 4:26 AM, Subbaraya Sundeep Bhatta
> <subbaraya.sundeep.bhatta@xilinx.com> wrote:
> > Hi Peter,
> >
> >> -----Original Message-----
> >> From: Peter Chen [mailto:peter.chen@freescale.com]
> >> Sent: Thursday, September 24, 2015 2:41 PM
> >> To: Subbaraya Sundeep Bhatta
> >> Cc: balbi@ti.com; devicetree@vger.kernel.org; kishon@ti.com;
> >> gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; linux-
> >> kernel@vger.kernel.org; Punnaiah Choudary Kalluri; Subbaraya Sundeep B=
hatta;
> >> linux-arm-kernel@lists.infradead.org
> >> Subject: Re: [RFC PATCH 1/2] usb: doc: Add bindings for ULPI platform =
driver
> >>
> >> On Wed, Sep 23, 2015 at 06:24:01PM +0530, Subbaraya Sundeep Bhatta
> >> wrote:
> >> > This patch adds binding doc info for generic ULPI PHYs platform
> >> > driver.
> >> >
> >> > Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
> >> > ---
> >> >  .../devicetree/bindings/usb/ulpi-platform-phy.txt  |   34
> >> ++++++++++++++++++++
> >> >  1 files changed, 34 insertions(+), 0 deletions(-)  create mode 1006=
44
> >> > Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> >> >
> >> > diff --git
> >> > a/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> >> > b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> >> > new file mode 100644
> >> > index 0000000..7b8cbb4
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/usb/ulpi-platform-phy.txt
> >> > @@ -0,0 +1,34 @@
> >> > +Platform driver for generic ULPI PHYs
> >> > +
> >> > +Required properties:
> >> > +- compatible               : Should be "ulpi-phy"
> >> > +- reg                      : Physical base address and size of the =
USB
> >> > +                     controller registers map to which this PHY
> >> > +                     is connected.
> >> > +- view-port                : Should contain viewport register offse=
t of the
> >> > +                     USB controller to which this PHY is connected =
Optional
> >> > +properties:
> >> > +- drv-vbus         : required if turning VBUS on/off has to be driv=
en
> >> > +                     by writing to PHY. This feature depends on boa=
rd
> >> > +                     design.
> >> > +
> >> > +Example:
> >> > +Below example shows the PHY binding for Chipidea USB controller whi=
ch
> >> > +has ulpi viewport register at 0x0170
> >> > +
> >> > +           usb_phy0: phy0 {
> >> > +                   compatible =3D "ulpi-phy";
> >> > +                   reg =3D <0xe0002000 0x1000>;
> >> > +                   view-port =3D <0x0170>;
> >> > +                   drv-vbus;
> >> > +           };
> >> > +
> >> > +           usb0: usb@e0002000 {
> >> > +                        compatible =3D "chipidea,usb2";
> >> > +                        interrupt-parent =3D <&intc>;
> >> > +                        interrupts =3D <0 21 4>;
> >> > +                        reg =3D <0xe0002000 0x1000>;
> >>
> >> Although just call devm_ioremap twice for the same register region doe=
s not
> >> cause any errors, I am not sure if it will has other potential problem=
s. Cc: arm
> >> list.
> >
> > Yes Peter I was also in doubt to call devm_ioremap twice for same regis=
ter region.
> > devm_ioremap_resource complained hence modified to devm_ioremap. Thanks=
 for
> > adding arm-list.
>=20
> Don't put overlapping resources in the DT. Having 2 drivers accessing
> the same registers is not a clean or safe design.

thanks, saves me the trouble of saying the same thing.

Bottom line, if devm_ioremap_resource() fails, you're wrong. Just fix
your driver and move on.

--=20
balbi

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDAs7AAoJEIaOsuA1yqREcg0P/joxyLV/GDlAgF/V0ZB/yEar
YEN43btCWgtYbqre9vWYCsjFAXEw5H1mSo3coDdRzc1aS9XMQsjdRD8clTw8FGGq
aGQBl6EUK2yj5cwE0fPZNlJmIiOg0swgTVspfhCwKqBgA4p1ylvgGOe3MKjAJLr2
mX2TNBvDQ49fRaE1bvMYHcHuDYgF8WJT5oxDa6+PxDehQB2Yx7cM7a17pcRc808r
1BdezJK/votfjBypXOlzVkI5313VtXNlmeq4OHLsUX9QnbDYZv1jv1P0yyeWuf89
RcqOOmAMDXyiHJPb6X8Iu8DUTFvgw4ErtlDRllFe2YgbKkcUz3gwXStiwGtmBeaz
q8AGipzWmfd0uZvD/6rKcjCSoLNGhe35l7mHAhX3lqWc3Zx15XFhjmWSvvadpNX7
lzj9vBm8XSwbDqqXwPhaxTRSPSf2uKIkNjllNWttxeGHy9ioBgA/8PJCfF0LoyVW
eGTjXKmSSQ1DCwnzLqA0jISt0kFxqznLrShws0pMEPOHwK4T6i+zf7wn78Z+O8tJ
FKyP2QipxtfT4diEEtAnm4WV5vkpK0NYQYHTFNq0SgrV7lY6oPe8J3sp+X7q7zn1
J0WnnnUtKvjQSyS6wrfktSiwc3+sfDVmukc0ARV9MlqDhImo7qZ9r3n+ia4TieU1
VoIU1vn5Ui1laTMNfM+s
=MMji
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--
