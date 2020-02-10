Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E09C352A4
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35E3C20733
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 07:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="bewS1Ozc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eoh2cSYY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgBJHnQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 02:43:16 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:41339 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726118AbgBJHnQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 02:43:16 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id A61D821BBF;
        Mon, 10 Feb 2020 02:43:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 02:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=hEDAyHlfzXmwMrjRLdmlDd0a1B4
        Gs1pPP10DZSZOkrE=; b=bewS1Ozc5TOyAYZ+XoRvqbfGh2EYgQqnPxhCZTHDNDQ
        4oBHs6XDiE3YujUtkladImnnU+5znWTJv1fXmCj3sCMIi0WrhnoCw8syvyOcjNGj
        FSZQZoBQLeeXbJdOvSIN7RVWOy+6i+pcIHzZHKdWipN7TJkCMmILibULDz6vx55u
        S+dB/hMkuiAziU2RgBHrfZQnF6xiFtzsSGaDtgYbHZYyxK518DwV+V33iDh7bRyH
        fodr3WE6TUr2u/htgz9/2GyGPzXY8gIbnkldywm7MiTgBheXNKJ7nnolU/Jh6RuC
        3J63F0qSNaTlKmjZY6MaQ2Sn0CyUzBspBBRdCot0KEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hEDAyH
        lfzXmwMrjRLdmlDd0a1B4Gs1pPP10DZSZOkrE=; b=eoh2cSYYs5Pzz8eMGqF9C7
        xCREzsSSNyTZIsCWQObp9RPnqcp35FXEeZ1L+FmsRcN5KkTgSLeIs65PP9wtdbGP
        SFX4rqz0vWv0y5/0/YPRbkR5CpDvwi/TtYxP7gIkDMKu4zZwmAwwvpGYguahPSoq
        QGABMrKAiRD0Tv+KsdsnAJ11aX8Y4iK03KZsluWVXee9ubgIYaKwhc+xwPpgLMvB
        7uat5qOUutaV7nleKdj28QCGInFxF76LeARd/3cdMrPFW8/amhvuQWtE1duiq3xg
        UVC0+p0pUSwG5g7XbDFi3U/m+cKmsVA0aid6pneF6btFgMy8b5dH1wZg4CgYGzag
        ==
X-ME-Sender: <xms:kQlBXs-llx1BMUMiHU_mJqCopdRedII-pNqFIGxYz8WaUPKfMyvNug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedtgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
    eplhhinhhuthhrohhnihigrdguvgenucfkphepledtrdekledrieekrdejieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestg
    gvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kQlBXgLh84PtqnB_1vwhI_jNX9rloeMpkUKsmDx0YfGI12_3PHGZUw>
    <xmx:kQlBXlitwfy_Qmu22GD2wSBMHaKXJCk7nJueAAZrgwHMfo78BsNo0Q>
    <xmx:kQlBXg7FgNgdgQgF9ZPtvchGqa3mkTuXXIM7Cl5AL_b7baCmS1Ri9w>
    <xmx:kQlBXvUTFQL_M63BRn_jqG39Tv36qrFt_LkNo28ttKzARyEvlTYGUQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id EFDEC328005E;
        Mon, 10 Feb 2020 02:43:12 -0500 (EST)
Date:   Mon, 10 Feb 2020 08:43:10 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     bage@linutronix.de
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: Re: [PATCH 1/5] dt-bindings: Add vendor prefix lx for Linutronix
Message-ID: <20200210074310.c6adwjegqouzs6uc@gilmour.lan>
References: <20200206113328.7296-1-bage@linutronix.de>
 <20200206113328.7296-2-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="spuhl3n74u4tm56d"
Content-Disposition: inline
In-Reply-To: <20200206113328.7296-2-bage@linutronix.de>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--spuhl3n74u4tm56d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 06, 2020 at 12:33:23PM +0100, bage@linutronix.de wrote:
> From: Bastian Germann <bage@linutronix.de>
>
> Add a vendor prefix for lx, known as Linutronix GmbH.
> Website: https://linutronix.de/
>
> Co-developed-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 7fcd48adc276..f6fea38b0848 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -561,6 +561,8 @@ patternProperties:
>      description: LSI Corp. (LSI Logic)
>    "^lwn,.*":
>      description: Liebherr-Werk Nenzing GmbH
> +  "^lx,.*":
> +    description: Linutronix GmbH

Vendor names are usually either the vendor name itself or the stock
name, so you should really use linutronix here

Maxime

--spuhl3n74u4tm56d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkEJjgAKCRDj7w1vZxhR
xYQrAP9ZK0zJle03erz4iLgbuPga7ipZLga0ekqf6Lppbmc7FwEAskap54ceGTvR
YE2NE8Z4Pt5aH2D7OsdidRpaeXKwFwQ=
=Q8mq
-----END PGP SIGNATURE-----

--spuhl3n74u4tm56d--
