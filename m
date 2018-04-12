Return-Path: <SRS0=puHF=HB=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/2] usb: gadget: udc: renesas_usb3: add property
 "renesas,ignore-id"
Date: Thu, 12 Apr 2018 05:03:23 +0000
Message-ID: <TY1PR06MB0992A446CC3822360157B948D8BC0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1523362434-17808-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1523362434-17808-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180411072810.powlmegmyyju3nol@verge.net.au>
In-Reply-To: <20180411072810.powlmegmyyju3nol@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: "balbi@kernel.org" <balbi@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Wednesday, April 11, 2018 4:28 PM
>=20
> On Tue, Apr 10, 2018 at 09:13:53PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > This patch adds a new property to ignore the ID signal on a board.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/usb/renesas_usb3.txt |  2 ++
> >  drivers/usb/gadget/udc/renesas_usb3.c                  | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > index 2c071bb..53949bd 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > @@ -19,6 +19,8 @@ Required properties:
> >  Optional properties:
> >    - phys: phandle + phy specifier pair
> >    - phy-names: must be "usb"
> > +  - renesas,ignore-id: when a board doesn't use ID pin, you can add th=
is
> > +		       property to ignore the ID state.
> >
> >  Example of R-Car H3 ES1.x:
> >  	usb3_peri0: usb@ee020000 {
> > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget=
/udc/renesas_usb3.c
> > index 409cde4..59e1485 100644
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -350,6 +350,7 @@ struct renesas_usb3 {
> >  	bool extcon_host;		/* check id and set EXTCON_USB_HOST */
> >  	bool extcon_usb;		/* check vbus and set EXTCON_USB */
> >  	bool forced_b_device;
> > +	bool ignore_id;
> >  };
> >
> >  #define gadget_to_renesas_usb3(_gadget)	\
> > @@ -645,6 +646,9 @@ static void usb3_check_vbus(struct renesas_usb3 *us=
b3)
> >
> >  static void usb3_set_mode(struct renesas_usb3 *usb3, bool host)
> >  {
> > +	if (usb3->ignore_id && !usb3->forced_b_device)
> > +		return;
> > +
> >  	if (host)
> >  		usb3_clear_bit(usb3, DRD_CON_PERI_CON, USB3_DRD_CON);
> >  	else
> > @@ -675,6 +679,9 @@ static void usb3_mode_config(struct renesas_usb3 *u=
sb3, bool host, bool a_dev)
> >
> >  static bool usb3_is_a_device(struct renesas_usb3 *usb3)
> >  {
> > +	if (usb3->ignore_id)
> > +		return false;
> > +
> >  	return !(usb3_read(usb3, USB3_USB_OTG_STA) & USB_OTG_IDMON);
> >  }
> >
> > @@ -2632,6 +2639,9 @@ static int renesas_usb3_probe(struct platform_dev=
ice *pdev)
> >  	if (ret < 0)
> >  		goto err_add_udc;
> >
> > +	if (of_property_read_bool(pdev->dev.of_node, "renesas,no-id"))
> > +		usb3->ignore_id =3D true;
>=20
> I wonder if this is better expressed as:
>=20
> 	usb3->ignore_id =3D of_property_read_bool(pdev->dev.of_node,
> 						"renesas,no-id"));

Thank you for the pointed out! I agree with you.
However, I would like to recall this adding property for now because
I'm thinking that the OF graph of usb-connector can assume this via connect=
or-type
instead of such a local property. So, I'll try to use the usb-connector bin=
dings on
this driver.

Best regards,
Yoshihiro Shimoda

> > +
> >  	ret =3D device_create_file(&pdev->dev, &dev_attr_role);
> >  	if (ret < 0)
> >  		goto err_dev_create;
> > --
> > 1.9.1
> >
