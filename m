From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single
 platform_device
Date: Mon, 6 Apr 2015 18:46:43 +0100
Message-ID: <20150406174643.GZ6023@sirena.org.uk>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
 <551DBC05.2090301@codeaurora.org>
 <20150402222630.GV6023@sirena.org.uk>
 <551DC94C.3060001@codeaurora.org>
 <20150406165154.GP6023@sirena.org.uk>
 <CAJAp7Oi5NE2H67dUA1jK6U4itZxcMLojpK3qO-6Q8kDv3Vbbfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rbDVY1A5evmOIoPD"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAJAp7Oi5NE2H67dUA1jK6U4itZxcMLojpK3qO-6Q8kDv3Vbbfg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--rbDVY1A5evmOIoPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2015 at 10:11:02AM -0700, Bjorn Andersson wrote:

> The RPM will instantiate one regulator device per pmic and parent will
> hence differ between the various regulator instances.
> So with Guenter's patch this does indeed work.

Ah, excellent!  That's easy then...

--rbDVY1A5evmOIoPD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVIsaCAAoJECTWi3JdVIfQzKwH/jcsSl4yg3HhUgAzZEV5avs7
dOrAzpgjkrTJM/fHMDUn+IITBeTqvrv1OKjNjc8cRoOwcAiVn7HwieNXS8v7j5/T
8fVq0XyKX0INS3EXUUbZ00g42waSQ7fIQi6SEZh1MQw8LBJc8teIatYjsQaFH6eI
58GVZHKq+4igFPHNBP1wsJNh5ww6ZmvbA7IGwkDbO1L2NSi594eCZUsgb507vdpO
hcrRCDtBJTkAgayyiKMfp/VneGblEYTMi11HeYpoLww4KmKMyf5UN9OscK4fvmne
KXSQyLctMPPyn553cn7Z6EOdOPwX8+ncjsu4lmL/IgU5/MsU9BubJXpNPzf7yxY=
=fbg1
-----END PGP SIGNATURE-----

--rbDVY1A5evmOIoPD--
