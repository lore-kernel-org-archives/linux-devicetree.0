Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE88C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7F4124650
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 08:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="PFjBmxKf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tkn7hI81"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfLSIqA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 03:46:00 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:33527 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726498AbfLSIqA (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Dec 2019 03:46:00 -0500
X-Greylist: delayed 435 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Dec 2019 03:45:59 EST
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 7DF5655A;
        Thu, 19 Dec 2019 03:38:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 19 Dec 2019 03:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=TOad0CQlAYdFxFSlhlqZROlIaJ/
        tfvAfV7J03rJuV3Q=; b=PFjBmxKfa17H2ZTT59/2v8Tuz0eCpa/CL4HIfHyZm/d
        6hrMALmE6EgzF3zpsE9a9J9RjecY3xLPQFGLYKQCf1FA0gdaOT/W1wJls76mRHAu
        2TYjSH4qDYLR5QZhAt9LZXoOeEDqcSswZ1ix5v2+xJaNNFA9p5TLEovThr8vN0Vu
        FLRnOkfQAsqTr9tSvi+ZycayfDEMzkRRijh54WkPYXnolnY36HSnTJURbWPFaFpL
        hrkHLFvlS6sQub+RA+tPy3/0BZE65hdJpK6v7SbRxs7uUb47xYiMA32MBpGjIoSk
        BqbmbQBdjqrtsVN/z4/PmbCXVPM0ini+weixlyaz6HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=TOad0C
        QlAYdFxFSlhlqZROlIaJ/tfvAfV7J03rJuV3Q=; b=Tkn7hI81Ko/0UhUmJfjMPu
        /6vE76xZQIZczWTQqTWmcKvP5UhEaf8R11akfrkoCXUfEZGMIddYgHIIOy446nRD
        DiAIOE1weHCUmIwWGcKiakxIXC/OyBSJV17LOD902LuYP7TPPCOCRtujqbFkEcsl
        0JIF+m4P55fieqLr2EWUnPOlNFvZHEvERaAOYZYsot/LtX4H9r8gXpPDTfJvNysw
        y2VaCQ84jeRbwNxZ4051hGaEPSj4Y6zWMEwiA1X94VJ29VEnahFusHoUYPBBA8ul
        qJQ7L37rrddIVI+TCGCSVDsO9Yhp7GfOCeG0tBvRvKhrCIv9Cmze5HuJvnPDcv8g
        ==
X-ME-Sender: <xms:ETf7XT_fVi9mp99cbDK5Y4NdGH5vmL9ByL9Z0SHriXyj0bBMiRsONA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrg
    hinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghhnecuve
    hluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ETf7XcGGt3XZBC0ombLEka2yZkOCt_W-9VM_FtxxmwGjWh5guHK__g>
    <xmx:ETf7XT2zC9qFKJcb9EodmyKLXCxMuwrIouSniOTCHqidqsWkg_SXyQ>
    <xmx:ETf7XegUNuXPYePuAvW-2-J1sTj5yKWpQvIdmX8Ra_MueDbIPol1Ug>
    <xmx:Ejf7XfRt_UOS1TcedCPWHf2lVGvSfk2zaWyXr2fSa8uDzF35QxbT37vxZfE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 09E3880059;
        Thu, 19 Dec 2019 03:38:40 -0500 (EST)
Date:   Thu, 19 Dec 2019 09:38:39 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, subhajit_paul@ti.com,
        praneeth@ti.com, yamonkar@cadence.com, sjakhade@cadence.com,
        sam@ravnborg.org, robh+dt@kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: display: ti,j721e-dss: Add dt-schema
 yaml binding
Message-ID: <20191219083839.lmuhxynbbqy4d4hp@gilmour.lan>
References: <cover.1576704528.git.jsarha@ti.com>
 <89db418c91689beb6e63e0c3c99b39655948b429.1576704528.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yiknogogty4yey3d"
Content-Disposition: inline
In-Reply-To: <89db418c91689beb6e63e0c3c99b39655948b429.1576704528.git.jsarha@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--yiknogogty4yey3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 19, 2019 at 10:23:17AM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for J721E DSS, J721E version TI Keystone
> Display SubSystem.
>
> Version history:
>
> v2: no change
>
> v3: - reg-names: "wp" -> "wb"
>     - Add ports node
>     - Add includes to dts example
>     - reindent dts example
>
> v4: - Add descriptions to reg, clocks, and interrups properties
>     - Remove minItems when its value is the same as maxItems value
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,j721e-dss.yaml     | 209 ++++++++++++++++++
>  1 file changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> new file mode 100644
> index 000000000000..cd68c4294f9a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/ti/ti,j721e-dss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments J721E Display Subsystem
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +description: |
> +  The J721E TI Keystone Display SubSystem with four output ports and
> +  four video planes. There is two full video planes and two "lite
> +  planes" without scaling support. The video ports can be connected to
> +  the SoC's DPI pins or to integrated display bridges on the SoC.
> +
> +properties:
> +  compatible:
> +    const: ti,j721e-dss
> +
> +  reg:
> +    maxItems: 17
> +    description: |
> +      Addresses to each DSS memory region described in the SoC's TRM.
> +      The reg-names refer to memory regions as follows:
> +      reg-names: Region Name in TRM:     Description:
> +      common_m   DSS0_DISPC_0_COMMON_M   DSS Master common register area
> +      common_s0  DSS0_DISPC_0_COMMON_SO  DSS Shared common register area 0
> +      common_s1  DSS0_DISPC_0_COMMON_S1  DSS Shared common register area 1
> +      common_s2  DSS0_DISPC_0_COMMON_S2  DSS Shared common register area 2
> +      vidl1      DSS0_VIDL1              VIDL1 light video plane 1
> +      vidl2      DSS0_VIDL2              VIDL2 light video plane 2
> +      vid1       DSS0_VID1               VID1 video plane 1
> +      vid2       DSS0_VID2               VID1 video plane 2
> +      ovr1       DSS0_OVR1               OVR1 overlay manager for vp1
> +      ovr2       DSS0_OVR2               OVR2 overlay manager for vp2
> +      ovr3       DSS0_OVR3               OVR1 overlay manager for vp3
> +      ovr4       DSS0_OVR4               OVR2 overlay manager for vp4
> +      vp1        DSS0_VP1                VP1 video port 1
> +      vp2        DSS0_VP2                VP1 video port 2
> +      vp3        DSS0_VP3                VP1 video port 3
> +      vp4        DSS0_VP4                VP1 video port 4
> +      wp         DSS0_WB                 Write Back registers

I guess it applies to all your schemas in that patch series, but you
could just do something like

reg:
  items:
    - description: DSS Master common register area
    - description: DSS Shared common register area 0
    - description: DSS Shared common register area 1

...

That way, you wouldn't have to worry about the maxItems, and you end
up doing pretty much that already in the description

> +  reg-names:
> +    items:
> +      - const: common_m
> +      - const: common_s0
> +      - const: common_s1
> +      - const: common_s2
> +      - const: vidl1
> +      - const: vidl2
> +      - const: vid1
> +      - const: vid2
> +      - const: ovr1
> +      - const: ovr2
> +      - const: ovr3
> +      - const: ovr4
> +      - const: vp1
> +      - const: vp2
> +      - const: vp3
> +      - const: vp4
> +      - const: wb
> +
> +  clocks:
> +    maxItems: 5
> +    description:
> +      phandles to clock nodes for DSS functional clock (fck) and video
> +      port 1, 2, 3 and 4 pixel clocks (vp1, vp2, vp3, vp4).
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: vp1
> +      - const: vp2
> +      - const: vp3
> +      - const: vp4
> +
> +  interrupts:
> +    maxItems: 4
> +    description:
> +      Interrupt descriptions for common irq registers in common_m,
> +      common_m0, common_m1, and common_m2, sections.

Same story here, but the names don't match interrupt-names. I guess
describing what those interrupts actually are would be great: you just
define how the driver calls them, but not what they are actually doing
or representing.

I'm guessing that would end up in something like that:

interrupts:
  items:
    - description: DSS Master interrupt
    - description: DSS Shared 0 interrupt
    - description: DSS Shared 1 interrupt
    - description: DSS Shared 2 interrupt

Maxime

--yiknogogty4yey3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfs3DwAKCRDj7w1vZxhR
xQiVAP0YWTQKwabkPS0Ih/yZ7kgZaZI/NkawL5OBnikqfkHl/wEA06JzVJW6zmLb
KdfMCcJtHUIF26iEy6TRIpttWUDgCAI=
=Rz1N
-----END PGP SIGNATURE-----

--yiknogogty4yey3d--
