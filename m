From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: dwc2: Option to disable dma descriptor mode
Date: Tue, 6 May 2014 13:36:30 -0500
Message-ID: <20140506183630.GA31117@saruman.home>
References: <1399328585-30949-1-git-send-email-dinguyen@altera.com>
 <A2CA0424C0A6F04399FB9E1CD98E03046D193CDB@US01WEMBX2.internal.synopsys.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A2CA0424C0A6F04399FB9E1CD98E03046D193CDB-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 06:21:02PM +0000, Paul Zimmerman wrote:
> > From: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> > Sent: Monday, May 05, 2014 3:23 PM
> >=20
> > Even though the IP supports Descriptor DMA mode, it does not support SP=
LIT
> > transactions in this mode. Since the driver can get the Descriptor DMA =
mode
> > support from hardware, the driver in its currently form cannot fully su=
pport
> > LS/FS devices connected to a HS Hub when Descriptor DMA mode is enabled=
 in the
> > driver. Thus, we give the option to disable Descriptor DMA from device =
tree.
>=20
> Hi Dinh,
>=20
> Instead of this patch, how about if we make the driver default to buffer
> DMA mode instead, and if anyone wants to use descriptor DMA mode, they
> can add a DT property for that? I don't think anyone will want that,
> since as you say it doesn't fully support LS/FS devices in that mode.
>=20
> The driver originally worked like that. I guess the default got changed by
> one of Matthijs' patches, and I didn't notice it.

if this is the case, I guess you could call it a regression - well, it
_did_ break LS/FS use cases - and still merge it during the -rc cycle.

cheers

--=20
balbi

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTaSuuAAoJEIaOsuA1yqREF24P/i3JFLf9H+hlanczWj4lP5A8
M72iYa1qBVjSjsVyRaMkhmaXIc/3JjF05Lc06Z/ym5EfHzB92KHmeKWgzSLTPIpu
4N2tK5APUZ9ksh+CTCCXD42qjvhowQqVCKtKSJZQ8JAdKDDEu2fsztRYATwtCS03
iEQFvru5FJqR8ZhDB2yO4eh2hQyOtuF1ym3HBzywHC3JgN6v2hCGp+wOMG/DiLzv
as/fqd3mOLOxO85pMC+wc4eLRMxY8ewfxSPmotozPNI1XMmRe3nVPsszt8AOaWaj
qmYraAHsX3NzH1neLbX0gF+Zab3VRdwE1kuNhegHpVK9JG3rMk/dHYeqTA04NQi+
PvI//VamuhnjdwTWYxK22N+s19zgteJTK5Z2/KMb8pkj2RTfTLh/Nm9LkjIUzA6N
lNlS6qoXEpvzWg8Vicd6rrPNlGtYemAgMFvXXykOlwckDBp2KS1XBashBhicQnu9
coQeNo3pGKL0Vcbp5wklhli6BGjF6FGdbm/fWBAoXAuS9DsqmFw+0tucQ46F4ZXI
JJqtJxydzZqapfYYV0mqkOVQvlv5Bt24gcr1mH+B3tY3brpbhUuYovIvKJ/5Rs9k
pzwzey1Tj7AhPMUf10dKkZTJwgU++6oSVcWTIQfIWhL6tqd4wriMq05mvaSHa+an
AyqCOfJfx5Bja+tEKZoy
=8tZG
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
