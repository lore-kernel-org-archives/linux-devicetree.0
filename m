From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v8 00/23] usb gadget update for OTG 2.0
Date: Tue, 4 Aug 2015 10:09:52 -0500
Message-ID: <20150804150952.GE23659@saruman.tx.rr.com>
References: <1437622667-6735-1-git-send-email-jun.li@freescale.com>
 <20150727072157.GA20654@shlinux2>
 <20150729150427.GA32418@saruman.tx.rr.com>
 <20150729232401.GA8175@shlinux2>
 <20150730021141.GB3811@saruman.tx.rr.com>
 <20150730014657.GB8175@shlinux2>
 <20150730141006.GB18246@saruman.tx.rr.com>
 <20150804000029.GA19818@shlinux2>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tMbDGjvJuJijemkf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150804000029.GA19818@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <b47624-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+d-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

--tMbDGjvJuJijemkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2015 at 08:00:31AM +0800, Li Jun wrote:
> On Thu, Jul 30, 2015 at 09:10:06AM -0500, Felipe Balbi wrote:
> > On Thu, Jul 30, 2015 at 09:46:58AM +0800, Li Jun wrote:
> > > On Wed, Jul 29, 2015 at 09:11:41PM -0500, Felipe Balbi wrote:
> > > > On Thu, Jul 30, 2015 at 07:24:03AM +0800, Li Jun wrote:
> > > > > On Wed, Jul 29, 2015 at 10:04:27AM -0500, Felipe Balbi wrote:
> > > > > > On Mon, Jul 27, 2015 at 03:21:59PM +0800, Peter Chen wrote:
> > > > > > > On Thu, Jul 23, 2015 at 11:37:24AM +0800, Li Jun wrote:
> > > > > > > > Change for v8:
> > > > > > > > - Add Peter's ACk for chipidea driver; and Roger's Reviewed=
-by for patch
> > > > > > > >   07, 21~23.
> > > > > > > > - Add ci->is_otg condition before enable ci->gadget.is_otg =
for chipidea
> > > > > > > >   driver in patch 8.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > Hi Felipe,
> > > > > > >=20
> > > > > > > For chipidea patches in this series, help to queue them in yo=
ur tree=20
> > > > > > > please, thanks.
> > > > > >=20
> > > > > > all there, please make sure they're correct. There were so many=
 versions
> > > > > > of this series that I might have picked up the wrong one :-p
> > > > > >=20
> > > > >=20
> > > > > Patch [8/23]: "usb: chipidea: set usb otg capabilities", you pick=
ed up the V7,
> > > > > I have a small change for V8, others are correct.
> > > >=20
> > > > Can you send an incremental diff, please ?
> > > >=20
> > >=20
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index 61fde89..c6d1595 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -1838,8 +1838,8 @@ static int udc_start(struct ci_hdrc *ci)
> > >  	ci->gadget.name         =3D ci->platdata->name;
> > >  	ci->gadget.otg_caps	=3D otg_caps;
> > > =20
> > > -	if (otg_caps->hnp_support || otg_caps->srp_support ||
> > > -					otg_caps->adp_support)
> > > +	if (ci->is_otg && (otg_caps->hnp_support || otg_caps->srp_support ||
> > > +						otg_caps->adp_support))
> > >  		ci->gadget.is_otg =3D 1;
> > > =20
> > >  	INIT_LIST_HEAD(&ci->gadget.ep_list);
> >=20
> > I need it as a real patch with Signed-off-by and all, so I can apply :-)
> >=20
> Hi Felipe,
>=20
> I have sent it out as a formal patch for this incremental diff, but still=
 not
> in your next tree.

it's in testing/next :-) I should be able to merge that back into next
today.

--=20
balbi

--tMbDGjvJuJijemkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVwNXAAAoJEIaOsuA1yqREpN4P/3/cdGUZ9CjrKncb6x86D2Oe
gUpZhaPaqH9FhyMfSTPeVKGM1HNcE8iyIiPa6OJyl9g1BPkrFokcujO0J3Ghf2V4
pYiH4HZ2nA+T0EYnewB1qGTw9j23EhK/8O1z6JysaOnrffuQV5hRJwS2wNyf46MP
lo0j/V5dyt060dWN0ES/0yrzVoo4ZSEDOr/pik3luSiqCIcdbQeY768qCI2BHcVI
5NE/XjDDdKHhhYCiAm2EiyhWvQZHSFfgo7zSrPp8+WJaN96UgSpOYEWTise7t/6y
6U6liRcRnRX6LCUxtgCPTp5vSKmtz/ug1NGYAe7vE2+H+flzv5yQcHNir/+WKmt/
Jn+yT6aaGBEjK/ZpqaI7JxOT1GgNitPE42vcnFDn2ajLur6W0PYZODY6Oma/PtZ4
u4fbM0pUE5KmORIstbMZqaw6hJ3WzRD4/9Be0/EsDyuY/5BBV7SQzodza0/06Wcz
3qMewAwHbB3TXYIMDvfPYpe+0ZlR9f34rKYj2G/2ZyxuNg42tuTcC9Cv4pDWNHRP
FD1MDy+Y+O1oLjgkASwMQUGzNEBuCUmAuP/671Jr23VnAue4c7vwo3d/VYQjD9eg
9fiBYJDE0Kzyb6tc/CbCS+70JbPa8x2BTmD2Tvoupm49hA6wjuy9mM13qmSsffWE
412RBItfgfv0iMSrgvHI
=GQos
-----END PGP SIGNATURE-----

--tMbDGjvJuJijemkf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
