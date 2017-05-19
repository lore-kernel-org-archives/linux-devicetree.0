From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 1/5] drm/stm: ltdc: Add bridge support
Date: Fri, 19 May 2017 12:33:13 -0700
Message-ID: <87h90gfxqe.fsf@eliezer.anholt.net>
References: <1495207218-11372-1-git-send-email-philippe.cornu@st.com> <1495207218-11372-2-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495207218-11372-2-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Philippe Cornu <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org> writes:

> Add the bridge support, used by DSI host and HDMI/LVDS bridges.
>
> Signed-off-by: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>

The DW DSI host is bridging from MIPI DPI to MIPI DSI, right?  I think
you could just have ltdc always set up a DPI encoder (the
ltdc_rgb_encoder_create() function), and then depending on whether
drm_of_find_panel_or_bridge() finds you a panel or a bridge, you
drm_panel_attach() or drm_bridge_attach().

You wouldn't even need to wrap the drm_panel_prepare() and related calls
with a check for the panel, because the inlines already do that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkfSHkACgkQtdYpNtH8
nujRbw/+PSPuBLPaZdrdH718s1gOfHeYXn2opudOKsWWidVjs89HBZFbAmfbkkJv
Z7a9cVzhy76nhzeahaNgXXZBcU0ZU8f9ahZjItHlNyQmD5j1p8e1xgIcJsg0IYQo
ilmnjbhJBrj8ZcVGt7DpEumap2r2dwqqW0w4l/6Nz4jN2/iDU6iP4zR5Ej/KR8mR
4xeOqWEDhjHGOUK9XlUgUQlSALWHPf6+RbiBmdbWLGwrTBoPX1WHC0sd9ORcjt/x
j+R1zgQgDhUvWwOiq+JLw8Hxd22TBK7G+Ua4sAlv7u4ktRPgJhbkiXcV9aeE6Njk
JOpq2SzfmTPDHPz1bexr6okaE+c3YJE7cUsp8qEsGhcELwqa9XoB7o/O8gZtvWPB
oHaSggAUuGMGa9+qkumwAx4Y+FgvXC7IW8tR9u0+5LCTyIO4ErglkmIeA3YpO6iA
0BQBiaDOqIJqqRxFyE9/oDFlAahAD4MhXCtdMpKkkpfa8YbZvaEsPdfSeoNRwdAr
ywXyWtjI1eQi2eCi041Np3GhSOPZpLCMnCeIQSLdCpWuj/qgS5eY4ycAlQOJ0Rb7
rXPwyX77KJEWW2YkTyaUWjz5K3nScVj2JumbExAaK6h8leXmsz5VrfV5ISS4+MAL
dV5Yjf0qAcr245OTvG7T3xNbzzX8IUR2kaNippbjksjAFCE0Mtg=
=P3Dq
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
