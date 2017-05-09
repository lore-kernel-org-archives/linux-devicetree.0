From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 08/13] drm/sun4i: add support for Allwinner DE2 mixers
Date: Tue, 9 May 2017 22:19:19 +0200
Message-ID: <20170509201919.ubzhiyntdwf6wlog@lukather>
References: <20170504114858.9008-1-icenowy@aosc.io>
 <20170504114858.9008-9-icenowy@aosc.io>
 <20170504130535.6nokhni5a3uxwy66@lukather>
 <522ab8cb2939f0017917c5e9b4065089@aosc.io>
 <20170505123618.5vztqx2vdwsgnrxt@lukather>
 <185C1948-541D-4198-9A56-E3F0DFF08734@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7lzqphmuxoahqya2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <185C1948-541D-4198-9A56-E3F0DFF08734-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7lzqphmuxoahqya2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 08:39:31PM +0800, Icenowy Zheng wrote:
> >> > > +	/* Set base coordinates */
> >> > > +	DRM_DEBUG_DRIVER("Layer coordinates X: %d Y: %d\n",
> >> > > +			 state->crtc_x, state->crtc_y);
> >> > > +	regmap_write(mixer->engine.regs,
> >> > > +		     SUN8I_MIXER_CHAN_UI_LAYER_COORD(chan, layer),
> >> > > +		     SUN8I_MIXER_COORD(state->crtc_x, state->crtc_y));
> >> >=20
> >> > X and Y are fixed point numbers. You want to keep only the higher
> >16
> >> > bits there.
> >>=20
> >> Do you mean "lower 16 bits"? Thus should I (x & 0xffff) or ((u16)x) ?
> >
> >Nevermind, I got confused with src_x and src_y.
> >
> >> P.S. The negative coordinates are broken, how should I deal with it?
> >or
> >> is the coordinates promised to be not negative?
> >
> >Adjust the buffer base address, and use a shorter line. You have such
> >an example in the sun4i code.
>=20
> Are they these two lines:
> ```
> paddr +=3D (state->src_x >> 16) * bpp;
> paddr +=3D (state->src_y >> 16) * fb->pitches[0];
> ```
>=20
> I think I copied them here, so I don't need to mind this problem any
> more, right?

Hmmm, yes, probably. That's pretty easy to test anyway, you just need
to set up a plane with a negative base coordinate.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7lzqphmuxoahqya2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZEiQ/AAoJEBx+YmzsjxAgW9IP+wZgjL+Xuohyxz9qHyWbGvQ3
8rvP3uy3kTSZUmK7R5ZToR46fVfyln3OYVDck0u413Qp62solWuZMaaCCvZcq/x5
duU1DpLdjPiaK5XZ4i8HcwlnrEzpR5Av+qMuq/htn7vGEP3hmf5/Ie0ypLS/sygQ
jFBafh3O4c7/ZITOSONVXyrGgFI6ovBkIb3ckchyo0vcLoREzFmnoARvRavu4bgi
Zuvvbz06G1KsvUFvM0aeCgOFdkztb+dqMV7Qnhyk2M8blJLSJPSFkRQ6cz8LYlKS
eDgh+XuZE/lDTQkME9onZa0r9vmO95Nn1DxKaBNEF5Ip4OUPfYGWFaSY033N+a2n
v5ah1S0W5plAm3mTUQmaQ278Zb3VvVDPfJmMWeK5irUaw56RPm4Ejz3FGz0OZbbx
KJ5MqFXhf1aAOFaF9j3Lgy53ETuW640BocJ3nRl/iFklE9d/3VmUzCFuMezkJgSM
Jp6HCRE0qBAufU0bG1LLZ05IQzhoE5XQa9nc+Ev3E0PLDiYi69mqqDw7NcY411a1
may9vqzyop9ICn3IXyzFb8b1ZDjdd7LQFTbpHtw3Wa5gTROwOh/ALXjppAhOM83I
dx5Q8PLkve9TQ7PWatY8ygfM6zx3aZ08nxJbMA483tfpWwwS+3y9Z3KU/LZu5O6A
1az+1RLoi4DoyqzYqHm9
=fB72
-----END PGP SIGNATURE-----

--7lzqphmuxoahqya2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
