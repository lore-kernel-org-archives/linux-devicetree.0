From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Tue, 19 Nov 2013 10:11:42 +0100
Message-ID: <20131119091140.GE31504@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
 <20131118155022.GB28334@sirena.org.uk>
 <20131118160626.GN26046@ulmo.nvidia.com>
 <20131118183502.GP2674@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118183502.GP2674-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 06:35:02PM +0000, Mark Brown wrote:
> On Mon, Nov 18, 2013 at 05:06:28PM +0100, Thierry Reding wrote:
>=20
> > Part of my point was that you could possibly still use the same IP with
> > only a modified (standard) register interface. That way no licensing of
> > third party IP would be needed. You'd only need to rewrite parts of the
> > IP to make it look (and behave) like the standard one.
>=20
> > That's exactly how 16550-compatible UARTs work, isn't it? Or even the
> > way that USB (EHCI, ...) work. There's a standardize register interface,
> > possibly with a way for vendor-specific extensions, but the interface
> > itself doesn't need to be licensed, so there are no additional costs to
> > supporting the standard interface. There are only the advantages of
> > being able to reuse a well-tested body of code.
>=20
> My (potentially flawed) understanding here is that the register
> interfaces for this sort of thing tend to be very thin - perhaps more
> true for SPI which is extremely simple electrically.  Adding a new
> interface therefore ends up being more invasive than it could appear
> since assumptions in the design and validation tend to appear in the
> registers and so changing the register map propagates through.
>=20
> I do agree that it'd be nice to get some standardisation at some level,
> I just fear that it's a bit late.

It certainly won't be easy, but I don't think it's too late. Hardware
used to be simple, and operating systems used to be simple. But that's
no longer true. There is a reason why we're trying to come up with ways
to move some of the complexity out of the kernel. We know that things
aren't going to scale well if the rate of change and increase in
complexity continue at the same pace.

Isn't that the reason why PSCI and similar have been conceived? Even DT
is a byproduct of those developments. What we've been doing so far is to
come up with ways to solve all these problems with additional layers of
software. But I don't think we can go on doing that endlessly. Doing so
also makes it increasingly complicated to build a complete open-source
stack for a device. If you have to rely on all sorts of firmware to boot
a device to a usable state that can very easily become really messy.

While it might already be late now, it will certainly be much later a
few years down the road.

Thierry

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiytMAAoJEN0jrNd/PrOhFLMP/1VSMIhicDijURfh6ZHJcXgJ
gRIDMvpHJDCdgNDUNYHNRzPUMstYbUdoh4AqFxUsR0AhkxanfaymVbxVb9Z98xbf
v7lodTN/x1FgXeffGnbGY09tLObp5srGzROCNWjXByDyEZin4qTVzFd58l1HX9aE
wf1Lg1pvxzYiYugFWMEJ0OzarrqBSfFUnO7hP0/VQu7hLEv2NlQD0Vsd87mgsVnV
2VWDWU+PnDo+5c/H+I9PKL36suabOPZMXiZt3NL/D2uK6hdfhzg5rJKlHT9iux8T
nlmEixNKnCWp2tYtgd+YeY0bbGKl4uiXQJH+agzx37AD75Dei3cr1/PYigHcu5d0
5NGiu+uVaPTLq0kOtvRQwYNartRrAJAcPUkwIQ9P9qTg9nPrXCdGNDiuXXeputha
B8g5tBkoqJfwvUdkJiBfswwMf8P+GCS6hcaQeBo0SC2K7LD4fMbveeMdfZI53qnx
VRyjyXNSiivcU+SoVmCLUUoDdyApjCalTDqPsXzcELCU8hcjuL2WH8zANQSOU40c
Gv5URyJq+Izj+FoQRr8GRsEOvjpCX6+Cm4ILw4KGoMrAsavpwoIRFwrG2RWTOOJQ
nH+cKw7uAqjIgJ1ujibE4YKmlDz1un9XoS+fLAANjHFh85JuFzTd/TLq83hEw+jD
Mx3hvOxQB093Ac73hqDa
=PcaW
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
