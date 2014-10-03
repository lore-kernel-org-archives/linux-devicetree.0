From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/7] clk: sunxi: Specify number of child clocks for
 divs clocks
Date: Fri, 3 Oct 2014 16:05:23 +0200
Message-ID: <20141003140523.GL4039@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-2-git-send-email-wens@csie.org>
 <20140930154043.GN4081@lukather>
 <CAGb2v64RPi2J4gpWu7X15xSx89guPSoEs2_7Bxs9ywj023fabA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kc9HNjpzOXVc7FFU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v64RPi2J4gpWu7X15xSx89guPSoEs2_7Bxs9ywj023fabA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Kc9HNjpzOXVc7FFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2014 at 11:56:24PM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 30, 2014 at 11:40 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On Sat, Sep 27, 2014 at 04:49:49PM +0800, Chen-Yu Tsai wrote:
> >> Currently sunxi_divs_clk_setup assumes the number of child clocks
> >> to be the same as the number of clock-output-names, and a maximum
> >> of SUNXI_DIVS_MAX_QTY child clocks.
> >>
> >> On sun6i, PLL6 only has 1 child clock, but the parent would be used
> >> as well, thereby also having it's own clock-output-names entry. This
> >> results in an extra bogus clock being registered.
> >
> > Isn't PLL6 having two childs as well?
>=20
> No. It has one child, the normal PLL6 output clock.
>=20
> The last "clock-output-names" entry refers to the factors clock itself,
> in this case, the 2x clock output.

Hmmm, OK, I guess that's one way to see it too :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Kc9HNjpzOXVc7FFU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJULq0jAAoJEBx+YmzsjxAgJKEQAL0Yx1cyySGcPlZUAK3594MT
wXzT20jfNaxXKghL6nHWZ3YGAN4Hz5w8dk/vMewoJbEjA4itsS0K76nXMGp6ngOm
uqxzBGQez1EFL5LSSQqed4+qkWFuLgt4epstAsx/gMzxbMJNoHcpSv4TG6dYYILC
gfn4T070ZIZe7YnXZKLHDM37EiD9nj9oQaOK8CVdGE2d2JAK/Wxp+xHfu+jwg+uu
KddOZ+zAWOebE4FM0yqGG351i5zDim/yB+OF/qs70TXW7LCMCJnnKWDfKNsdjXt7
wFJIYkfBo+aRwMQ+byeKkfrtCEhJJB7fv5Dqb7LUOhM1cK08Y6thTcur3hoVSeXG
Bc5s/5N4nqTKLe/yGHOGZW41fv8p74PpyadMd1wdiMEV2n6lqXFXhIUktdYldcPU
0HNj9DdHdKjco35/2ttfrSKF9ChLsiqdt1skPGDkibLv+r8XNBu+8aAjYO/sPU4l
+DvwKkKIjmfpVabQeWnX77gTEIgErtx/cePEfRuMIFTqTLrqbeC/apXL6beOK1Og
miHOTIH0ZVE6yI2b8I+7hKdgD5M6YDxzbg5/18XTSCJ0g/25tLGmuI8ozdXMQehk
ms/i4N/8WVa1UH40kHqCGxdUbuiKX2o7CsCv+TFo7/JDeth4/0QYfZmDFGN/eKHi
HnIa2WZqKv39cvc2MeFV
=r31I
-----END PGP SIGNATURE-----

--Kc9HNjpzOXVc7FFU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
