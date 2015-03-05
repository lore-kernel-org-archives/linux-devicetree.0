From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Thu, 5 Mar 2015 00:30:04 +0000
Message-ID: <20150305003004.GZ21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F75E8F.2070900@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ext4kBY5hxW07XMK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F75E8F.2070900-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ext4kBY5hxW07XMK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2015 at 11:35:43AM -0800, Stephen Boyd wrote:

> There's another problem with this of_parse_cb design. The regulator
> framework requires supplies to be registered before consumers of the
> supplies are registered. So when we register L23 we need to make sure
> it's supply is already registered (S8 for example). If we used
> of_regulator_match() we could sort the array by hand so that we always
> register the supplies first. Or we could modify the regulator framework
> to have a concept of "orphaned" supplies like the clock framework has so
> that when a regulator is registered it waits until its supply is registered.

Dependency resolution isn't anything new, I'm not sure why you think
this is related to of_parse_cb()?  Open coding does exactly the same
thing and the ability to have device specific properties on is not
obviously related to dependency resolution so perhaps I'm
misunderstanding what you're talking about...

If you *are* talking about dependency resolution then just bulk
registering the regulators (which we should be doing anyway) and then
iterating the array until we stop making progress should do the trick
for most cases, normally there's only one PMIC in play, or have people
who care do a single struct device per regulator and then let the probe
deferral stuff sort it out.

I'm a bit nervous of the idea of having orphaning without core support,
it's not just inter regulator dependencies we need to worry about (they
use GPIOs and so on) and there's concerns about debuggability but it is
the kind of thing probe deferral was meant to be a cheap implementation
of.  There was a proposal quite recently from someone at Samsung Poland
to do something more coreish and basically split registrations in two,
one half registering the things needed for each resource and then a
second half which runs once the required resources are registered.
Pushing that along might be best, it's a more general approach.  The
component stuff Russell did has some similarities here.

--ext4kBY5hxW07XMK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU96OLAAoJECTWi3JdVIfQ8NkH/ius5JSSrp2xXI2AeA+MLIVF
Wfnt4PYCXBfBZJ4i87f0cWzuAHIEYldd2PplNohJBG8j37LwLPrirKsxJbVWDY+b
RgV09ASKVU/xPj+VCSJjPitCMscshxsPq/I6cGa6RGCaWYxDeZCdcaAt/vicFmEo
tYh+qKr8tKJG/dD7yBBmB+Uw0UhjIHwetTTHYVATs2ygtw9jgA/HzOLOsUiAjan6
Q/yTl36RO+/6xJHcTdWMUBLq75/ypj/jz6/eHbAgf7fTdJApd7FxHSdt+Dg7jMaS
o24XUh9gfQsRAuLma5uDM2J3ZPCTXBZC+vlX3QqvsfytzWMVXBw/OkOs76bVUYQ=
=7QEw
-----END PGP SIGNATURE-----

--ext4kBY5hxW07XMK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
