From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Wed, 18 Oct 2017 12:09:58 +0100
Message-ID: <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
 <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bzphq2jqparykyo3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bzphq2jqparykyo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2017 at 06:35:24PM +0800, Chen-Yu Tsai wrote:

> I'd like to add something on the topic of non-Linux projects. In this
> case it's diverging DT bindings from U-boot:

> https://patchwork.ozlabs.org/patch/823158/

> U-boot already has a set of devicetree binding additions:
> https://github.com/u-boot/u-boot/tree/master/doc/device-tree-bindings

> The patch in question wants to ab(use) the regulator-name property for
> driver instance binding. In my opinion this is not going to fly, as
> boards are free to define the names. This either sees no use other than
> as a dirty workaround for dts files that aren't following the PMIC
> regulator bindings (regulator node names should follow well defined,
> identifying names), or results in divergence of the DT files.

One meta issue I'm seeing here is that the u-boot people appear to have
their own divergent copy of some of the binding documents.

--bzphq2jqparykyo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnnNoYACgkQJNaLcl1U
h9Aqqgf/Tt4qP1izi+d7AxDn/VDK+wgO0/ocjIkcXydHOqk0RhEn8wavrIJhHbbt
4f4xxJbZ17LOCFEAWpF4mK0zq4TOkWqx3WUgmV82rXAa8ItYReSH1u3/e61gvrOI
5dzN3UQkP6f6D16nams1ObLkzQ/UzfsYyVIXoOkV3Rq6kXY5CYM5QD1ugPJWIw7g
Y3PB9nBdbTf8tDKBONCkL4G2JPC0ZWP7vL5D0rKfXshW3B+/4m2njuHi1LRwcuz2
i19ma/YxjEXmhKSGL1YdU9kQtoKJgGI1XLX81YjYWYUoFnCTh9cv4kYFky01Smp2
mkqC+lRLx+0VIcTNfzjwiP5Nnxwnrg==
=fc0l
-----END PGP SIGNATURE-----

--bzphq2jqparykyo3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
