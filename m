From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [Ksummit-discuss] Devicetree Workshop at Kernel Summit Prague
 (26 Oct 2017)
Date: Thu, 19 Oct 2017 01:04:33 +0100
Message-ID: <20171019000433.y3qt3xaw4nnzvsga@sirena.co.uk>
References: <CACxGe6sxKzNKZbdGA-G=Th2oHwuanyC2kGYuaFcKbSRkuhep+Q@mail.gmail.com>
 <20171017114823.58476908@bbrezillon>
 <CAGb2v67GU4uW7uPMrqFjTW0qBR6LPNeX4Md+tf9S=HRWT_GVqA@mail.gmail.com>
 <20171018110958.mh76pngzluazmc7y@sirena.co.uk>
 <20171018175910.GP12015@bill-the-cat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lvrnqi4f33lcbutf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171018175910.GP12015@bill-the-cat>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--lvrnqi4f33lcbutf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 18, 2017 at 01:59:10PM -0400, Tom Rini wrote:
> On Wed, Oct 18, 2017 at 12:09:58PM +0100, Mark Brown wrote:

> > One meta issue I'm seeing here is that the u-boot people appear to have
> > their own divergent copy of some of the binding documents.

> Putting on my U-Boot hat now, it's mostly unintentional and something in
> general (yes, the initial topic here is not such an example) we try and
> avoid, or use u-boot, as the prefix on as it's something that had been
> previously rejected or deemed inappropriate to be in the upstream
> version of the binding.

Yeah, I didn't get the impression this was at all intentional.
Unfortunately it's a shared property with divergent definitions rather
than something u-boot specific that got added.

> But perhaps it's time to try and force the issue again, given what Rob
> and others have said in other parts of the thread.

Yeah, if DT is going to be cross project we need to do better here.

--lvrnqi4f33lcbutf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnn7BAACgkQJNaLcl1U
h9B0Awf9Fb9ds/if88WdUyhXMveJnzD10GiVuZ+Q9QIo/Po1PFYUPHi9l4Fu6fbc
fc3HdxF1DDy7ID3ejBJkagio0xqHnI20snL7kTJKFz+wy1TT0irx0To6iJfc202I
3Ce/19fzEhes1uBpiMBhr9YJpi6ANBVGo6bOyYyva3ofgcmpUVizW0xPHCqwHcPA
UXe7IhtVWcTh4dulOHksPJKMXnmdpyewcIIeQkon9zJxOc5eGENlWmeVWq/ah/aD
JcEg1iin145YSBSCa3bIBlC+mXDC2vmJTD+SuylqZCSuOP2l8Iz5O+6plCwLlUGC
3i9SZ4FlkPg7YAYG0KiLKJnBinVQCw==
=Z5fZ
-----END PGP SIGNATURE-----

--lvrnqi4f33lcbutf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
