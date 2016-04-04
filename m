From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC 3/3] checks: Add unit-address checks for PCI buses
Date: Mon, 4 Apr 2016 11:08:32 +1000
Message-ID: <20160404010832.GE16485@voom.fritz.box>
References: <1458780021-5052-1-git-send-email-robh@kernel.org>
 <1458780021-5052-3-git-send-email-robh@kernel.org>
 <20160331053220.GF416@voom.redhat.com>
 <CAL_JsqK5Ze4P8ofykfebV30TrMzur0cvhZi_RQMkW-kUbsvTpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqK5Ze4P8ofykfebV30TrMzur0cvhZi_RQMkW-kUbsvTpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 02:52:44PM -0500, Rob Herring wrote:
> On Thu, Mar 31, 2016 at 12:32 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Mar 23, 2016 at 07:40:21PM -0500, Rob Herring wrote:
> >> PCI device unit addresses are in the form DD or DD,F where DD is the
> >> device 0-0x1f and F is the function 0-7. Add checks that the unit
> >> address matches this form.
> >
> > Hmm.. we ought to be able to do a bit better than this, again by
> > constructing the expected unit address from reg.
>=20
> If I do that, I can't check the dev and function values are within range.

Not from here, but that seems an odd place to do it anyway.  Instead
I'd suggest checking the dev and function values in a verifier for
'reg' values on the bus, then check the unit address afterwards.

> > While we're at it,
> > it probably makes sense to have that dependent on a check which makes
> > sure the first entry in a pci device's 'reg' is the config address.
>=20
> You mean just check the first cell masked with 0x1f000000 is 0, right?

I guess, I'd have to look at the PCI reg encoding again.

> Really, I'm not so worried about checking PCI devices. DT's with PCI
> devices described are rare. All I really want to check first are
> leading 0s, leading 0x and uppercase hex. That's 90% of what I find in
> reviews and am tired of commenting on. I do think bus specific checks
> are useful, but don't think we need to fill them all in right now.

Ok.  How about we leave the PCI checked function as just /* TODO */
for now then.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXAb6QAAoJEGw4ysog2bOStcEP/2S/bmsTWFnZxgANo5y0UkQy
aiK0bSD7xwb3ceSJODYB7CiT5DPStIp+TkcWIoa/PoS3WvDDghvDRzoZAm13cIEM
5zMMMnogjhZAMWAryb3IICweSc9ay5McAyDFAqxpAcgCVDau75J6wpAfLhJYteo1
OwjTKy+4eOQk0jNuYMiyfrmf/NtM90XcV5XL+kQu2UUlsiMJFPe6dyd9o/xg9X7j
vIa2hmA2qopSM0ahZU5JjWynrseD+/AkVATZG5dmnY2uEmD79WpUMOMy9fPZxPJG
a9/Er+WWml1eCZ9eI6AZpWGBzBDOGINYty8/36nrxcBJ/QiWhICWa4VZgH+WEYTn
A40iCoRJFGYYOC4LOOXDVBboq4uhh72DdRKfgw4Ad14jy4R+g+TSUj0ND6ZmAT4d
TTPdgNIVcDDUgEBH9xrvR0/wE+/064lHDRk5WO59dqGAJDtzNIJVFgLEXGI1oT4F
e55e4PLtaofSVBMrijnGyBCKriP8wQg4Z5TCKEjtRzVzhvCd4jWPMHcPM6rHKTRj
/9DCBzIlqAPM7J8D52/chL0hgdUrQVUUGSKybghOiCUvSzMhmd/0owkSIVNB4xW8
SfH31gu3JjMg7+UKasW1N3WDhNlIPeZfgSvgcvF91R04hQde8RaMBP6zRmFZR5ns
uGko7MPwHCZpsaNgt+Dr
=ZDca
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--
