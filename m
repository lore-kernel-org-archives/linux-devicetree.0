From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] dt-bindings: spi/rockchip: Mark DMA as optional
Date: Thu, 4 Sep 2014 23:54:47 +0100
Message-ID: <20140904225447.GZ29327@sirena.org.uk>
References: <1409777067-17422-1-git-send-email-dianders@chromium.org>
 <1409777067-17422-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Sg+dTrkCjluZnrMn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409777067-17422-4-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Sg+dTrkCjluZnrMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 03, 2014 at 01:44:27PM -0700, Doug Anderson wrote:
> The Rockchip SPI controller works fine without DMA (aside from a few
> warnings).  The DMA property even implies this, saying:

Applied all, thanks.  Please use subject bindings matching the style for
the subsystem.

--Sg+dTrkCjluZnrMn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUCO2zAAoJELSic+t+oim9CTEP/Rf44WtOb/2Vx7JHJA2+h3UX
35cBi+EM8jfJ2Gs5bSL8bdErUkzd7FcVjaI+FCpn2BEc8uepPFFVrmG6RtZRspoT
wWpc+44c0Je9GlqLepcSx2lReGtaOTJk5fpVlkf+3qseHcGMpqruoUrVpGn6ACqn
H6Yi7JvxaLPeZ4MVvb6zfyy2GkvK0kSc5uFA5/AfBIeBUn0A+jQLQ8EuaUwhjdKf
9zWOmGIQ6LhjdTWuVU5F9W4pwpbRKE7hy7Csac3/8KZXaAdHIcz83fnjvXxdbnJc
hB/Zif6aNi/DEI0Ml7pKbl1LkrivtthbEzd5S1B4fBhfeqWCD/SKlCd0+4wbRkez
HlEfYNhm6doj6W39qRBmhCx+1QO4UdZ1muzUsAiYFESWbKyWg5U0UB5MfVTnktMc
yxkW6ZG+J+KkyEMCCCMT8Wk/gxmwTbDw5VFuhwv7evSng0bShl3bwW7zN5tNeGh+
8uZx2S/lZBDEkQUO3ePsse7+sXD8Hg1H9NY+/WQd1QLIT915Bcw0NNAm38tw1G0l
RMwalQakZlIvNWISCPFWINrSjeLeVz3+ppyPoU2DVMCyMsmVzMZ3ISNxevy58L+E
L4zilvlEzLQFkZN57Uqfzg7eXXEd4LuYupCFtPMIZvMmXkITLIXEZsw0ndEQWQmi
oJTVgZWn9vi9/PxCvpDp
=MFC6
-----END PGP SIGNATURE-----

--Sg+dTrkCjluZnrMn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
