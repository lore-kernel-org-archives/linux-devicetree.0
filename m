Return-Path: <SRS0=k9qO=HO=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH/RFC 01/11] Documentation: of: Add device-connection-id
 property
Date: Wed, 25 Apr 2018 09:09:23 +0000
Message-ID: <OSBPR01MB229321EA7B88EC7113AE3EAFD88F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1524039005-30618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524039005-30618-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180424143327.u5a76hbdk3g7wlhr@rob-hp-laptop>
In-Reply-To: <20180424143327.u5a76hbdk3g7wlhr@rob-hp-laptop>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

> From: Rob Herring, Sent: Tuesday, April 24, 2018 11:33 PM
>=20
> On Wed, Apr 18, 2018 at 05:09:55PM +0900, Yoshihiro Shimoda wrote:
> > This patch adds a new property for device connection framework.
>=20
> What's the "device connection framework" and what does it have to do
> with DT?

The "device connection framework" is described in the following:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/driver-api/device_connection.rst?h=3Dv4.17-rc2

However, according to the Heikki's comments [1], I completely misunderstood=
 what should I do.
So, I'd like to recall this patch set.

[1]
http://www.spinics.net/lists/linux-renesas-soc/msg26869.html

Best regards,
Yoshihiro Shimoda

> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/graph.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/graph.txt b/Documentatio=
n/devicetree/bindings/graph.txt
> > index 0415e2c..fca0030 100644
> > --- a/Documentation/devicetree/bindings/graph.txt
> > +++ b/Documentation/devicetree/bindings/graph.txt
> > @@ -125,4 +125,4 @@ Optional endpoint properties
> >  ----------------------------
> >
> >  - remote-endpoint: phandle to an 'endpoint' subnode of a remote device=
 node.
> > -
> > +- device-connection-id: string for device connection.
>=20
> Why do we need this?
>=20
> > --
> > 1.9.1
> >
