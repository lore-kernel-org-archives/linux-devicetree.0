Return-Path: <SRS0=wYYg=IQ=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v5] usb: gadget: udc: renesas_usb3: Add register of usb
 role switch
Date: Tue, 29 May 2018 02:52:27 +0000
Message-ID: <TY2PR01MB2297E86466DEA9A16246D752D86D0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1527232376-5613-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180528130439.GD29600@kuha.fi.intel.com>
In-Reply-To: <20180528130439.GD29600@kuha.fi.intel.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Heikki,

> From: Heikki Krogerus, Sent: Monday, May 28, 2018 10:05 PM
>=20
> On Fri, May 25, 2018 at 04:12:56PM +0900, Yoshihiro Shimoda wrote:
> > @@ -2573,6 +2635,12 @@ static void renesas_usb3_init_ram(struct renesas=
_usb3 *usb3, struct device *dev,
> >  	EXTCON_NONE,
> >  };
> >
> > +static struct usb_role_switch_desc renesas_usb3_role_switch_desc =3D {
>=20
> You can constify that.

Thank you for the review! I'll modify this in v6 patch.

Best regards,
Yoshihiro Shimoda

> > +	.set =3D renesas_usb3_role_switch_set,
> > +	.get =3D renesas_usb3_role_switch_get,
> > +	.allow_userspace_control =3D true,
> > +};
> > +
> >  static int renesas_usb3_probe(struct platform_device *pdev)
> >  {
> >  	struct renesas_usb3 *usb3;
>=20
> Thanks,
>=20
> --
> heikki
