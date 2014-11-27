From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v8 3/3] regulator: qcom-rpm: Add missing state flag in
 call to RPM
Date: Thu, 27 Nov 2014 11:07:24 +0000
Message-ID: <20141127110724.GJ7712@sirena.org.uk>
References: <1417038661-30209-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1417038661-30209-4-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LoHPRo26ImLi3L9g"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417038661-30209-4-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--LoHPRo26ImLi3L9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2014 at 01:51:01PM -0800, Bjorn Andersson wrote:
> This adds the missing state parameter to the call down to the RPM. This
> is currently hard coded to the active state, as that's all we're
> supporting at this moment.

Acked-by: Mark Brown <broonie@kernel.org>

--LoHPRo26ImLi3L9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdwXrAAoJECTWi3JdVIfQkwgH/3T57+ciAjmFypgtdnUaQ1v+
bIldq9D6ByW60O1cVuxfHcNR1wIr5GDMby809lTxR12hGdgtpqCaqFVLRZPBF0Md
GtD4iz7ZpLNtX+aYj+TFl/vN1c97XnRwGv6PctUcGli1LPEjuPYXAeQKx0uzPjI0
jqK4jlmipkVWlLMgPqtvdZh0ABHHfBCiltp03xuiVh591jJqL7x3b+digLOQh2Ow
To60Yl8NZlq2HvHNDy7BigQt5g5sMMqngWwYsPo+PsMOGknHVV8r077q0n5qturT
QKllhjmgVYIvUuk9jQNJTSvJ4mHzRTiq8MzKM8BiItroejqvppvrrhaiGuXEHpc=
=DAa/
-----END PGP SIGNATURE-----

--LoHPRo26ImLi3L9g--
