From: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/15] ARM: dts: alpine: fix PCIe node name
Date: Fri, 24 Mar 2017 19:25:09 +0100
Message-ID: <20170324182509.2wwyy5ihwkhvbuu5@kwain>
References: <20170322020313.24338-1-robh@kernel.org>
 <20170322080137.st3osq5ckfis6uwz@kwain>
 <CAK8P3a2WOeNrz3J8vO+n+rhwn3N_vdOswZ0NMmYrdNvmkD8obQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zn74bhyksxuns43x"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a2WOeNrz3J8vO+n+rhwn3N_vdOswZ0NMmYrdNvmkD8obQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tsahee Zidenberg <tsahee-IEYhy/pPZWng2XuLRlxkFAC/G2K4zDHf@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zn74bhyksxuns43x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Fri, Mar 24, 2017 at 06:00:30PM +0100, Arnd Bergmann wrote:
> On Wed, Mar 22, 2017 at 9:01 AM, Antoine Tenart
> <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Tue, Mar 21, 2017 at 09:02:59PM -0500, Rob Herring wrote:
> >> PCIe bridges should have a node name of 'pcie'.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >
> > Acked-by: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >
> > This can go through arm-soc directly. If not I'll take it.
> > Thanks!
>=20
> I have a mild preference for this kind of patch to get picked up by
> platform maintainers.

Sure. Applied to alpine/dt.
Thanks!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zn74bhyksxuns43x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJY1WSDAAoJEFxNi8it27zYGP4P/iPzQblSCz4QFxK7a0jwt8zJ
f0pgNJIryuoDHj5JB8c38XDk5meYmyFP2JiWE80PvSMzz0qAIghLVdgdSYAJMged
9Lo+PscY21i2cYuzMcgySn3JMkCVmiPVcju3dmXhRw09ypn99GGPS6yjSCzC++Sg
wR0XFiLSvG8y6SDQBGzGyJ73CVVZnpBSnVzuxCRhrqA0lJTs6dSXs5saL1GzKls3
vW8pUq12sH40EMyPg8HIP/UaXiqigHypFA9KNt60RFCatfv12LE//s2xvfkmMfy6
ulY0O8O/UU79ipeFZD4QgCEdDQs0GT9BjUIZLASVuSw9uk3hrfoKZ3tJkEnTSgAQ
vO24LA1YZMiUgk6Bt7KTwCY0FvUiw7ot783We2tCi1gF8RSMSwcCXLh39hduJQl8
Yb64Qk+6JylvobHsIS/S3P0snTXebTiQFruHWIk7oMEqKSrlIv57R/emt2pvxIOH
1mDj5GF7yxk7XaCEzpLFALHKYCfMO/vue8RlpKRYvdrBhFg0oZ/otLE/iKGFN3xo
VW1tnx+kgyaJr7jOOakD6XcbkfhP3o5ekitMVdorEnVG0T3VqJMuVX/jYad+Yl+F
x9Owcd5R1eHSS5KCy4udbBA+hTuOE/KOTivjBzyQ95R2r0EohuP14CYJnVo3gZhT
69EZKnzuNW4F9XJ4wede
=NsOo
-----END PGP SIGNATURE-----

--zn74bhyksxuns43x--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
