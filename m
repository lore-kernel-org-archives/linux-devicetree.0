From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Fri, 25 Oct 2013 11:16:14 +0200
Message-ID: <20131025091613.GH19622@ulmo.nvidia.com>
References: <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023172955.GA17145@obsidianresearch.com>
 <20131023174458.GC5208@netboy>
 <1382553982.31058.10.camel@sakura.staff.proxad.net>
 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <526A3165.4020601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <526A3165.4020601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2013 at 09:52:53AM +0100, Stephen Warren wrote:
> On 10/24/2013 12:33 PM, Maxime Bizon wrote:
> >=20
> > On Thu, 2013-10-24 at 10:52 +0100, Grant Likely wrote:
> >=20
> >> At this point if the hardware exists then it should be described in DT=
B,
> >> even if it is merely compatible, reg, interrupts and maybe clocks
> >=20
> > if your driver does not use them, chances are you'll get them wrong.
> >=20
> >> properties. In many cases that is all that is required. It /is/ okay to
> >> amend a binding later and to use default values if the new properties
> >> aren't present.
> >=20
> > how do you handle the case of a wrong property, because you only wrote
> > hardware description and not the driver ?
> >=20
> >> hardware description when enabling previously unused peripherals, but =
it
> >> is absolutely not friendly to change a binding/driver in a what that f=
ails on
> >> previously working DTB (with the caveat that if no one notices, it
> >> isn't breakage).
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
> That situation describes enabling a new feature. New features aren't
> necessarily expected to work without revising the DT, e.g. adding new
> properties/entries to describe the additional clocks/DMA-channels/...
> that are required. In many cases, those additions can even be made in a
> backwards-compatible way. Compatibility means that we shouldn't break
> old functionality, not that we shouldn't augment the existing bindings.

In other words, the absence of the new properties should make the driver
fall back to a previous working mode, even if that means it might not be
as good as it could be. Making it use the new features would require the
DT to be updated.

Doesn't that entail that new properties will intrinsically be optional?

Thierry

--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSajbdAAoJEN0jrNd/PrOhLf8QALYe3B7ehVqG5fJ61o6KZu++
lDvWtIRozz41E5Fy2BYVZdboP5LaMq8DZAyYFnhzXxjeJehdAfMWjkn70VFcVHlD
Q3BOmW/CpkpPz0plqni9D+hR8YcnfQRGC4NefRfYx8FUjctyX0coSSxkJYmAA9jW
4J1o36AE5jTULXjxCBtKPF1vhiBZScZP8k/gnooZzn4pnf0Q560Lc+zwshEgiz1+
TvKDhjhO15SM4g2yY4hYVOEfc79plIBZ17ClcLG3avVFF7sbuwFPjpeAqEJKkav8
6SF4fFZI4grwr/Kn6UQ6ZI1aNSoDDqPtWw1txFUWkssioygTlEVOYi7UMmEXJgZX
cl5A8w28xUchYJNiX/QcO1I89E3ZUFTPk7XIpMyzVrt3OEIZ4lEvwZAyThEFFCKx
6C/yV9KxPFBx6dw1BeEfJRuQg1WLd81EFXd1VtlY2pAqeldLvvuSjM9e1ZO4hyd4
dsCAu+Fg18dNPWEQFwt9nzgj0T4M+q6LzL+i0CDQUdtXgl18JOWDMRhQz8astYhT
+CguMmQide5jftTkwOtvUPutczUg3OvA4vFFyG6g7fnYrpyOgEHXCWNETs9Z+Eyk
wlX1OynBPxzQmFbmRAd8wQ6gnycazyFgS4Sk973HRE32yhNWFLJsEmHYWnOASiiY
w3DyKS0Cd+kh/x6I2q3K
=zg0A
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
