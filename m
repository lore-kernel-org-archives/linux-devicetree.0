From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Mon, 23 Jan 2017 13:34:04 +0100
Message-ID: <20170123123404.hb3ktetkn773tno4@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <CALAqxLV=5ZCu8=rDUFHS9148DxzrqeTipsueA7F4i3t-mcWr=A@mail.gmail.com>
 <20170120091608.ijdhpeq2t5no75rc@lukather>
 <CAL_JsqL5fYVvCRgui9NQVEM+=gkGUnf7-D9KHK9YTtJyfGy3Ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ul4q4fhleeblijcb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL5fYVvCRgui9NQVEM+=gkGUnf7-D9KHK9YTtJyfGy3Ew-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel@lis
List-Id: devicetree@vger.kernel.org


--ul4q4fhleeblijcb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Jan 20, 2017 at 08:15:21AM -0600, Rob Herring wrote:
> > The only thing that might be vendor specific would be the (optional)
> > declaration of the mali_gpu_device_data structure. As far as I know,
> > there's two things of importance there:
> >   - the list of the valid OPPs in order to do DVFS, but that could be
> >     made generic too using the operating-points binding
> >
> >   - And the valid area for the buffers for the fbdev blobs (fb_start,
> >     fb_size and shared_mem_size). I'm not entirely happy with this one
> >     so far (which is also why I've not pushed it). We'd need to come
> >     up with a way to get the base address and size of the CMA region
> >     backing the framebuffer allocation, but I haven't find any trivial
> >     way to do so, so for now I just hardcoded it. Worst case scenario,
> >     we can hardcode values based on the compatible.
>=20
> memory-region property?

That might do it, however those buffers usually are allocated by the
display engine, and not the GPU device. Even if we declare a reserved
memory region and use memory-region in the GPU node, chances are that
buffers allocated for the display may not be in that region (for
example if it's using the default CMA pool).

Unless we create a memory region for the default CMA pool?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ul4q4fhleeblijcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYhfg3AAoJEBx+YmzsjxAgIZMP/0uWLlH3TUZc2UAXzMmyhn83
96fcHif/aLM7dhpUgR98djgKwzf4QAjaRmirdf4K3E2kAD05D3E/LJqm0PXDnnFJ
OLEdPQ3Ccl2mJQnWrmyVO1WWuvT4IrtZuiS3OulkH2K+15qYcsjrjbvYxK1SCPP/
k9hiYI4WJh8qs2qyAMBfoohRO8CVQ2VN0qb4XkyplWM1oXixXhKcNx4QCKoYdmWP
/bTuwM53oBEsg+BWacuvV7vSXxGjdwoRYsEC8hP0/0k3OdCNPfB3qSrIzkScb2ry
r2vv/YFGvPqfC/OThAXJVl064R70WJHEJ4bWG/gJYW5MtZFMuC4tl+wpJtgQFPzK
ljMIMjcmM1YBes7RUZyK1g6POrnd8cksantXOuYynhtWWx7hUuCHq/JJEWJWbNCy
uzSuT1rbgKxVPm09VAevbmeTs6kHzfzQXMHZ8NAOMMnJG6ECg552t3zRgNUT4i5k
5dAYc7UFi+dgg8xDsjg6jCnRlY7yTAk9o/QAiD6GxgmVxChhUt3wQoTBgUvdk7ei
Jnj8DnYyarZ2SSxmkPhoWK+rS31RHguEaE6+nSEq6839eL040v6xl3GUyxcg04xx
wq9GH/nSFt3kUWrcKVVlUkb4p8Cpfwd000qXFDz62Iw0dUw5A4RmH3rn+GMvpNgS
ifENe4l5fDykgbhrWs2z
=/oag
-----END PGP SIGNATURE-----

--ul4q4fhleeblijcb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
