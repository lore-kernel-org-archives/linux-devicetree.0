From: PETER CHEN <peter.chen@nxp.com>
Subject: RE: [RFC PATCH v2 07/15] usb:cdns3: Adds Device mode support -
 initialization.
Date: Fri, 30 Nov 2018 04:20:41 +0000
Message-ID: <VI1PR04MB5327227A807B92DDA62CF9038BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-8-git-send-email-pawell@cadence.com>
 <5BFE7D2E.7030702@ti.com> <87pnupzaz1.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pnupzaz1.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>, Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

=20
> Roger Quadros <rogerq@ti.com> writes:
> >> +static void cdns3_gadget_config(struct cdns3_device *priv_dev) {
> >> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
> >> +
> >> +	cdns3_ep0_config(priv_dev);
> >> +
> >> +	/* enable interrupts for endpoint 0 (in and out) */
> >> +	writel(EP_IEN_EP_OUT0 | EP_IEN_EP_IN0, &regs->ep_ien);
> >> +
> >> +	/* enable generic interrupt*/
> >> +	writel(USB_IEN_INIT, &regs->usb_ien);
> >> +	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
> >> +	writel(USB_CONF_DMULT, &regs->usb_conf);
> >> +	writel(USB_CONF_DEVEN, &regs->usb_conf);
> >
> > If you are enabling interrupts in this patch you should handle them in =
the ISR.
>=20
> Frankly, I don't understand why this is a series. It's a single driver an=
d splitting it into
> a series just makes it more difficult to review, actually.
>=20
> Sure, a single patch will be large, but there's no way to have a function=
al driver until
> all patches are applied, anyway.
>=20

Yes, I agree with Felipe. Pawel, you could remove the "RFC" prefix, and sen=
d the whole
one as one patch. I will test it at my hardware.

Peter
