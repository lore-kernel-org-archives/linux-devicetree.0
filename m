Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F329C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 08:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0068C20716
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 08:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="UYTlmZGE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YS6eykLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfLTIDO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 03:03:14 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42891 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725941AbfLTIDO (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 03:03:14 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E81B522452;
        Fri, 20 Dec 2019 03:03:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 20 Dec 2019 03:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=P05QFYyJXu05BQJPt60bECzjIiL
        xz5zzubxatFHTuWo=; b=UYTlmZGE5QB93pvPV/g36IgVw2sca7YYx0Ug7dVOWBW
        l7cBrNZ/IuMcvJgHv6uPwcbpShsEJ+zgea2BjZG0HdPrbbIvP7vcX9m6HgRPCmP2
        XtXKdjg9rrXOOkJKY0t29pQlos2Cb27jr9XqBXyBu8YRkh5NPm7Z/ty03ww4FNEv
        RH58e8ubEbS6Ktn8n6Fs+EUxJ4bDzl3TdNieFG6JylOJbb8m4vrUAUb2RYJtXlSa
        sOZCWK3D1qbw2Ilid9bPIKsA153ZrTariFQhZ3pylnFQBumDkglzxP8adSjQnXYw
        1vpD73RiMGVPMmIHjoS2HKb/jIomMqtgyGU/Kmh44KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=P05QFY
        yJXu05BQJPt60bECzjIiLxz5zzubxatFHTuWo=; b=YS6eykLtDsAWM9Ji7ig6+f
        8jb7H1usN586n5TnCnLEJZKn1i6wYvvvbgFCt8O8QVDux+mELZ/j84nxo8eIOQLn
        ZzXu6IQAOtKB6b0xnXhj7OSTqxYaBNj/d/Ud+jSOHt53Ajn8IpFvQKzoV8QvmgpD
        5tpoEZlmWajCFuZEhFC7ymghBaNjFWv3PQElivnbw/b3wkvaYBg7JHb8kWknaKLp
        XoMxHZs1VOhQoG2ji5bzcXsjDJmKLqaxpWYL948AGOl0Of+g1S3PdzK02+kC6OTk
        LG5qnDDq2Mg1uTDYEIrL5cTg6iN1lvUTYX+0Wg/GP6tJ2JaZHv9eUXtLED8a63Xw
        ==
X-ME-Sender: <xms:QID8XW2gMYpxo0mVouQRpk2WRR7RPrSvfaq2zOD22ct_jfj89Gj1fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduvddgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
    hinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuve
    hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:QID8XV3mCXXRyoDdcPQVS2F6SwWuvreFo6vNYCKQvIWG7SYXSsWkoQ>
    <xmx:QID8XZcjfxh1XrvFFjJ3LRTik40YN7w_xvI6LavfZKwWxk4OzIX-yw>
    <xmx:QID8XbGLTXVTOl5zDL0B-JPHrg_XwEg3rJ15gnzKuhqBwmNHLs_7_A>
    <xmx:QID8XSOZyeas3Tn1n4rI40Rjm_R01uXiY4FyR28VCWmWj2UuYLMJDw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0192B306088B;
        Fri, 20 Dec 2019 03:03:11 -0500 (EST)
Date:   Fri, 20 Dec 2019 09:03:10 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
Message-ID: <20191220080310.w2xtgzxend5bmv2q@gilmour.lan>
References: <20191219084332.944123-1-maxime@cerno.tech>
 <CAGb2v643z-GwEgOV_OS96ESihDgGNOwp2s7eyJr68QFyPNqd_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w4wy6vydjn7c7a6g"
Content-Disposition: inline
In-Reply-To: <CAGb2v643z-GwEgOV_OS96ESihDgGNOwp2s7eyJr68QFyPNqd_Q@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--w4wy6vydjn7c7a6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 19, 2019 at 11:24:52PM +0800, Chen-Yu Tsai wrote:
> On Thu, Dec 19, 2019 at 4:43 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > with a matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
> >  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
> >  2 files changed, 135 insertions(+), 37 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
> >
> > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > new file mode 100644
> > index 000000000000..ded7d6f0a119
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > @@ -0,0 +1,135 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A80 USB PHY Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <mripard@kernel.org>
> > +
> > +properties:
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  compatible:
> > +    const: allwinner,sun9i-a80-usb-phy
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    anyOf:
> > +      - description: Main PHY Clock
> > +
> > +      - items:
> > +          - description: Main PHY clock
> > +          - description: HSIC 12MHz clock
> > +          - description: HSIC 480MHz clock
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - const: phy
> > +
> > +      - items:
> > +          - const: phy
> > +          - const: hsic_12M
> > +          - const: hsic_480M
> > +
> > +  resets:
> > +    anyOf:
> > +      - description: Normal USB PHY reset
> > +
> > +      - items:
> > +          - description: Normal USB PHY reset
> > +          - description: HSIC Reset
> > +
> > +  reset-names:
> > +    oneOf:
> > +      - const: phy
> > +
> > +      - items:
> > +          - const: phy
> > +          - const: hsic
> > +
> > +  phy_type:
> > +    const: hsic
> > +    description:
> > +      When absent, the PHY type will be assumed to be normal USB.
> > +
> > +  phy-supply:
> > +    description:
> > +      Regulator that powers VBUS
> > +
> > +required:
> > +  - "#phy-cells"
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +
> > +additionalProperties: false
> > +
> > +if:
> > +  properties:
> > +    phy_type:
> > +      const: hsic
> > +
> > +  required:
> > +    - phy_type
> > +
> > +then:
> > +  properties:
> > +    clocks:
> > +      maxItems: 3
> > +
> > +    clock-names:
> > +      maxItems: 3
> > +
> > +    resets:
> > +      maxItems: 2
> > +
> > +    reset-names:
> > +      maxItems: 2
>
> So this is slightly incorrect. If phy_type == "hsic", then the
> "phy" clock and reset should not be needed. I say should because
> no boards actually came with HSIC implemented. The A80 Optimus
> board had the HSIC lines on one of the GPIO headers, but I never
> had any HSIC chips lol.

This isn't what the previous binding was saying though :/

> > -- phy_type : "hsic" for HSIC usage;
> > -            other values or absence of this property indicates normal USB
> > -- clocks : phandle + clock specifier for the phy clocks
> > -- clock-names : depending on the "phy_type" property,
> > -  * "phy" for normal USB
> > -  * "hsic_480M", "hsic_12M" for HSIC
> > -- resets : a list of phandle + reset specifier pairs
> > -- reset-names : depending on the "phy_type" property,
> > -  * "phy" for normal USB
> > -  * "hsic" for HSIC

It's speficied that the reset and clock is needed. If we want to
revise that, we can do it, but I guess it should be in a separate
patch than the one doing the conversion. Here we just want to express
the exact same thing.

Maxime

--w4wy6vydjn7c7a6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfyAPQAKCRDj7w1vZxhR
xW5+AP9OQT0iG1KACB7+fyhb1ftgTYAtbu5A3+Qdmq1mZkzQTQEA+VI4epD3poDc
WIyy6GR5gCIfVqFBIX8TjubkJWEq0w4=
=z95X
-----END PGP SIGNATURE-----

--w4wy6vydjn7c7a6g--
