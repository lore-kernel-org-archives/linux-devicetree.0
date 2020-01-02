Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CFAC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED4D620848
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 15:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="T9StJhSk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w5yDnx3d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbgABP0p (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 10:26:45 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54343 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728561AbgABP0p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 10:26:45 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id C956522008;
        Thu,  2 Jan 2020 10:26:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jan 2020 10:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=t3ubyuab2VlswOR9/ymEdLAoVp9
        ly3n1q2XwluYw9jc=; b=T9StJhSkG0u+LtZXX0qZIGwMh4bMpTVZVssW7rCFJ8I
        sz9caqTAqae3XB60lCrIMpUpSX8iYrTkOxqkN8ysTXu2GXBGqhmhdFwfC5IV+m3W
        oli7Ibp+wNlqleJI2CAhGzh03emecRMfUXB2aJfAExYKJ0PjD4xvSQThF1UbuDbT
        M3y/e3SDD5NpgIXv5dkry5HD090OGsrd1yacITbEb6xLELOt66ZOOqQLB3nX6Pxj
        N2uxKsJGAypMlFgOY8JXqecOIMkuQg9R19VFsxcLVztMUC3J6IaAI3i0oJ1ySuaZ
        LVGu0DuB8kk5pU/RV0UOf65+kDYmoyJoaxjIWeFX5GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t3ubyu
        ab2VlswOR9/ymEdLAoVp9ly3n1q2XwluYw9jc=; b=w5yDnx3dZCi5yiKUmkwE4B
        DSLQxUSPxGQw/Z4WFS9/tmUtODpBrTOxq4KT+yTZc/zixI2MH2SPlt8YzEJURGn8
        97cP36AAo3M5Hm5+lOqbvg77cIxmDxqrMfSprhHSvV/8J5zOD4tDmDmNCUEXdgI2
        XudcGRQLn1OCmue2bjyPekUq0dZeWdefZsG6IO5vKB5FPAxMe6KvIP4kyJ9I/1fq
        a6L2AB41KpbH6hwpbT/gMKCGbfTbSQgBUwoTdHSddV6FAj/nthCiJH/q+6+k9b7M
        Jin+QCdIuOeTolqzgtspI8Eac0FVIfXwmmSJxoNnl1BmXhUJbHOG1axHD0EzSqmQ
        ==
X-ME-Sender: <xms:swsOXrwTDgylDG_GwbNh9PYU0c0YxSKdZc9NFgLpRutgRlfwgvujqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeguddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
    hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
    hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:swsOXptw0wrxT0i1PrFHbR8AzuqWHYbJflHkvY0h0CfENhi1JaUX9g>
    <xmx:swsOXi3oJJb1JwTP39vHxuL7Hm30LFELB9ZsF0E2nPhpvjFTHWHh1Q>
    <xmx:swsOXt5WhaS8ljqtmJj2ARrrRYJNlokFMhEG-kzdrVyYc21gncmmsg>
    <xmx:swsOXmxoj6zrfsjg31x45I_qk9qUJkEUxtvnfA2juQcFUENjv6nGGA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5E99B3060741;
        Thu,  2 Jan 2020 10:26:43 -0500 (EST)
Date:   Thu, 2 Jan 2020 16:26:41 +0100
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
Message-ID: <20200102152641.kgckxlcq7u7xjjrl@gilmour.lan>
References: <20191219084332.944123-1-maxime@cerno.tech>
 <CAGb2v643z-GwEgOV_OS96ESihDgGNOwp2s7eyJr68QFyPNqd_Q@mail.gmail.com>
 <20191220080310.w2xtgzxend5bmv2q@gilmour.lan>
 <CAGb2v65+zpc1_0K2Co4uOUrfshzmVCf1Rc6Ob2YtmdmdsNTAvQ@mail.gmail.com>
 <20200102120222.yl7vlposk4b7hbu7@gilmour.lan>
 <CAGb2v66pixivryxffXWceLknFLErRJH3BQgtQUQSeyQq-FO=ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vnza7bcg3bx47puo"
Content-Disposition: inline
In-Reply-To: <CAGb2v66pixivryxffXWceLknFLErRJH3BQgtQUQSeyQq-FO=ng@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--vnza7bcg3bx47puo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 02, 2020 at 08:31:40PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jan 2, 2020 at 8:02 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Fri, Dec 20, 2019 at 04:10:03PM +0800, Chen-Yu Tsai wrote:
> > > On Fri, Dec 20, 2019 at 4:03 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Thu, Dec 19, 2019 at 11:24:52PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, Dec 19, 2019 at 4:43 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > >
> > > > > > The Allwinner A80 SoCs have a USB PHY controller that is used by Linux,
> > > > > > with a matching Device Tree binding.
> > > > > >
> > > > > > Now that we have the DT validation in place, let's convert the device tree
> > > > > > bindings for that controller over to a YAML schemas.
> > > > > >
> > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > ---
> > > > > >  .../phy/allwinner,sun9i-a80-usb-phy.yaml      | 135 ++++++++++++++++++
> > > > > >  .../devicetree/bindings/phy/sun9i-usb-phy.txt |  37 -----
> > > > > >  2 files changed, 135 insertions(+), 37 deletions(-)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > >  delete mode 100644 Documentation/devicetree/bindings/phy/sun9i-usb-phy.txt
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000000..ded7d6f0a119
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/phy/allwinner,sun9i-a80-usb-phy.yaml
> > > > > > @@ -0,0 +1,135 @@
> > > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/phy/allwinner,sun9i-a80-usb-phy.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: Allwinner A80 USB PHY Device Tree Bindings
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Chen-Yu Tsai <wens@csie.org>
> > > > > > +  - Maxime Ripard <mripard@kernel.org>
> > > > > > +
> > > > > > +properties:
> > > > > > +  "#phy-cells":
> > > > > > +    const: 0
> > > > > > +
> > > > > > +  compatible:
> > > > > > +    const: allwinner,sun9i-a80-usb-phy
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  clocks:
> > > > > > +    anyOf:
> > > > > > +      - description: Main PHY Clock
> > > > > > +
> > > > > > +      - items:
> > > > > > +          - description: Main PHY clock
> > > > > > +          - description: HSIC 12MHz clock
> > > > > > +          - description: HSIC 480MHz clock
> > > > > > +
> > > > > > +  clock-names:
> > > > > > +    oneOf:
> > > > > > +      - const: phy
> > > > > > +
> > > > > > +      - items:
> > > > > > +          - const: phy
> > > > > > +          - const: hsic_12M
> > > > > > +          - const: hsic_480M
> > > > > > +
> > > > > > +  resets:
> > > > > > +    anyOf:
> > > > > > +      - description: Normal USB PHY reset
> > > > > > +
> > > > > > +      - items:
> > > > > > +          - description: Normal USB PHY reset
> > > > > > +          - description: HSIC Reset
> > > > > > +
> > > > > > +  reset-names:
> > > > > > +    oneOf:
> > > > > > +      - const: phy
> > > > > > +
> > > > > > +      - items:
> > > > > > +          - const: phy
> > > > > > +          - const: hsic
> > > > > > +
> > > > > > +  phy_type:
> > > > > > +    const: hsic
> > > > > > +    description:
> > > > > > +      When absent, the PHY type will be assumed to be normal USB.
> > > > > > +
> > > > > > +  phy-supply:
> > > > > > +    description:
> > > > > > +      Regulator that powers VBUS
> > > > > > +
> > > > > > +required:
> > > > > > +  - "#phy-cells"
> > > > > > +  - compatible
> > > > > > +  - reg
> > > > > > +  - clocks
> > > > > > +  - clock-names
> > > > > > +  - resets
> > > > > > +  - reset-names
> > > > > > +
> > > > > > +additionalProperties: false
> > > > > > +
> > > > > > +if:
> > > > > > +  properties:
> > > > > > +    phy_type:
> > > > > > +      const: hsic
> > > > > > +
> > > > > > +  required:
> > > > > > +    - phy_type
> > > > > > +
> > > > > > +then:
> > > > > > +  properties:
> > > > > > +    clocks:
> > > > > > +      maxItems: 3
> > > > > > +
> > > > > > +    clock-names:
> > > > > > +      maxItems: 3
> > > > > > +
> > > > > > +    resets:
> > > > > > +      maxItems: 2
> > > > > > +
> > > > > > +    reset-names:
> > > > > > +      maxItems: 2
> > > > >
> > > > > So this is slightly incorrect. If phy_type == "hsic", then the
> > > > > "phy" clock and reset should not be needed. I say should because
> > > > > no boards actually came with HSIC implemented. The A80 Optimus
> > > > > board had the HSIC lines on one of the GPIO headers, but I never
> > > > > had any HSIC chips lol.
> > > >
> > > > This isn't what the previous binding was saying though :/
> > >
> > > From the original binding:
> > >
> > > - clock-names : depending on the "phy_type" property,
> > >   * "phy" for normal USB
> > >   * "hsic_480M", "hsic_12M" for HSIC
> > > - resets : a list of phandle + reset specifier pairs
> > > - reset-names : depending on the "phy_type" property,
> > >   * "phy" for normal USB
> > >   * "hsic" for HSIC
> > >
> > > It is recommended to list all clocks and resets available.
> > > The driver will only use those matching the phy_type.
> >
> > I'm not quite sure how we want to fix this then, or even what there's
> > to fix.
> >
> > The previous binding is saying that we need either phy or hsic, and
> > that we should ideally set both. The DT are following that
> > recommendation, and we have either one item for the clocks (phy), or
> > three (phy + 2 HSIC clocks). resets is in a similar situation.
> >
> > The binding allows to have either one or three, and enforce that in
> > HSIC we have three (but leaves the option open to have either 1 or 3
> > in the normal phy type).
> >
> > As far as I can see, we cover what the binding was saying. Am I
> > missing something?
>
> I guess you're right. Lets just keep why you've done already.
> Sorry for the noise.

Is that a Reviewed-by ? :)

Maxime

--vnza7bcg3bx47puo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg4LsQAKCRDj7w1vZxhR
xR6SAQDvqLC0h+09wIbderWyKg+USHYEopIVTFTMBgcuOvhXVgEAua5wcziPRm30
+Ws7KYnlYb9VRZusKakxeTqUbHw2qQM=
=wtW2
-----END PGP SIGNATURE-----

--vnza7bcg3bx47puo--
