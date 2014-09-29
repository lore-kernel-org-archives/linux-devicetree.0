From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] arm64: dts/Makefile: Add support for Spreadtrum's
 Shark64 SoC.
Date: Mon, 29 Sep 2014 15:47:52 +0100
Message-ID: <20140929144752.GP16977@sirena.org.uk>
References: <1411992293-7729-1-git-send-email-zhang.lyra@gmail.com>
 <1411992293-7729-4-git-send-email-zhang.lyra@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AwNVUpjOmSj7UnwZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411992293-7729-4-git-send-email-zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, artagnon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--AwNVUpjOmSj7UnwZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 29, 2014 at 08:04:50PM +0800, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

>  dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
>  dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
> +dtb-$(CONFIG_ARCH_SHARK64) += sprd_shark64.dtb

It's better to keep lists in Makefiles and Kconfig sorted
alphanumerically, that way there's less chance of conflicts when
applying patches or merging different branches.

--AwNVUpjOmSj7UnwZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUKXEYAAoJECTWi3JdVIfQz24H/3JHUNCIIe+oQu0RDtsRRR5M
A3XR98tDOuUnFaLSiLRPfMuVwgUS1sXOBzPCwqawPqbS0vV3vs4RAXx7g68T4rLM
mWr/RMAm3Jw2Al8uRJNKYUMEZ0vjj+/0sBD7ISVoTOeod2l7qgRZucMkZN9buIcN
c166c8u5sXorr84Uljvdr9LSP4YRbaLY/KGhvg8xRJuj1aKkzbIGcmiKuuLyy8Pp
E458PH85D7Q+ph3hGn1jP9bKkpLk0mx2szb7BE2NTL8DFajblEMBE4m68Vrw6Fee
74CW+GqNpc2AzCo1WW5auwzmiuSYEXxHlV45DgDymsz/riTlJpqnPWvw+l5ekkE=
=aJWg
-----END PGP SIGNATURE-----

--AwNVUpjOmSj7UnwZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
