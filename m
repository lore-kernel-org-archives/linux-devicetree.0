From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 2/5] regulator: make regulator voltage be an array to
 support more states
Date: Tue, 23 Jan 2018 16:04:59 +0000
Message-ID: <20180123160459.GH7600@sirena.org.uk>
References: <1516708783-6288-1-git-send-email-zhang.chunyan@linaro.org>
 <1516708783-6288-2-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xQmOcGOVkeO43v2v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516708783-6288-2-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xQmOcGOVkeO43v2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 23, 2018 at 07:59:40PM +0800, Chunyan Zhang wrote:
> Some regulator consumers would like to make the regulator device
> keeping a voltage range output when the system entering into
> suspend states.

I tried to apply these but there's earlier versions of some of them
already applied on my topic/suspend branch so it's just a world of
conflicts - can you please rebase against that branch (or my for-next)?

Please don't resubmit patches that have already been applied, you should
submit patches against current code in the tree you're expecting things
to be applied to.  If any updates are needed to a patch that's already
been applied you should submit incremental patches which make those
updates.  This avoids having to change published git commits which could
cause problems for people working against git.

--xQmOcGOVkeO43v2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlpnXSoACgkQJNaLcl1U
h9AGPwf/cTgi+Gjw1zXd1GTGQ5pipd2XIAYE+zQn/WxQA7951WYKjO6UVfQOO0tQ
Xa1BgSppx9/XpkxiUPCg5Eg5MiH8JjNOv1S4k7/JxrRzKcEwnq1dNKrzDNNY2NLD
TnJi4dkSVQ9YaVdEreQb3X92baEG6bWOvmNUI26YCXynHZGJBEJM0e9KUHz/mFBd
PXveN/qA9ZBZJu2BGqeg+do3eA6tP19ePWpwkT73/vYOh43oQGt9JtE51PNWiK19
3/LUjtl67rz6pPivg2Buwre0AFvOx1Ci2loncV3KoCMEiKKRr+cDC9BYvcKSLwms
PviA6VKnoxFG9ruGloLxTUBDrskSSQ==
=+aL5
-----END PGP SIGNATURE-----

--xQmOcGOVkeO43v2v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
