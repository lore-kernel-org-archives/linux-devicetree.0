From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/5] Refactor Qualcomm RPM regulator to single
 platform_device
Date: Thu, 2 Apr 2015 23:26:30 +0100
Message-ID: <20150402222630.GV6023@sirena.org.uk>
References: <1427928946-31291-1-git-send-email-bjorn.andersson@sonymobile.com>
 <551DBC05.2090301@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7CWsE/Dy737oYst"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <551DBC05.2090301@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Andy Gross <agross@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--v7CWsE/Dy737oYst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 02, 2015 at 03:00:37PM -0700, Stephen Boyd wrote:

> What happens with debugfs when you have multiple pmics with the same
> named regulator? I thought that in this case we needed to make the names
> unique somehow or we would end up with the same directory for two
> different regulators.

Guenther sent a patch fixing that a while back.

--v7CWsE/Dy737oYst
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVHcIVAAoJECTWi3JdVIfQ0qwH/39a41ToIEYtdmHO4V/XjkxW
vnesFltGz9fabH9Ii9UteRnaYIseDM4XfPaEhGuENZC1Hc+9zEyACD4cm2BD99Yw
Iq+rGWWr+sHGF2PaeXpnEd9wu+a27PpOXVLvEWRNL1TtHeVldQyOrn9auE+OBio4
B2i4PSQZaiZpKS6m2kvq0yFcN9RqX+srphmwpttr1eP+xZTuTCTr79xZLQfxO3sw
vUu31Kxhi/6w1O7ZZt1lZGIuygaJz5mYH2E+X1Ld5Qryerfrbco1rhswXF6trpn3
PpRUWBUqxu/w6+17istzmrSGDubeFkanNt7K5AykvRBA8QIIQG11xVyWA/Rh4/k=
=Zv4w
-----END PGP SIGNATURE-----

--v7CWsE/Dy737oYst--
