Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523E8C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 09:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 197B62072C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 09:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="cLag7isj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rVKZ7Ilw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAFJ12 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 04:27:28 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52137 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725446AbgAFJ12 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 04:27:28 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 004E321F83;
        Mon,  6 Jan 2020 04:27:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 06 Jan 2020 04:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=AD0WwGxa4vEtYVpmX4Bn98NZdb8
        UG8gq8ruZldWqfFQ=; b=cLag7isjvYNFz1/HpV5BQv84cdbSzYJfvKPOR+++0pS
        yoiR853GzL2i75zg6w49qoySqj097YsBnP/pn67nzwKxE+Zob6sd8OTrDOkL7KHD
        wV7/HpVlWvK/KhQBij+1u4nT1p4RCRzbWJcOZ9NV3Tfcu6wjkYoJePbiEIctLdYo
        vA22lZn23R5J4MOQY3M/ZtahHZ9RpchmZ0Oodr/MHGmYH59ME7PPCyWs9adhbVT2
        +joNE99ehfDY8K57qbY31xbpnAbD6Dj6BGJokUMO9M83DMtlYXPHpyLRXrszWw1k
        Qq01SvhWaA546tClqSNwmGgWhTq+1bU30RAOvBIhPvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AD0WwG
        xa4vEtYVpmX4Bn98NZdb8UG8gq8ruZldWqfFQ=; b=rVKZ7IlwMl9UIsTeJUU2mA
        eGzw997p780+sa50JCs9n11byVdRh3ewZq0B2IfbUxYoSLwmxmmtx1pj2Q9H8+Jm
        VLyNoTgwcHmjVwordd9iC5jcpBor5NA3AwiZ6cgcH8NwR66GdU5ghedmVPAItfnc
        0tBZBpeQc+CY1o2EsTEcJUDDf61lAdqGcXHOHBgvoUKZVJT/Ne/7WptJVldTAK/U
        5ycrIw0UrTJ7OEL2CHUGCWic3mvc1N2wH0AyLhIAUeOleXE9B5sbYvjnLmA8h7bV
        gcuI9tRkAwRkzOsm36wMNrbH56ZOasypSL/lWxRasdo3hK1/wbzxaBWBoGR1FI3g
        ==
X-ME-Sender: <xms:fv0SXgLwl2zHlgDrdGLWXp2abLkUMRWovMDghaBocRhNerV7nHDvRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
    hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
    hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:fv0SXr0PxaZyA38ebNMaaNdSWPpxnjZ_EKoxCPBwdm4c2DO2782rbg>
    <xmx:fv0SXsVms3qbFoRnJo4yaPIcmQGrYchGM7TTgwU2m278g2_kZncyag>
    <xmx:fv0SXpgeuO96xSWmPnJPo0mt69vpTmfduxPcmPjmrZX1yJ3W3qd-ig>
    <xmx:fv0SXrxqlbBkNYd8H_bKzhEYY9MH5k2v6I3SqCU2V28YyYo5R1TXnA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 21ECC80060;
        Mon,  6 Jan 2020 04:27:26 -0500 (EST)
Date:   Mon, 6 Jan 2020 10:27:24 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     kishon@ti.com, Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: usb: Convert Allwinner A80 USB PHY
 controller to a schema
Message-ID: <20200106092724.pi2kbui7zayrhhzi@gilmour.lan>
References: <20200103152824.47383-1-maxime@cerno.tech>
 <20200104221321.GA11672@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jfhnjtzfmxu4jsz2"
Content-Disposition: inline
In-Reply-To: <20200104221321.GA11672@bogus>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--jfhnjtzfmxu4jsz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

On Sat, Jan 04, 2020 at 03:13:21PM -0700, Rob Herring wrote:
> On Fri, Jan 03, 2020 at 04:28:24PM +0100, Maxime Ripard wrote:
> > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > with a matching Device Tree binding.
> >
> > Now that we have the DT validation in place, let's convert the device tree
> > bindings for that controller over to a YAML schemas.
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > Changes from v1:
> >   - Added r-b tag from chen-yu
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
>
> Rather than anyOf, just 'minItems: 1' would work here. Though I guess
> this disallows 2 items.

Yeah, 2 items is not allowed so I wanted to prevent that.

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
> Do you intend that only a single item is allowed when not HSIC? If so,
> that's not what is happening.

That's intentional indeed, the former binding was making the hsic
clocks and resets mandatory when the phy was in HSIC mode, but only
recommending listing them otherwise. Maybe we can change that in the
future, but that seems out of scope for a conversion.

Maxime

--jfhnjtzfmxu4jsz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhL9fAAKCRDj7w1vZxhR
xYcDAQCNoZxKDfvA/zKYWnLh123pQrSfnCIT3udI4N3sqlNiBQEA3LOztTGe4r9g
jqPT0pzltu4HVmYLfflM/aNrJBQsgQQ=
=9byl
-----END PGP SIGNATURE-----

--jfhnjtzfmxu4jsz2--
