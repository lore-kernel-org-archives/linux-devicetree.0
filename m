From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] regulator: core: Expose init_data to of_parse_cb
Date: Thu, 5 Mar 2015 00:42:20 +0000
Message-ID: <20150305004220.GB21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-3-git-send-email-bjorn.andersson@sonymobile.com>
 <20150303125033.GO21293@sirena.org.uk>
 <20150303161541.GE26334@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fM2POfT4cn4Bcg+b"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150303161541.GE26334-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fM2POfT4cn4Bcg+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 03, 2015 at 08:15:41AM -0800, Bjorn Andersson wrote:
> On Tue 03 Mar 04:50 PST 2015, Mark Brown wrote:

> > Why would the driver need to do that?  I guess I'll see later on in the
> > series but the changelog should make that clear.  Drivers aren't
> > supposed to ever need to look at their init data, modifying the init
> > data from what the machine provied is usually a red flag.

> I think what you're getting at is that the init_data should come from a
> board file or device tree. With the reworkings done in patch 4 this

Yes, that's the entire purpose of the init data.

> As this matches a regulator, there is no way for the driver (or anyone
> else to affect the init_data).

That's a goal not a problem.  There is an interface for the machine
description to configure the system integration which neither the
regulator driver nor the consumer driver should be a part of.

> The problem at hand is that there is nothing in this code path telling
> the core that we can do DRMS - something we can figure out in the driver
> by basically looking at the ops for the registering regulator.

No, that way lies people doing all the crap they usually do with putting
the default constraints for their reference design or the maximum limits
for their PMIC into the constraints and then getting upset when drivers
then go and use this to make their CPU catch fire or whatever.

You need to provide a way for the machine description to say DRMS (or
really setting the load which is what's actually happening here now we
have that op) is safe on a given system.  I think that means adding a
new permission to DT and then using that; it's more sensible to want to
use this feature in the context where we're working with an external
processor which also has a chance to have system tuning than when we're
working with the PMIC directly so a permission that enable load setting
seems good.

We could even kill the existing DRMS permission, there's one user in a
legacy STE platform.

--fM2POfT4cn4Bcg+b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU96ZrAAoJECTWi3JdVIfQ9wAH/09RE67yM8udI/f65JesU56Y
3omifO0fLKM3/SzbyUSDDX7pNSNwXshdAOqU5FyhTOv6BAhrYyGzSTMeOXUfFmtU
pItpn2IgTtpNCo1NaWxPeDoO8eLz+vU6UJYrAaEDR26oVwWs9Jn9nL+GkUUffeHJ
KsAVI20GkJPUgi/9HOUoPRP70KqMq5JfMVNF5DDSMcPDvcjDQsdiYg5gKhLJ1b0Q
tIsTTkAhcWk84lp/1Lg3HChF9dMvOR8u0Jt71PAp2lWnwRz7kKS0EHNOHKKZYrtV
RjUIB+dIwxE5NmG9nzYfutImdgfPzZQ130NTzRx6bcRgurYSpsgpFG3Zz5O56Sc=
=2HIG
-----END PGP SIGNATURE-----

--fM2POfT4cn4Bcg+b--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
