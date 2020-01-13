Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F58C33CA8
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 09:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B1302080D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578908641;
	bh=UtHfmZbsNcplNP3k+bEt4c2k9o181tnaCpLdxVZFFQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GC8d7lwdircCBYCsGzmfKgZwdUQmNMtI5nxgFgt5PPC8Gof+Ihd3SsUSOd8ab7CJ4
	 QMdai+4YWp24nMZm9ZYBN2utW40MRU9bQxSDxeT6AvM/FU0/KEOrv7Q6cU5G0GgO5n
	 E2eSH5htU65wKcg3eSJG0yHgDJGb/Ij4KVCHgetQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgAMJoB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 04:44:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:59158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgAMJoB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jan 2020 04:44:01 -0500
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10BF82075B;
        Mon, 13 Jan 2020 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578908640;
        bh=UtHfmZbsNcplNP3k+bEt4c2k9o181tnaCpLdxVZFFQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Chqov/hf8tR7oy+LK2yRjMCtLFz+wPmkrkH0qv6ptZ93DU/La0cx0HYm1cohXJsSc
         kgcX/e9UlSQAUk6fWS5TSErd/fDzcDnG+oT58Jx636C92DgH56LFKSjJWk5s7Djmkd
         hSW/oqvXZ/oAFkr6VUIml5NMHscjdN8PYHy7QV1U=
Date:   Mon, 13 Jan 2020 10:43:58 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/9] dt-bindings: irq: Add a compatible for the H3 R_INTC
Message-ID: <20200113094358.7jefihp4i4rt4orm@gilmour.lan>
References: <20200113044936.26038-1-samuel@sholland.org>
 <20200113044936.26038-4-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="smzsasjwaytwgncj"
Content-Disposition: inline
In-Reply-To: <20200113044936.26038-4-samuel@sholland.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--smzsasjwaytwgncj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 12, 2020 at 10:49:30PM -0600, Samuel Holland wrote:
> The Allwinner H3 SoC contains an R_INTC that is, as far as we know,
> compatible with the R_INTC present in other sun8i/sun50i SoCs starting
> with the A31. Since the R_INTC hardware is undocumented, introduce a new
> compatible for the R_INTC variant in this SoC, in case there turns out
> to be some difference.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> index 0eccf5551786..fffffcd0eea3 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> @@ -29,6 +29,9 @@ properties:
>        - items:
>          - const: allwinner,sun8i-a83t-r-intc
>          - const: allwinner,sun6i-a31-r-intc
> +      - items:
> +        - const: allwinner,sun8i-h3-r-intc
> +        - const: allwinner,sun6i-a31-r-intc

If we are to add more compatibles, I guess we could switch to
something like:

items:
  - enum:
    - allwinner,sun8i-a83t-r-intc
    - allwinner,sun8i-h3-r-intc
  - const: allwinner,sun6i-a31-r-intc

It's going to be easier to maintain in the long run.

Thanks!
Maxime

--smzsasjwaytwgncj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhw73gAKCRDj7w1vZxhR
xfhpAQDaJubC92ncM6GPUUqzW3nc++GjfRAhdInV8usAwqdmxwD+P5/2e/W5eeaW
kJxLxEHrY7QaX68C60fWL9XuCd6QbAc=
=lixO
-----END PGP SIGNATURE-----

--smzsasjwaytwgncj--
