From: Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] regulator/axp20x: use axp2xx consolidated header
Date: Fri, 12 Sep 2014 08:39:00 +0100
Message-ID: <20140912073900.GP7960@sirena.org.uk>
References: <1410215046-31751-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1410215046-31751-4-git-send-email-jacob.jun.pan@linux.intel.com>
 <20140909112516.GR2601@sirena.org.uk>
 <20140911152650.74767024@ultegra>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hHiQ9nAwW5IGN2dL"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140911152650.74767024@ultegra>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: IIO <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DEVICE TREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Srinivas Pandruvada <srinivas.pandruvada-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Aaron Lu <aaron.lu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Zubair Lutfullah <zubair.lutfullah-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Doug Anderson <d>
List-Id: devicetree@vger.kernel.org


--hHiQ9nAwW5IGN2dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2014 at 03:26:50PM -0700, Jacob Pan wrote:
> Mark Brown <broonie-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org> wrote:

> > but is it really worth the effort of renaming everything?  That's
> > going to cause problems for things like the stable workflow.

> sorry for the late reply. IMHO, consistent and correct naming has
> longer term benefit. how can i help to make the stable workflow easier?

Not do the rename - it makes doing a git cherry-pick easier.

--hHiQ9nAwW5IGN2dL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUEqMTAAoJECTWi3JdVIfQq2sH/30hPjsGPESzE2pIVY1cIi19
pOKvb0WfjbYwyS1/nkGnNvHas1rvGWlFbm0TalnzMQ5yj/UPaYJBQCRbuFUFzEnJ
h/jVGSKcawpVuMcmworDupOY050ueHbZ3B2quuyoIi2jUy+k+941eg8/tWcO0ZDf
++e23Vwm+YQ5QL52Glr2dVCqfiAtP4jg/SSw/r4PJ1BfmwnQO0Zj0xJ4kMVy0ecd
OxZHwqxHXQxppXxbwqt+XrecCPN9o29DKu9dEurkpqXkQLDcFdX6Qq682Rp+vPdH
E9FrNuIY9MjD1aME0pPmfnEcPPZGxJw/yrCdxxGF13ZVbTdrG1xawhV1tqnOEoo=
=wIrp
-----END PGP SIGNATURE-----

--hHiQ9nAwW5IGN2dL--
