From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Wed, 23 Oct 2013 22:05:00 +0200
Message-ID: <20131023200459.GB8828@mithrandir>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
 <20131023185909.GC7863@ulmo.nvidia.com>
 <20131023193959.GA6777@katana>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023193959.GA6777@katana>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 08:40:00PM +0100, Wolfram Sang wrote:
>=20
> > > I'd even go further and use "unstable-" as the prefix instead of "!"
> > > which is way more explicit.
> >=20
> > I guess unstable- is as good as anything. I personally think that "!" is
> > disturbing enough to the eye to make it abundantly clear that something
> > is fishy.
>=20
> "!" marks the binding as "special" whatever that is. A busy person might
> decide to not look that up as long as it works right now. "unstable-"
> (or maybe "unstable!-" ;)) is explicit so people know what they get.

We'll need to document this somewhere to make people aware of it. And if
nobody bothers to read that documentation then they're not entitled to
complain.

That said, in my experience people are just as likely to ignore anything
with an "unstable" in it until it breaks. Also I don't think "unstable"
is the right term. "unstable" implies that it somehow influences the
system stability. But that's not the case. "experimental" is much more
accurate in that developers are experimenting with the representation.

Thierry

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaCvrAAoJEN0jrNd/PrOhMLUP/3daxa2Fj9G7LjhZVCUook6v
9IaXzkB4ytYmOF+KY8gSJRwnaZC4YWFZhTgR49FKjjBOk7ARHcl/cZmX0moXMLZX
r26cf1UK3sx/rYW7I38HfoINn0QNELBSGII9E6NbuuBt2zWmBkDcopVJLlpv7cWH
e3kYkC3kszohtE9nmgwoGtOJiIOUg70Qv9h0sVHWBaPJyTu52xXBerp9LbBC1d5+
oPBv46V4GSgLI2s8LMua6RTlzAGIGfBLm4kOs/tEQxyorbEZm+EUdrCV+B7U2LqT
h37yONfFYDkRmhUHNyUb1jOcArZ2doW9RN2IInXawXmXc28OBJKZZBjLOOz+kBDy
NibUcHRpfn2Y1kP1THb6mjbk+NJI/kOoMrCO21OOK7lEdVa/FGqPiriPiKQPUWD0
+4nsmpbuEzaKfO2s5Eag7F+iyEOnSStXyap2u0alH0KnKgZd4Aa0+E8QLHO2jcpA
oPvwXDtug8xQ1iULc09bzefqIchAPtuPU5v/EHoXeEJ5IO5tqpmzN4d9KhsDA7Aa
V/U8sbX4t0m1AXgtW/1Kje0pCxxfBvr0Ym9046SQkf6Lezb/tktV/o1ZnLoC2OAx
QkEAq++bTC8cBoZhsobBkobzHMs5zDWjcE2qhsYQXTEkfUJmceIbPTGtrcKDugO1
4cFQPrPWbVk+DgEbQOyM
=Ghhm
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
