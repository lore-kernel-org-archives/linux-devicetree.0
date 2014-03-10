From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: Support SiRF audio modules
Date: Mon, 10 Mar 2014 16:48:12 +0000
Message-ID: <20140310164812.GN28112@sirena.org.uk>
References: <1394184531-7679-1-git-send-email-rongjun.ying@csr.com>
 <20140310103532.GI14976@lee--X1>
 <CAByv0RNQrPitsfcAwMvn=eZ1hNSaii=jw94H68rQvfQXnjYz9A@mail.gmail.com>
 <20140310163158.GI13661@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B3waPi4ExgyhRtaA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140310163158.GI13661@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: RongJun Ying <rjying-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Rongjun Ying <rongjun.ying-kQvG35nSl+M@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--B3waPi4ExgyhRtaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 10, 2014 at 04:31:58PM +0000, Lee Jones wrote:

> > > I'm not sure there's any need for this. Why don't you just parse the
> > > child nodes? Are you even sure you need an MFD at all? It appears
> > > you're just using an MFD to share a regmap. Seems like over-kill to me.

> > In my case, the prima2 and atlas6 codec have small different. But
> > they use the same register address space.
> > The sound codec driver need know what codec device is applied.

> I understand it was you who made the original request for the regmap
> to be shared between devices. Was it an MFD that you had in mind?

I was expecting an audio driver that registered several interfaces with
the ASoC core rather than a MFD.  It's possible there's some good reason
for doing things this way, I've not looked at the new patches (I only
seem to have one for the MFD itself...).

--B3waPi4ExgyhRtaA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTHezJAAoJELSic+t+oim9mrQP/3n/+zpuU0nzAqyPcMfdDPKj
iNGsfC1ZNT6aA+9u/xCUZpl61bJJKPFHQPrcDCOnIeTNFHrdBwmBylvrJ7YpedzJ
2F/GsUC19pBPmwnW2soa4IJUEluNODbXNjZ0NB6cWvwCzlwNGSqmgpPeeuMjyTP9
XKKt82kxwzaeZd0h8Xc/chFRdB3K1u7worHbJn7pcZPxYHIHyQo4YKoaF81fZG+1
HFEgzhCmj1wuQ4HRm6N4fyZpdn38NSXdGZ9I6t1t9B7lR4NyfeO/A5ZDTU0yzuy/
t/1W74jwYtiyPWVbX0OvIOY5prT68kzLHoCMBa2+VDXZgyhymP7eBEEYUUH5HBR5
Zvgeny8hzRUR+tzH16xf3A2kzGxCJi4xVTCNItoeFE0G/70/90xD0WRPzk/hp+tr
oY4MTPoT64CMgZYdY5ZlIIwLcz1BHk8g1+NXHu5hJrPHuhoPGdgMhH0ZeZdqG1ot
eohhppGYSPs5jNhS4NzNFE1D59pqdowt93QZ4T39aUwkQ+wmi3oT26xftUOEk9Js
ArMDCnm33F8sJfu/vcBrSXw3HlEQ4LIYFw1hOBmK3JKAXhXhTgsR4g0qU/jy9jyu
D4KAp0LkufNT2Hn2iWUWTQqpzVj9dq6o4eQ8T34YCQLIY820Gh+gnjaCkxoLNaSB
idkoBNNjt6qb++t4UUXv
=zcyA
-----END PGP SIGNATURE-----

--B3waPi4ExgyhRtaA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
