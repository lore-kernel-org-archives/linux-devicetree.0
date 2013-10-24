From: Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 10:35:59 +0100
Message-ID: <1382607359.6315.61.camel@deadeye.wl.decadent.org.uk>
References: <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
	 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
	 <20131022171346.GE4061@obsidianresearch.com>
	 <20131023080630.GA14413@netboy>
	 <20131023172955.GA17145@obsidianresearch.com>
	 <20131023180108.GA23728@roeck-us.net>
	 <20131023182502.GC32563@obsidianresearch.com>
	 <20131023183041.GH5208@netboy>
	 <1382570963.6315.48.camel@deadeye.wl.decadent.org.uk>
	 <20131024073236.GA4690@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Obwh7WmPMs2ffNgtMwJ0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024073236.GA4690@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-Obwh7WmPMs2ffNgtMwJ0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-10-24 at 09:32 +0200, Richard Cochran wrote:
> On Thu, Oct 24, 2013 at 12:29:23AM +0100, Ben Hutchings wrote:
> >=20
> > It starts by looking up the machine ID (in procfs, but may be overridde=
n
> > because some board vendors don't set it correctly).  If the machine is
> > supported using FDT then there is an associated DTB file which will hav=
e
> > been installed with the kernel.  The script copies/appends this to the
> > appropriate place for the boot loader.
>=20
> And if the ID is not recognized, then what?

Then we have no idea even where to install the kernel, or what wrapper
might be needed, so the boot loader will load it.  Lack of a DTB file is
a small problem; it would be easy to add an option to provide one
outside the kernel package.

Ben.

--=20
Ben Hutchings
Teamwork is essential - it allows you to blame someone else.

--=-Obwh7WmPMs2ffNgtMwJ0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUmjp/+e/yOyVhhEJAQou3BAAqecuz34EzB+vDbF7St9MsgbwFmOd+iSU
r0Z+FkkYBMnZ6uj8vD0669d6dUXdnCJvVysPbIi5x8fS1T+RoPQ+kdywGoRCe4jZ
1+WkFyzuzETa1vI7PUDpDaWv2Y284PVX8Mqw8GLgXKD6+GgF+i7YQ6keamkXH6Qi
GgKQ4e/Vb7jpmoWmBAKZw51WXNso3z/ejfu5Evnz6BIzlywwL6df50x5rJaDuKLH
GC495f9C/Ae3orFcA4QZ8RTmJnUMw/4da0r1cwjn3Z/od016Qx2dmDjPKgeGisSV
qsuzesXy4SP7i750IMQDJCZuTLQGrYEEymELxCbmfzR3IKSays928gwJAHbx7554
+AKa9SQmQhbK5EZax79UNV0U0VtY+xvXIyLFxbsjPG5R73Q7I9EPMJec1gFqismR
EpupWQy7dSrT3pwmJBGFhYog3ObD9Scgdgg1HtFfzFaNBACWEWabRpl7A7aNuzEZ
rhCa9202Y0Hn4n9gkSdbi30Gq3ZuQeWDBhAVneCYXJ5aqaEM7FV2X1ZL3FRqXlrM
U4N4C59eOSMKVA3ZODS0GBbdE5UGzboVpbWPwjINhJd1vY5fAcCWzzdeZyLQ5Q/g
/kZ1DdBgbsoUextZ7bodv5x4x95j7gMdsyZAsvhYz6RgrH5jAEbBQfr8Sj+DYzjt
eRIe/Zs6qmc=
=fdsS
-----END PGP SIGNATURE-----

--=-Obwh7WmPMs2ffNgtMwJ0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
