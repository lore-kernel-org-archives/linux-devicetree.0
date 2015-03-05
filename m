From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Thu, 5 Mar 2015 00:56:14 +0000
Message-ID: <20150305005614.GC21293@sirena.org.uk>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F75E8F.2070900@codeaurora.org>
 <20150304235146.GP26334@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DEyyzOu/laT6xolt"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150304235146.GP26334@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--DEyyzOu/laT6xolt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2015 at 03:51:46PM -0800, Bjorn Andersson wrote:

> I took a stab at implementing EPROBE_DEFER within qcom_rpm-regulator,
> but as it's a mixture of internal and external dependencies (e.g.
> <&pm8921_s4> vs <&pm8921_mpp 7>) this became quite messy. I started
> looking at using the dt dependencies sort and iterate over the entries
> in a way that adheres to their dependencies, but that's also a lot of
> code.

This is why I don't like trying to open code in subsystems, it's too
much work.

> So I think you're right, we should be able to alter the supply lookup
> code to defer the EPROBE_DEFER until we actually need the supply to be
> there; e.g. attempt to map supplies when an external consumer request
> the regulator.
> Some care needs to be taken with regards to e.g. always-on regulators.

I'm not sure why always on regulators would need special casing here?
Enabling is orthogonal to supply mapping.

Like I said in reply to Stephen's mail I'm more worried about
discoverability of problems with this approach and with interactions
with dependencies on other subsystems (mainly GPIOs).  Thinking about it
some more the other subsystems will probably sort themselves out but the
diagnosics are an issue.

I do like the idea of a general mechanism for registering dependency
resources and deferring completion until they're ready more - I'm not
sure it's even that much more work, especially if the first cut only
handles regulators as a dependency...  that feels like attacking the
right problem, there's other things people are raising with deferred
probe like your complaint about logging.

--DEyyzOu/laT6xolt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU96mtAAoJECTWi3JdVIfQwsIIAIboJ7G/1gX+xd/Bf9e0ufaw
5xzMIFDTN52UATPye4HrnNIi55e89DTK/6SLlt2+bvh+yICh8d+ra5awdFT0t7jy
/JByNUvqxmiHkyNBr3A0tYCsiCQhRn+2lV0hC7aJtgT+LawA/Iip5LhtdKZgul2B
5NRsiPygklm5Cng1l7ThC7hGgMJzDsMNCqte/90hvkHQNHwwciZW67eo0oT/dXOX
DdiCet5vgSWKyAWAg0fn94GbMGLrh3QVH1GKiCykMmt+/1XAqsH/p29wsxBv5I98
E1RlnvHAvu8zjVMB2w2rq6UnNph03EFrTY0696XAujEOjFKMklQj5I915HDZIz8=
=Piw/
-----END PGP SIGNATURE-----

--DEyyzOu/laT6xolt--
