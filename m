Return-Path: <SRS0=PMN1=IK=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC v4 2/4] usb: gadget: udc: renesas_usb3: Add register
 of usb role switch
Date: Wed, 23 May 2018 06:52:18 +0000
Message-ID: <OSBPR01MB229367114CFC1AC30C0430E4D86B0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1526990469-20739-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526990469-20739-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180522171302.GA21363@rob-hp-laptop>
In-Reply-To: <20180522171302.GA21363@rob-hp-laptop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thank you for the review!

> From: Rob Herring, Sent: Wednesday, May 23, 2018 2:13 AM
>=20
> On Tue, May 22, 2018 at 09:01:07PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds role switch support for R-Car SoCs into the USB 3.0
> > peripheral driver. Some R-Car SoCs (e.g. R-Car H3) have USB 3.0
> > dual-role device controller which has the USB 3.0 xHCI host and
> > Renesas USB 3.0 peripheral.
> >
> > Unfortunately, the mode change register contains the USB 3.0 peripheral
> > controller side only. So, the USB 3.0 peripheral driver (renesas_usb3)
> > manages this register now. However, in peripheral mode, the host
> > should stop. Also the host hardware needs to reinitialize its own
> > registers when the mode changes from peripheral to host mode.
> > Otherwise, the host cannot work correctly (e.g. detect a device as
> > high-speed).
> >
> > To achieve this by a driver, this role switch driver manages
> > the mode change register and attach/release the xhci-plat driver.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../devicetree/bindings/usb/renesas_usb3.txt       | 15 ++++
>=20
> Please split bindings to a separate patch.

Oops. I got it.

> >  drivers/usb/gadget/udc/Kconfig                     |  1 +
> >  drivers/usb/gadget/udc/renesas_usb3.c              | 82 ++++++++++++++=
++++++++
> >  3 files changed, 98 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 2c071bb5..f6105aa 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -19,6 +19,9 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - The connection to a usb3.0 host node needs by using OF graph bindi=
ngs for
> > +    usb role switch.
> > +   - port@0 =3D USB3.0 host port.
>=20
> On the host side, this might conflict with the USB connector binding.
>=20
> I would either make sure this can work with the connector binding by
> having 2 endpoints on the HS or SS port or just use the 'companion'
> property defined in usb-generic.txt.

I don't understand the first one now... This means the renesas_usb3 should =
follow
USB connector binding and have 2 endpoints for the usb role switch to avoid
the conflict like below?
 - port1@0: Super Speed (SS), present in SS capable connectors (from usb-co=
nnector.txt).
 - port1@1: USB3.0 host port.

About the 'companion' in usb-generic.txt, the property intends to be used f=
or EHCI or host side
like the commit log [1]. If there is accept to use 'companion' for this pat=
ch, I think it will
be simple to achieve this role switch feature. However, in last month, I su=
bmitted a similar patch [2]
that has "renesas,host" property, but I got reply from Andy [3] and Heikki =
[4]. So, I'm
trying to improve the device connection framework [5] now.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/D=
ocumentation/devicetree/bindings/usb/generic.txt?h=3Dv4.17-rc6&id=3D5095cb8=
9c62acc78b4cfaeb9a4072979d010510a

[2]
https://www.spinics.net/lists/linux-usb/msg167773.html

[3]
https://www.spinics.net/lists/linux-usb/msg167780.html

[4]
https://www.spinics.net/lists/linux-usb/msg167806.html

[5]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/driver-api/device_connection.rst

Best regards,
Yoshihiro Shimoda

> Rob
