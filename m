From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] regmap: Add hardware spinlock support
Date: Wed, 1 Nov 2017 10:13:02 +0000
Message-ID: <20171101101302.fnryw6443xlaq5ch@sirena.co.uk>
References: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u67jqfrvq3wstb6t"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--u67jqfrvq3wstb6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 01, 2017 at 10:11:55AM +0800, Baolin Wang wrote:
> On some platforms, when reading or writing some special registers through
> regmap, we should acquire one hardware spinlock to synchronize between
> the multiple subsystems. Thus this patch adds the hardware spinlock
> support for regmap.

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-hwspinlock-support

for you to fetch changes up to 8698b9364710e7bac84b3af07dd410e39c8c2e08:

  regmap: Add hardware spinlock support (2017-11-01 10:06:29 +0000)

----------------------------------------------------------------
regmap: Add hwspinlock support

----------------------------------------------------------------
Baolin Wang (1):
      regmap: Add hardware spinlock support

 drivers/base/regmap/internal.h |   2 +
 drivers/base/regmap/regmap.c   | 101 ++++++++++++++++++++++++++++++++++-------
 include/linux/regmap.h         |   6 +++
 3 files changed, 93 insertions(+), 16 deletions(-)

--u67jqfrvq3wstb6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln5ni0ACgkQJNaLcl1U
h9AuDgf/fUW8kwdJVDaFbYa7pvur07Xy4byW+hYfOkQV4EmMcZ3Tb7wUzgOaTKP/
SFP4eK5DOka0ejyp/L1whW47+Z+t9QjarGYonurRPRgYH+D/B9+u40kS4HK1cpuP
x+3BiFV/7FIC2VTtNb1ZECLAao7oMinMcup03PDgeTN8cPDCc0EcQK6zvP/VNEeB
16X7UCgSQ8xGOGY1b7w++w5XYNh99Pk/0gMIFBh6U7ThYbZLGiLZlyINMrexbEy3
wg6FmAC53j/FMUkNxOXhunOZgZ1OOo9/zLgR9Ror8XIrGGenrCy9YSGujpd1VTZO
o1Sdx8TojKBHXdCtK3EaEHApMtY6YQ==
=RLmF
-----END PGP SIGNATURE-----

--u67jqfrvq3wstb6t--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
