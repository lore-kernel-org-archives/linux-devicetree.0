From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 14:23:47 +0200
Message-ID: <20131024122346.GD11296@ulmo.nvidia.com>
References: <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023174458.GC5208@netboy>
 <1382553982.31058.10.camel@sakura.staff.proxad.net>
 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382615278.8522.72.camel-Fexsq3y4057IgHVZqg5X0TlWvGAXklZc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 12:47:58PM +0100, David Woodhouse wrote:
> On Thu, 2013-10-24 at 13:33 +0200, Maxime Bizon wrote:
> >=20
> > ok then how do we solve that case:
> >=20
> >  - Marvell SOC 1 is mainlined
> >  - Marvell SOC 2 is mainlined
> >  - Marvell SOC 'x' is mainlined
> >  - "PIO" hw crypto driver is written, working for all SOCs
> >  - [1 year]
> >  - SOCs bindings are marked as stable
> >  - [1 year]
> >  - someone rewrite the driver of hw crypto to use DMA, existing binding
> > is not ok because clock 'foo' or interrupt 'bar', now required, are not
> > present.
> >=20
> > what is the process merge that driver ?
> >=20
> > if the answer is that you need to keep PIO mode in driver so that
> > existing DTBs still works with it, then this is just plain *wrong*.
>=20
> If you can automatically infer the correct clock/interrupt/etc in order
> to do DMA correctly, despite the fact that it wasn't explicitly spelled
> out in the old DT, then the property is *not* a "required" property.
> It's optional, and you have a default behaviour for when it's not
> present.
>=20
> (And if you *can't* automatically infer that or otherwise get away
> without it, then you're asking for the impossible, surely?)
>=20
> The default behaviour in the absence of these properties may be
> horrendously complex, and it may be defined only for SOC [1..x] and not
> newer versions; it may be *mandatory* for SOC x+1.=20
>=20
> But if you really want the new driver to do DMA on platforms even where
> this information wasn't originally provided by the DT, what option do
> you have?

To me it sounds more like the sensible default would be to continue to
run with PIO support if the optional properties needed for DMA support
are not present.

Determining default values for the properties pretty much defeats the
purpose of putting them in the DT in the first place, doesn't it?

Thierry

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaRFSAAoJEN0jrNd/PrOhAgMP/jgd+dsRnfCPFP8Nb106yru/
4eXkkGZ9JT/I6sBO8ZZrK9GS05+3MpP0H3HITCUNt3MpKHxrp7a0iiYI78SDg+cm
egxb+TIu9+BoGM6aZTUKP8VybO8Ug4kMmYvWbGX+cGiVl+PyT1/krgMgXRXXSjji
voL6giim29kRbxC8larwtYncUPTp8XCov0S1wsJx6bxTrUXSFemuCXsfkOLElC9J
BWDwhm1qdUM+M1BHl3L8ZZX+L6j/8W/1OsPDNpWMXSUgoQmzVffCT9PRb2me0+la
jiR+hSYDCZQz7KJbLlIvl2xkASg6JHDu8KLRjRmWV8K6qyEfoxiWVpxnvman8VZ0
g+Qx3Qu8Lbzx5jXjVAbEtJXo5mZNupbuowRPg+mBOipGF/cRZS9WUcaHCd9I8eEI
yts65xN71TrlbBx+4Yscd3fwH2W76xc/woiimRWBIGe5h07kJYLao/9tRWQPYs9S
xRnsIePSPeFnprqP3HZDj5yGe89tChSl+lfke0Gc/UVttZXf58n8K844/l2oapEV
lpippRJnY+cl4+C9pbgcj17dxdqnv1NxJ7SsWRMHxdF06BA3hTgO3f/j7P/P0VF4
BEhx9Ol934cxW2tGF+n81s29hpJgrMlUYoWvKTqcwfpVSAYJptOkcivejWPJmPFQ
tHK1/EawOjUQC2p6FsMz
=qqyV
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
