From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 08/23] usb: chipidea: set usb otg capabilities
Date: Wed, 22 Jul 2015 10:19:55 -0500
Message-ID: <20150722151955.GF10467@saruman.tx.rr.com>
References: <1436426340-18477-1-git-send-email-jun.li@freescale.com>
 <1436426340-18477-9-git-send-email-jun.li@freescale.com>
 <559E3783.9010908@ti.com>
 <20150709132207.GA10197@shlinux2>
 <20150713010313.GB19248@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150713010313.GB19248@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 09:03:14AM +0800, Peter Chen wrote:
> On Thu, Jul 09, 2015 at 09:22:09PM +0800, Li Jun wrote:
> > On Thu, Jul 09, 2015 at 11:57:39AM +0300, Roger Quadros wrote:
> > > Hi,
> > >=20
> > > On 09/07/15 10:18, Li Jun wrote:
> > > > Init and update otg capabilities by DT, set gadget's otg capabiliti=
es
> > > > accordingly.
> > > >=20
> > > > Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > ---
> > > >  drivers/usb/chipidea/core.c  | 15 +++++++++++++++
> > > >  drivers/usb/chipidea/udc.c   |  7 ++++++-
> > > >  include/linux/usb/chipidea.h |  1 +
> > > >  3 files changed, 22 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/cor=
e.c
> > > > index 74fea4f..1e6d5f0 100644
> > > > --- a/drivers/usb/chipidea/core.c
> > > > +++ b/drivers/usb/chipidea/core.c
> > > > @@ -560,6 +560,8 @@ static irqreturn_t ci_irq(int irq, void *data)
> > > >  static int ci_get_platdata(struct device *dev,
> > > >  		struct ci_hdrc_platform_data *platdata)
> > > >  {
> > > > +	int ret;
> > > > +
> > > >  	if (!platdata->phy_mode)
> > > >  		platdata->phy_mode =3D of_usb_get_phy_mode(dev->of_node);
> > > > =20
> > > > @@ -588,6 +590,19 @@ static int ci_get_platdata(struct device *dev,
> > > >  				of_usb_host_tpl_support(dev->of_node);
> > > >  	}
> > > > =20
> > > > +	if (platdata->dr_mode =3D=3D USB_DR_MODE_OTG) {
> > > > +		/* We can support HNP and SRP of OTG 2.0 */
> > > > +		platdata->ci_otg_caps.otg_rev =3D 0x0200;
> > > > +		platdata->ci_otg_caps.hnp_support =3D true;
> > > > +		platdata->ci_otg_caps.srp_support =3D true;
> > > > +
> > > > +		/* Update otg capabilities by DT properties */
> > > > +		ret =3D of_usb_update_otg_caps(dev->of_node,
> > > > +					&platdata->ci_otg_caps);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}
> > > > +
> > > >  	if (of_usb_get_maximum_speed(dev->of_node) =3D=3D USB_SPEED_FULL)
> > > >  		platdata->flags |=3D CI_HDRC_FORCE_FULLSPEED;
> > > > =20
> > > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > > index 764f668..b7cca3e 100644
> > > > --- a/drivers/usb/chipidea/udc.c
> > > > +++ b/drivers/usb/chipidea/udc.c
> > > > @@ -1827,6 +1827,7 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
> > > >  static int udc_start(struct ci_hdrc *ci)
> > > >  {
> > > >  	struct device *dev =3D ci->dev;
> > > > +	struct usb_otg_caps *otg_caps =3D &ci->platdata->ci_otg_caps;
> > > >  	int retval =3D 0;
> > > > =20
> > > >  	spin_lock_init(&ci->lock);
> > > > @@ -1834,8 +1835,12 @@ static int udc_start(struct ci_hdrc *ci)
> > > >  	ci->gadget.ops          =3D &usb_gadget_ops;
> > > >  	ci->gadget.speed        =3D USB_SPEED_UNKNOWN;
> > > >  	ci->gadget.max_speed    =3D USB_SPEED_HIGH;
> > > > -	ci->gadget.is_otg       =3D ci->is_otg ? 1 : 0;
> > > >  	ci->gadget.name         =3D ci->platdata->name;
> > > > +	ci->gadget.otg_caps	=3D otg_caps;
> > > > +
> > > > +	if (otg_caps->hnp_support || otg_caps->srp_support ||
> > > > +					otg_caps->adp_support)
> > > > +		ci->gadget.is_otg =3D 1;
> > >=20
> > > It seems there are non OTG capable dual-role only ci controllers as w=
ell
> > > looking at ci_get_otg_capable() code.
> > >=20
> > > If so then this should be
> > > 	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
> > > 			   otg_caps->adp_support))
> > > 		ci->gadget.is_otg =3D 1
> > >=20
> > > cheers,
> > > -roger
> > >=20
> > Seems it was in my previous version but dropped it by mistake later,
> > I will add it.
> >=20
>=20
>=20
> After you adding roger's comments, add my ack.
>=20
> Acked-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

am I getting a new version for this patch ?

--=20
balbi

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVr7SbAAoJEIaOsuA1yqREJ/0P/2gFuZXc++t7kxRD5he2I7np
1YiI6x+hYP0S/J6sXjNc1aOZzvH6Iu6BqVd84phN5W14tVRQi2FT+phXzhTT/f5Z
X8vhUsu7WhKvZKJGv5Ksgc3gbwBp+3kOoHP51yG8J3gAndujZUiNvvr2MlgJi9jW
PC5DE0iBd9B1ctdg6nQSoIm4FSkBypf+Gvx/MvAweqRQ894BTXDTgWAS+qK/IclO
kHlmnFcIZTAC+ONFfZpgkckmDO90ib1rzgCUia0va9SXNWqLLAzPtpdtaIHHhl6V
/01f9/6bgFrCk3d0wMqClBjW180M0SbZ6ZRKjZOW/sIDGG6/i2SDPbbJC65RS37p
Acdge6woxvN/pfHMksPunmwCdIIwdYoaj31OOlI0ze8S/+wMY8FJyxogIqTG+Sqc
n0D3xR5fVX6NqdjTkiVVwjPCYHgHJk/69cb/keATEDopOp4FZcKeQGM+Obt5RQof
u9aWL33u8WuKVmShAb3fbGXgW5wKS97q1dajQxq1vU9vWpq5ixp60XfSNO3e/nHk
ab/IcZUhVafbAV9D2r4lPCsrEcasRGfNRNIRQbZ5OvgiVzD9rT7QuAjQRcZSlay6
Nxlzc0p8pfz2/KqZ1BndD2ZL6dQBPiTkUdnkV6XgeFPVb3F91FxiSZfzcL2uEHf/
ZzjSbBpw4IyP0xYu/vDu
=3eJ5
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
