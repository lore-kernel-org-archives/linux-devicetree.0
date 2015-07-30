From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 00/23] usb gadget update for OTG 2.0
Date: Thu, 30 Jul 2015 09:10:06 -0500
Message-ID: <20150730141006.GB18246@saruman.tx.rr.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
 <20150727072157.GA20654@shlinux2>
 <20150729150427.GA32418@saruman.tx.rr.com>
 <20150729232401.GA8175@shlinux2>
 <20150730021141.GB3811@saruman.tx.rr.com>
 <20150730014657.GB8175@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150730014657.GB8175@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 09:46:58AM +0800, Li Jun wrote:
> On Wed, Jul 29, 2015 at 09:11:41PM -0500, Felipe Balbi wrote:
> > On Thu, Jul 30, 2015 at 07:24:03AM +0800, Li Jun wrote:
> > > On Wed, Jul 29, 2015 at 10:04:27AM -0500, Felipe Balbi wrote:
> > > > On Mon, Jul 27, 2015 at 03:21:59PM +0800, Peter Chen wrote:
> > > > > On Thu, Jul 23, 2015 at 11:37:24AM +0800, Li Jun wrote:
> > > > > > Change for v8:
> > > > > > - Add Peter's ACk for chipidea driver; and Roger's Reviewed-by =
for patch
> > > > > >   07, 21~23.
> > > > > > - Add ci->is_otg condition before enable ci->gadget.is_otg for =
chipidea
> > > > > >   driver in patch 8.
> > > > > >=20
> > > > >=20
> > > > > Hi Felipe,
> > > > >=20
> > > > > For chipidea patches in this series, help to queue them in your t=
ree=20
> > > > > please, thanks.
> > > >=20
> > > > all there, please make sure they're correct. There were so many ver=
sions
> > > > of this series that I might have picked up the wrong one :-p
> > > >=20
> > >=20
> > > Patch [8/23]: "usb: chipidea: set usb otg capabilities", you picked u=
p the V7,
> > > I have a small change for V8, others are correct.
> >=20
> > Can you send an incremental diff, please ?
> >=20
>=20
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 61fde89..c6d1595 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1838,8 +1838,8 @@ static int udc_start(struct ci_hdrc *ci)
>  	ci->gadget.name         =3D ci->platdata->name;
>  	ci->gadget.otg_caps	=3D otg_caps;
> =20
> -	if (otg_caps->hnp_support || otg_caps->srp_support ||
> -					otg_caps->adp_support)
> +	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
> +						otg_caps->adp_support))
>  		ci->gadget.is_otg =3D 1;
> =20
>  	INIT_LIST_HEAD(&ci->gadget.ep_list);

I need it as a real patch with Signed-off-by and all, so I can apply :-)

--=20
balbi

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVujA+AAoJEIaOsuA1yqREcbsQAIahL7mr4Z59hrYEdBQ3TSWp
qxHWbBkVoDUkvzUel4CXhW3thDHl5pEEYHWqp4BX3Sq13BzO2L3n1LIbx50RjqhV
9Z9qW0p84AQ4853APWD+JNiLcbB3qnKFT5/Ibnv1+caFCmAq1Xh/AYsexsg4biR+
ZPdG3+++90a9LY7foslKe7OloTTsPM4tTL5svd6YGY814YFM8C8Na5z5EcEAFP9o
3Cyn0O2uknO7AVW0djUBawN/E1wwq1ArUCU0+uZYnmvR7lEopiJex44DfVEWW4ze
pUGCg4c9fHaCGURxoH3po+R8yQo3NRiE90wnyn3AQdqFLhWVeJijnII3Iyhy+f+N
Lv8pI84qtBTdnxwZ3OUru3qWpZs2fzOWrh83z3dyOlh8J5Z0MAtKP1NDRh6ddDN0
Y4grWV8tD0qzKe77eDWcj6zcqA+nxMUXtXrY7Zi68KK+/+bxSOfad6AUcYA8nSSy
/s3VMFn1BWz3nMiXsg/KFZWjnpZFO1yUX/dZfVdwYXvNzjed6M2YrE9qZwNQup3r
DpPw1WMsp/xTXyuwItVXxwdZ2bXinyvJav3mCPD3V4opkJW/QcxN1zp+zBpsSyXP
ltDUb+IV+s5LwyREOTbB5w7WWiA/K+I9uDDIeOed4Wj96tCIt1oQIFecTcTGQ/nB
/3804HUuyrHIXutpMika
=7Yxr
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
