From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH/RFC 2/2] usb: host: ehci-platform: fix usb 1.1 device is
 not connected in system resume
Date: Tue, 21 Feb 2017 10:18:36 +0000
Message-ID: <SIXPR06MB05591EA8EE8977E5332EFC2CD8510@SIXPR06MB0559.apcprd06.prod.outlook.com>
References: <1487576111-29287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1487576111-29287-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20170221085103.GA19659@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170221085103.GA19659@b29397-desktop>
Content-Language: ja-JP
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

> From: Peter Chen
> Sent: Tuesday, February 21, 2017 5:51 PM
>=20
> On Mon, Feb 20, 2017 at 04:35:11PM +0900, Yoshihiro Shimoda wrote:
< snip >
> > @@ -297,6 +298,8 @@ static int ehci_platform_probe(struct platform_devi=
ce *dev)
> >  		goto err_power;
> >
> >  	device_wakeup_enable(hcd->self.controller);
> > +	if (usb_of_has_companion(hcd->self.controller))
>=20
> According to Alan's comments, all USB ehci platform device can be async
> device, so this API can be skipped.

I got it. I will remove this API.

> > +		device_enable_async_suspend(hcd->self.controller);
> >  	platform_set_drvdata(dev, hcd);
> >
> >  	return err;
> > @@ -370,6 +373,7 @@ static int ehci_platform_resume(struct device *dev)
> >  	struct usb_ehci_pdata *pdata =3D dev_get_platdata(dev);
> >  	struct platform_device *pdev =3D to_platform_device(dev);
> >  	struct ehci_platform_priv *priv =3D hcd_to_ehci_priv(hcd);
> > +	struct device *companion_dev;
> >
> >  	if (pdata->power_on) {
> >  		int err =3D pdata->power_on(pdev);
> > @@ -377,6 +381,10 @@ static int ehci_platform_resume(struct device *dev=
)
> >  			return err;
> >  	}
> >
> > +	companion_dev =3D usb_of_get_companion_dev(hcd->self.controller);
>=20
> Maybe other EHCI controller has companion controller too, so it is ok
> for you to let it as a common API.

I got it.

> > +	if (companion_dev)
> > +		device_pm_wait_for_dev(hcd->self.controller, companion_dev);
> > +
> >  	ehci_resume(hcd, priv->reset_on_resume);
> >  	return 0;
> >  }
>=20
> You can send formal patch next time.

Thank you for your review! I will send v2 patch set without RFC.

Best regards,
Yoshihiro Shimoda

> --
>=20
> Best Regards,
> Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
