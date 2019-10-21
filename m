Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFB0CA9EB7
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 12:21:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C363A20882
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 12:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbfJUMVR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 08:21:17 -0400
Received: from sauhun.de ([88.99.104.3]:46636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728017AbfJUMVR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 08:21:17 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id 1427E2C040F;
        Mon, 21 Oct 2019 14:21:15 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:21:14 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: sh_mobile: Add r8a774b1 support
Message-ID: <20191021122114.GG1145@ninjato>
References: <1570176446-59266-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="KIzF6Cje4W/osXrF"
Content-Disposition: inline
In-Reply-To: <1570176446-59266-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--KIzF6Cje4W/osXrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2019 at 09:07:26AM +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--KIzF6Cje4W/osXrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2toroACgkQFA3kzBSg
KbZQCQ//eB4Aog0xF10tAIrkTHdfmBl7sIOOD0qPUU+LIbbILjG3hdcuIwYivhRg
HuFP0JKJyLPYgZeYKjsrK/9rvo1PnDney42qmlmxlzJOZjIDBf03khdmVRTrZxvV
0tsTCzdVV8s2ZZqyiVZeFqZIg5GINgGiQ0eJzCSq7MeVMlIRO+FiY3ByZQ/XpAa0
nPw/U0cw5O65fCVh6HTsUE5jfz5Y/4BFeQLz4hMkeyP+RiNicIPwNXbvQpQBgZZw
1N0jDUuulJYDz5O9MRNYOW7K5AyAjaWU2NElwJoWukqKVR1JcKS776ycVKRKI6cd
PRb7GDYNpzNVWauBMRIPsO+nnKwFW9MOeBgFrxzA89f/fIfBTLMF8Maz2QjzIXQS
SC0+o/WOHkssqHt2dTaz166kDD3nzMJ1p8VO1C2FondSgU+KN/c3ifQ+okTPjXfj
VeH/rkaO9XSGnXvl7OKPfepG2IlxXlIDKyfnn+oBuVtmy+JrL7BTZtwaZJCXiqH2
T4D0nTVH4x1eMDCfPRU4vonMrq9lGKiIL3amTlhuj6A2QBV1+x8l1MKzIlik4wB9
5rAJG90nygqPS1Jk3NHVNd7GZuhDj2KRG9E8t197sv2qoQTWrDp0PC+j6mqlw+k/
g9zpwHWxiMSe689ka0qQS0jFcUoVWMo5l8n+Nl/Zjmy4LF1MlQQ=
=7zJu
-----END PGP SIGNATURE-----

--KIzF6Cje4W/osXrF--
