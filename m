From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Tue, 15 Mar 2016 14:48:22 +0000
Message-ID: <20160315144822.GP2566@sirena.org.uk>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
 <20160229174751.GQ21240@tuxbot>
 <20160301022326.GC18327@sirena.org.uk>
 <56D5111E.6090606@nvidia.com>
 <20160302033833.GV18327@sirena.org.uk>
 <56D65F7E.3090907@nvidia.com>
 <20160302043506.GC18327@sirena.org.uk>
 <56E81103.8010903@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zxEKvxCKojqA/Afl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E81103.8010903-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gandhar Dighe <gdighe-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stuart Yates <syates-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--zxEKvxCKojqA/Afl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 15, 2016 at 07:11:23PM +0530, Laxman Dewangan wrote:

> So here we will need two parameters:
> advertised-ramp-delay for PMIC configurations and
> ramp-delay which is measured one.

> Most of time, advertised-ramp-delay is same as ramp-delay and hence one
> value from DT will be sufficient.
> If there is difference then both value can be provided and
> advertised-ramp-delay  will be used for PMIC configuration and rest of
> calculation about delay will be from ramp-delay.

This sounds more like the difference between typical and maximum spec
values than anything else, we are looking for maxima in Linux.

--zxEKvxCKojqA/Afl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW6CCvAAoJECTWi3JdVIfQiKQH/iex503K7e4ns+oVkx9uHqSJ
8be13i2grpX3DD0zfhEbLOp6xg9xkxgvHz56Z+V9NNL3F4tmA2y4dxNMzkFo1VVv
nyapz1XZ7Y6lwaLiLS3l3rMc2FUwgPXxq2P4lvQvPy6A31fBthFLVl0PHwO+vRc9
8J76npZZ0Qx7jsXeltnrceTsPsa/ruNmVR9w1ri8y+mlJlENJAy2f9GpeA5EkPDI
YyejMQ9j1tF8fuPeopZwU2wiL6MIXulsISqjBEAz0/PGLyE1NugAOZ2A6bItI4ye
rE2S+TxJ4MWOAwjQEuc+xO4458ArCv0RH263fOiXMBuqs/emSQe5ozdMmL5HHfI=
=PDmT
-----END PGP SIGNATURE-----

--zxEKvxCKojqA/Afl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
