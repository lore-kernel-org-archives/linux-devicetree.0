Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DFCC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 07:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6948F208A3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 07:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="nTPUFYDt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qfbmpe6R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKUHWf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 02:22:35 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37947 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725842AbfKUHWf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Nov 2019 02:22:35 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 1D5A022162;
        Thu, 21 Nov 2019 02:22:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 21 Nov 2019 02:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=MwfkCwkdcRiv+8/3qpqEvwuZ4rX
        zWItWd1EmUBW3PsQ=; b=nTPUFYDtRJCL69rq7UGBDxTE4CFo6gjISw0QPf7Jlii
        AwlcXKYbt1aFR97qKYf9xOUiWkE0Hu+nK2uHq/oN81kSd0Ny4uZ5oO1Iz6y0HDb4
        aRGwYm7gH0NlIcN9h5cJ7CR1eQUm0DsC8FeMNYkIw38FlYnqfJCkdu3TzVxkGCpw
        bikCvEANpO6NnwID5QO5R5p+NKYzAOpg3D9CfJfpeRQnwGKoEN3epnGedaW9HFgT
        4PozloX8drniV01oTHX+TqHyeOMECYD2ge9N0qlw5qk+jnMuqLbO/WTqP4UUbUc8
        TP+Lt6ByICVsgza+JkHjoIcUSz3IbLYv11SKGOpTe8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MwfkCw
        kdcRiv+8/3qpqEvwuZ4rXzWItWd1EmUBW3PsQ=; b=qfbmpe6R3TX5JHuGrF7eHt
        oRmjVwk+nis+IN3Azq6BzsEqG64iO2aoUWWcLXZ36gGMMmFJWpJ9CLCzllz0Ute1
        dLjxXfmDG3V6Nbq4l2dZx0dVEv8g2AutYWYvy6z5Y1Hi/CEcDk0MjE6e5D2LfKdw
        9Hy0p/xKik3homV0Gg3RwpCV1cxvBDOWOGQ5B9lLFuC1R1t+n/0pxwsbXYqxixEY
        R5W94+86Bl7zDr4uu6GBzx7p0ESQbjFuJPbo+F7RQCb95ViTLCeQT76YwXeq11lI
        dw/AdMCy4W69ipx5XZn3Nmre6CXR3BK0r5MjWDvrc25oKV3sNJTDD+DLM044Mmaw
        ==
X-ME-Sender: <xms:OTvWXUBlmG9hkuO4_VN79i0gzZ7hr1svhM66wWdTQ2ouZzs6z8_1aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehuddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehgtderredtredvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppe
    eltddrkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvges
    tggvrhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OTvWXbqQOWB03V7hpeECWTCtOXKgMKs5xkITPx7T2tXrQJD7cA5d9A>
    <xmx:OTvWXaiS0-QdbRvkUBJShPuAchWoR04sKbX5Z6K-41L2ljGYB5kR9w>
    <xmx:OTvWXQyqBJr9aSoNFkGyx65z6IXFzHny7k9GwR2_jVYO927Wh4kGzQ>
    <xmx:OjvWXZgkZWSNyAp8HMbC4BttzCu6ratVtm1mi80D-hv-XopAyWzkLw>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 04E0180061;
        Thu, 21 Nov 2019 02:22:32 -0500 (EST)
Date:   Thu, 21 Nov 2019 08:22:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/3] arm64: dts: allwinner: H6: Add PMU mode
Message-ID: <20191121072230.GD4345@gilmour.lan>
References: <20191121011835.8467-1-andre.przywara@arm.com>
 <20191121011835.8467-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="u19xsR7broAOK+6q"
Content-Disposition: inline
In-Reply-To: <20191121011835.8467-2-andre.przywara@arm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--u19xsR7broAOK+6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 21, 2019 at 01:18:33AM +0000, Andre Przywara wrote:
> Add the Performance Monitoring Unit (PMU) device tree node to the H6
> .dtsi, which tells DT users which interrupts are triggered by PMU
> overflow events on each core. The numbers come from the manual and have
> been checked in U-Boot and with perf in Linux.
>
> Tested with perf record and taskset on a Pine H64.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Queued all three patches for 5.6, thanks for taking the time to do
this.

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> index 29824081b43b..86a77b1734e0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -70,6 +70,16 @@
>  		clock-output-names = "ext_osc32k";
>  	};
>
> +        pmu {

This was indented with spaces however, unlike the rest of the DT. I've
fixed it while applying.

Maxime

--u19xsR7broAOK+6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdY7NgAKCRDj7w1vZxhR
xYXuAQDv9VC09OZ7z6KgiULlHRC5xWKX7VRmpxFLQMtSRcAaQQD9G6OgTaAepAWN
Wn+sewnoGCWbGGCUlkIDV6UjLVOaYQQ=
=tclI
-----END PGP SIGNATURE-----

--u19xsR7broAOK+6q--
