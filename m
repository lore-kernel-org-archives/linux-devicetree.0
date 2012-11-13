From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: [PATCH v8 5/6] drm_modes: add videomode helpers
Date: Tue, 13 Nov 2012 12:31:14 +0100
Message-ID: <20121113113114.GD30049@avionic-0098.mockup.avionic-design.de>
References: <1352734626-27412-1-git-send-email-s.trumtrar@pengutronix.de>
	<1352734626-27412-6-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272678877=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1352734626-27412-6-git-send-email-s.trumtrar@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: linux-fbdev@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Herring <robherring2@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--===============1272678877==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 12, 2012 at 04:37:05PM +0100, Steffen Trumtrar wrote:
[...]
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
[...]
> +#if IS_ENABLED(CONFIG_VIDEOMODE)
> +int videomode_to_display_mode(struct videomode *vm, struct drm_display_mode *dmode)

This one as well may be more consistently named
drm_display_mode_from_videomode().

> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
[...]
> +extern int videomode_to_display_mode(struct videomode *vm,
> +				     struct drm_display_mode *dmode);

And this also needs protection or a dummy.

Thierry

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQoi+CAAoJEN0jrNd/PrOh7eEP/1UMe4mFQ4hylZL84gOC+gFV
urjbU7pSMMfg1z+pTabAq6g/fTlcCmzAW0tfdOjo78MCuyifOw/N9iTxOuWaCkUJ
VfMCyk5WIhRQWWjd66/FTuLjFRzMbb3bkKwIXxk9xLPDalWKBeBX3Cn79xxnWgEh
Zx9U4h+J6omaNhCgXyJEsZu8vdBSuXjTGzrnsVsCKYeHP7OUUDCH2YY7s8pWj7Sq
BuF6EN/Mhrk5vw+tJjXVuLVD57EvXnZyuRikvL3gF43Nvj0xKcPilRL1z1fWniyM
P3I7sQPB5W7gdxVQZM+KwLSiyX3D8y7apZJxlSaGD9/dXVC9YYiI+3qHbeDQnC/T
YkqSsiDvwFbg+PA4xN6eYOGNFjtDHmQhJ6cJUUAo7braP+CxYYO3tkrb4in89Dl/
CaPKtMUwFO3z8et0QkR7g7cAoSwN6EoeOLsFtVqaTWTNgz0VsvKm0pJSUdPRVQO1
IvdkH4XWke8gRGK6cHYru7g6NQMfl3Jnpf+VEAB96zYQaBELAZvwUFq15n2y4AMe
8CTsfEkbrpKHd547HhkWffijhX5ohPBgolMFUO7NKk9Sc1I+g1fdFYl25qiPba5w
I5BrSKfc4qwbPW6WC8ZbeBNzNGtp+nuyFn0hD9b2eLbo3qEavSwL+nfOdGUGSqSC
Qk5m+qY/BEv3W8VThjwO
=ul4+
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--

--===============1272678877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1272678877==--
