From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Wed, 2 Mar 2016 13:35:06 +0900
Message-ID: <20160302043506.GC18327@sirena.org.uk>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
 <20160229174751.GQ21240@tuxbot>
 <20160301022326.GC18327@sirena.org.uk>
 <56D5111E.6090606@nvidia.com>
 <20160302033833.GV18327@sirena.org.uk>
 <56D65F7E.3090907@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OERKX9dfyl+YxCYM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56D65F7E.3090907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--OERKX9dfyl+YxCYM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2016 at 09:05:26AM +0530, Laxman Dewangan wrote:
> On Wednesday 02 March 2016 09:08 AM, Mark Brown wrote:

> >You're not trying to scale the value here, you're trying to replace the
> >value because the PMIC is incapable of delivering the advertised ramp
> >rate.  Trying to express this as a multiple of the advertised ramp rate
> >is just adding complexity.

> So should we provide absolute ramp value here for platform specific?

Yes, otherwise if the PMIC vendor respecifies their ramp rates to
reflect reality and the driver is updated then your DT will be broken.

> Or any other suggestion to handle this situation as this is very common and
> almost all our boards have this slowness on ramp.

Perhaps time to have a chat with your PMIC vendors...

--OERKX9dfyl+YxCYM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1m15AAoJECTWi3JdVIfQnAsIAITnSX/NjJKpWWFNOISvGNxN
gWigZacaKPvSe0eVBL2kR+y+v9QueRJnpcwIqQJ//xj/fJFzuJLNLXSH1rRnaou3
IZ3LDuTsy+pa8aAFEr5BW2CtCLYgdrhOmVqzcSC/UexjS7Vi8r+ctTiHEZBpNOfQ
5KTySMLqN/n6F7RbanTDmYMjBonRS7ff/8djRT2zVuKcaTxpTxviPPqs1LAXUlnO
NVG0VaCyyOSdwk5NroJDLpKjIf1SILhH+gbT5hAa4O9syr78FYGrE6vFCB1cfb+m
yS5CpOgok78t042LS1tNLKi3u3jNtWlufq6oHtd+Y0GcCZFRVJzp0Gxw+dWSgwI=
=whBh
-----END PGP SIGNATURE-----

--OERKX9dfyl+YxCYM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
