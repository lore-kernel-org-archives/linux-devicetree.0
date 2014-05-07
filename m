From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc2: Option to disable dma descriptor mode
Date: Tue, 6 May 2014 20:58:45 -0500
Message-ID: <20140507015845.GB20489@saruman.home>
References: <1399328585-30949-1-git-send-email-dinguyen@altera.com>
 <A2CA0424C0A6F04399FB9E1CD98E03046D193CDB@US01WEMBX2.internal.synopsys.com>
 <20140506183630.GA31117@saruman.home>
 <A2CA0424C0A6F04399FB9E1CD98E03046D193D1E@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E03046D193D1E-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 08:11:34PM +0000, Paul Zimmerman wrote:
> > From: Felipe Balbi [mailto:balbi-l0cyMroinI0@public.gmane.org]
> > Sent: Tuesday, May 06, 2014 11:37 AM
> >=20
> > On Tue, May 06, 2014 at 06:21:02PM +0000, Paul Zimmerman wrote:
> > > > From: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> > > > Sent: Monday, May 05, 2014 3:23 PM
> > > >
> > > > Even though the IP supports Descriptor DMA mode, it does not suppor=
t SPLIT
> > > > transactions in this mode. Since the driver can get the Descriptor =
DMA mode
> > > > support from hardware, the driver in its currently form cannot full=
y support
> > > > LS/FS devices connected to a HS Hub when Descriptor DMA mode is ena=
bled in the
> > > > driver. Thus, we give the option to disable Descriptor DMA from dev=
ice tree.
> > >
> > > Hi Dinh,
> > >
> > > Instead of this patch, how about if we make the driver default to buf=
fer
> > > DMA mode instead, and if anyone wants to use descriptor DMA mode, they
> > > can add a DT property for that? I don't think anyone will want that,
> > > since as you say it doesn't fully support LS/FS devices in that mode.
> > >
> > > The driver originally worked like that. I guess the default got chang=
ed by
> > > one of Matthijs' patches, and I didn't notice it.
> >=20
> > if this is the case, I guess you could call it a regression - well, it
> > _did_ break LS/FS use cases - and still merge it during the -rc cycle.
>=20
> Well, the change from Matthijs went in on August 30th last year. So it's
> not exactly a recent regression ;)

damn :-) alright, then merge window possibly with a stable tag, so it
gets backported ?

cheers

--=20
balbi

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTaZNVAAoJEIaOsuA1yqRE9XwQAJrWFxCwHpXwp1KaI3Modprj
m5+qXFIkNSoZnrroi3yU6cz1li4jdyJEGosCiBn1JbWkKIZoV6dMDskzFx8BqoQr
2VcAmkSh1I8edDL7Gndxs33kZPpPx7n5NA0jxcsdoMrfB0wJfbg2nR8LBDWbioP5
ARqghCi/SmwD3T/huitrIVvDkYFs62iXW8sCQCadWI/eSiM0po88Qtkona/xQJEu
8H9VJ/Ep+xLAljYUse3QI4wdKRHK8GSttIg2+f/lnz5Wb4uehO+rXHPsnJN7gF6e
cCJ61mhnGIbL7l2ud5hApie/sVOO6WLDjDfIymp89zQz/B0vi/V8917lB2MVZfE/
M9wObWFmj5S1Bw27S5xKww7kQZRuxynmTBrZVjt7LluGD0TsnNCccYgWv5BbGY/a
+JRw8nIw4l23WFEarYVL7J/Hr/rwZne+/aaJvVftBy13aMgPQ/qpLggI6idpa90h
s67nJAMFRxiOC4gqkEhRQJ5tEiYggKInDkFv23VPj4JkkJ0cvDm/9aNtvmdRVq1o
QTTYCaqfGK3tg+NOdYJIcPDrDaFCiDB26ZyWKAkx0KqfNqhln5QB2YYFxvkT3FTr
ontK+Z0hYvr6QpJouhhKbDAbBg+w9ivj1tFq7pnM5jQY0qCC8l23MHy4DnV2BOM/
qd/1hNjhDft2IbUIjbiy
=cuPa
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
