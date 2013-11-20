From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Wed, 20 Nov 2013 14:29:10 +0100
Message-ID: <20131120132909.GB8279@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131118122644.GA26046@ulmo.nvidia.com>
 <20131118134022.26EE7C409EC@trevor.secretlab.ca>
 <20131118135727.GD14306@sirena.org.uk>
 <20131118152920.GL26046@ulmo.nvidia.com>
 <20131118155022.GB28334@sirena.org.uk>
 <20131118160626.GN26046@ulmo.nvidia.com>
 <528A4B5D.8050809@wwwdotorg.org>
 <20131119093504.GF31504@ulmo.nvidia.com>
 <528B9F8C.5080202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528B9F8C.5080202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 10:27:40AM -0700, Stephen Warren wrote:
> On 11/19/2013 02:35 AM, Thierry Reding wrote:
> > On Mon, Nov 18, 2013 at 10:16:13AM -0700, Stephen Warren wrote:
> >> On 11/18/2013 09:06 AM, Thierry Reding wrote: ...
> >>> Part of my point was that you could possibly still use the same
> >>> IP with only a modified (standard) register interface. That way
> >>> no licensing of third party IP would be needed. You'd only need
> >>> to rewrite parts of the IP to make it look (and behave) like
> >>> the standard one.
> >>>=20
> >>> That's exactly how 16550-compatible UARTs work, isn't it? Or
> >>> even the way that USB (EHCI, ...) work. There's a standardize
> >>> register interface, possibly with a way for vendor-specific
> >>> extensions, but the interface itself doesn't need to be
> >>> licensed, so there are no additional costs to supporting the
> >>> standard interface. There are only the advantages of being able
> >>> to reuse a well-tested body of code.
> >>=20
> >> Your idea would be great if it could be made to work in
> >> practice.
> >=20
> > This wasn't really my idea, so I can't take all the credit for it.
> > =3D)
> >=20
> >> I'm not convinced how possible this would be, without ARM
> >> mandating it in their contractual licensing terms, or large
> >> customers mandating it in order to use SoCs for their flagship
> >> designs.
> >=20
> > I don't think ARM mandating this is necessary. In the end it boils
> > down to faster time to market, doesn't it? I mean if you have a
> > device that exposes a standard set of registers and a driver for
> > that standard set already exists, then it's very little work to get
> > the device working with it. You also save a lot of work on
> > validation.
>=20
> I get the impression that many silicon vendors simply do what they
> want when there aren't constraints that dictate otherwise. The
> benefits of upstream SW aren't valued by everyone, let alone the
> benefits of the HW equivalent - the standardized registers we're
> talking about. As such, without some force pushing for
> standardization, people won't do it. That force would need to be
> either ARM, or the customers/partners/ecosystem consuming the SoCs.
>=20
> And note that we already have drivers in our product kernels (and
> simplified drivers upstream) for all this HW already, so switching
> register interface would actually be more work at least in the short
> term.

Yeah, if this could be made to work I'd expect this to only pay off in
the really long term. Even if people were convinced that this needed to
be done now I suspect that it could easily be a decade before the
benefits could be reaped.

In some ways it would be fundamental shift in how the industry works,
and quite probably not everyone will be convinced to tag along.

> Likely the best way to drive this forward is to talk to our silicon
> engineers and try and drive this through them. If you can persuade
> them, perhaps it can trickle back up to ARM and across other vendors.
> If you as an NVIDIA employee can't persuade the NVIDIA HW designers, I
> don't expect you could persuade other HW vendors:-)

It sounds pretty daunting. I don't feel like I personally have enough
experience or knowledge to drive something like this. Realistically this
would need investigating the myriads of register interfaces in existence
and extract the commonalities into something that could be made to work
on all hardware.

Then again, perhaps higher-level software abstractions could serve as a
good template. After all, the subsystem-level APIs in the Linux kernel
are already catered to supporting most of the hardware out there.

> > The 16550 UART register set wasn't mandated by anyone as far as I
> > know, but still the majority of UART devices implement it. I guess
> > the same is true of EHCI or SDHCI.
>=20
> IIUC, the situation is a little different.
>=20
> A platform existed that used the 8250/16550. That product got into the
> market first (or created a new market). Others wanted to be compatible
> with the product, so had to implement compatible registers. Thus,
> everyone made their motherboard/chipset UARTs work the same.
>=20
> However, with ARM SoCs, there are multiple tens of vendors all
> developing products at once, and even for different markets, so the
> whole "must be compatible with this existing thing" driving force
> simply doesn't exist, simply because there is no one single "existing
> thing". Systems are also larger, and there are many more SW developers
> employed, so there's a bit more ability to deal with different HW too.
> It may not scale infinitely, but probably better than it did 30 years ago.

Perhaps pursuing this isn't such a good idea after all. If things really
ended up going in that direction many of us might turn out unemployed...

Thierry

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSjLklAAoJEN0jrNd/PrOhePIP/R8be9+0xTM+B9m4NeHVvP3a
RsShWzdldgUJ5LjFcQTIXLVsyuScfRir3qJocNcokHBkyFxYp6N8zXImNNUdGiml
IVmV/a6hSfN73/pcPCDwoLHav5gvnMEWs2vJO4z6C/X8V8iXWB85kLNXCb7wtQ3Q
JkAmofypltcn5nkF8hwnYACdq0yCHjLHEeqqWqe8KZogZsiCIkzDtqK+XypgQcvq
GBmhisdLqoKWrsuhrzegC3tOfiXsQfA7gF8Xfd9hS+G8+u8gAbmTtrwYsddXoeNy
ETu8ia3mvs9hsSYEvazd6IigLg5LfQxmJmy7n9BfogpiW/wkIIUxAGK3xHH8+sGn
WBz7wPHQLxOYHxLCB0L5KQP0JQW/X8G0E1ALAN9nhv/XiDHiRq9OBBAZRbb1s2XV
Di3TjR0/9w1Ev3mxQYv5OrUJleBqroVkffcPaIyMYrokbO3gxiNpAg9qY2qUiNEV
wAkc2v38RcD6jQezaKUX1FBiIqyldel99AvkYu1f6A4fyfMVWIASUqP29VwW2UIf
WWA2oTv4i1nnL9qNuqAMSHIMDVdZmlOWjVzjpbwZGDmzRuGF1jBKjVtmWCMWUeRx
7utHAGVbPWKbx9xDw6Bmjg44jO0WWQf0XS5yPysU75OLheagA+xdLPzXbG4OoENX
EtiJ9VZk/dNekYnp5I+9
=gTx0
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
