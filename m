Return-Path: <SRS0=oh/6=TJ=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Date: Thu, 9 May 2019 14:42:19 +0000
Message-ID: 
 <TY1PR01MB1562EAE92B76A5F3892865308A330@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-7-chris.brandt@renesas.com>
 <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Shimoda=1B$B$5$s!"=1B(B

> From: Yoshihiro Shimoda
> Sent: Thursday, May 09, 2019 3:04 AM

> > -/* status */
> > -#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)
> > -#define usbhsc_flags_set(p, b) ((p)->flags |=3D  (b))
> > -#define usbhsc_flags_clr(p, b) ((p)->flags &=3D ~(b))
> > -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))
>=20
> I would like to separate this patch to some patches like below to review
> the patch(es) easily:
>=20
> 1. Just move these definitions to common.h.

FYI, checkpatch.pl says this:

  WARNING: Single statement macros should not use a do {} while (0) loop
  #122: FILE: drivers/usb/renesas_usbhs/common.h:350:
  +#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)

So, I will change this code to:

#define usbhsc_flags_init(p)   {(p)->flags =3D 0;}



> It's the same with RZA1. So, I think we can reuse the code like below.
> What do you think?
> +	if (dparam->type =3D=3D USBHS_TYPE_RZA1 ||
> +	    dparam->type =3D=3D USBHS_TYPE_RZA2) {
> 		dparam->pipe_configs =3D usbhsc_new_pipe;
> 		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> 	}

OK.

#At first, RZA2 had 'dparam->has_usb_dmac =3D 1'. But, DMA had some
 issues, so I removed it.



> I prefer to add "{ }" on "if" and "else" like below.
>=20
> 	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR)) {
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (i & 0x03));
> 	} else {
> 		for (i =3D 0; i < len; i++)
> 			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
> 	}

OK.
#I always prefer braces. It is easier to read.


> > +static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
> > +				void __iomem *base, int enable)
> > +{
> > +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> > +	int retval =3D -ENODEV;
> > +
> > +	if (priv->phy) {
> > +		if (enable) {
> > +			retval =3D phy_init(priv->phy);
> > +			if (enable) {
> > +				usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
> > +				/* Wait 100 usec for PLL to become stable */
> > +				udelay(100);
> > +			} else {
>=20
> This else code never runs. So,

Yes, thank you.

This code is ugly, so I'm going to change it.

Chris
