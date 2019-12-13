Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C23C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:42:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67B3A206B7
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 10:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="RpFkaa9J";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QbEiOiTN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfLMKm1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 05:42:27 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:47171 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbfLMKm0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Dec 2019 05:42:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 75F6E5DBA;
        Fri, 13 Dec 2019 05:42:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 13 Dec 2019 05:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=vgk7FL9HE/DhoT+VdhEoE7vu/ra
        uoTEyo8weCVOH8SA=; b=RpFkaa9J+pcmp6q042NfBbI+t4NPy44WfK7eZAubKAs
        ZKmfz+/gQwdfw1VGjcCP+TdJtLpuWqWnNnhhbKHE2CH3XRisIvVteygfQ57kgJIh
        5Z41vC5AaG/c0m6i2kvDEKdKH2AryU2VlZDn9Tp5wgzGHu0/qYBnWgaS8JPryXju
        UbWLNXvcYi6Oj6GdPr61Q1gpdYMHe7o4Zht6oWpo+zpjLNAkBCvV6QaIpL2Snz91
        XN2ZptryfOMVfuOpgtbXYoIbXMihPb0jGhEaCB7x9IwFt0evCzXkhg+0DFjubWe7
        dR0EGJUd0AHegkEHACR6ir4Ti5qUmRoK0mDxFMzIxSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vgk7FL
        9HE/DhoT+VdhEoE7vu/rauoTEyo8weCVOH8SA=; b=QbEiOiTNPE4vD8e/j0D6Xz
        hHkAJO9PuQOnrlRvK0TlELR1Obr+MrBiuuswLxi7Q3mS8oN/vNVAYtWU9Oq7h3Yv
        Yjmxk4cvIjlZugr4tv0TeRqVxbeR+eUdshIWKLJq6B3l0b/epJTZLEnnCbNo8jQv
        +r5b4Qzh0yb4K4c07DS2cYxLqx1TXi7LDs8CxvBcbJ64NNYHJGlKXMOAnIOpp+YJ
        hrjk+lSxeylKsjso+5EAs515iBCaOCERQHOhBd8/hYgpwkhL+4qZVmaIjv72/UKa
        5wqVWweRSSQ+vIS/1xKtttFZXsgccfp2L/Gdf9mngF7wEDEoIwERndy7ZMbjTxLg
        ==
X-ME-Sender: <xms:EGvzXaWsPeAoZSrolyzvTW9LlB-g28VteYOcfsoU5i36WZ1vL3LUpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
    hnpeguvghvihgtvghtrhgvvgdrohhrghenucfkphepledtrdekledrieekrdejieenucfr
    rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthhenucevlh
    hushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EGvzXZLVgHDuGQlZli344liZwYvtfwgs-eiRQu2IdBbpEuf_EENilw>
    <xmx:EGvzXVjism9prFcsHIdmqepdKm3Dnqcevmf2NqkpaIDFrKsDkm4DNA>
    <xmx:EGvzXZk1lj4Xasztv1_-P3ol-owH8fF-NI_OA7SHt3KUCpt2hVa85w>
    <xmx:EWvzXZiSmSwJzI-7t7-Mit9M7DaCXnPWb3Vi_3NGoSes6QqBt6GP0A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 98B163060158;
        Fri, 13 Dec 2019 05:42:24 -0500 (EST)
Date:   Fri, 13 Dec 2019 11:42:23 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
        robh+dt@kernel.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
        laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com,
        sam@ravnborg.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: ti, k2g-dss: Add dt-schema
 yaml binding
Message-ID: <20191213104223.u55zlm2zwpgarvil@gilmour.lan>
References: <cover.1576158368.git.jsarha@ti.com>
 <7c2e386d48cf0c8b932804f24e3f6ea81fe3d3a3.1576158368.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h7rjevoyojpmg3m3"
Content-Disposition: inline
In-Reply-To: <7c2e386d48cf0c8b932804f24e3f6ea81fe3d3a3.1576158368.git.jsarha@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--h7rjevoyojpmg3m3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Dec 12, 2019 at 03:51:57PM +0200, Jyri Sarha wrote:
> Add dt-schema yaml bindig for K2G DSS, an ultra-light version of TI
> Keystone Display SubSystem.
>
> Version history:
>
> v2: no change
>
> v3: - Add ports node
>     - Add includes to dts example
>     - reindent dts example
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../bindings/display/ti/ti,k2g-dss.yaml       | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> new file mode 100644
> index 000000000000..90158e8b6aad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/ti/ti,k2g-dss.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments K2G Display Subsystem
> +
> +maintainers:
> +  - Jyri Sarha <jsarha@ti.com>
> +  - Tomi Valkeinen <tomi.valkeinen@ti.com>
> +
> +description: |
> +  The K2G DSS is an ultra-light version of TI Keystone Display
> +  SubSystem. It has only one output port and video plane. The
> +  output is DPI.
> +
> +properties:
> +  compatible:
> +    const: ti,k2g-dss
> +
> +  reg:
> +    maxItems: 5
> +    minItems: 5

When they are equal, you need only one of the two, the tools will add
the other.

Also, adding a description of what those registers are supposed to be
would be great.

> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: common
> +      - const: vid1
> +      - const: ovr1
> +      - const: vp1
> +
> +  clocks:
> +    maxItems: 2
> +    minItems: 2

Ditto

> +
> +  clock-names:
> +    items:
> +      - const: fck
> +      - const: vp1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain
> +
> +  ports:
> +    type: object
> +    description:
> +      Ports as described in Documentation/devictree/bindings/graph.txt
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description:
> +          The DSS DPI output port node

If there's only one port, why do you need ports in the first place?

Thanks!
Maxime

--h7rjevoyojpmg3m3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNrDwAKCRDj7w1vZxhR
xXoAAP4+hx3XYi8AsAWRYJersbx7MZ2tEkHeK0WLriGTWXJ5fwEAyV7WaqLUhkzn
qbrivmLoR+AKdYiDgIO+USQn229uMwE=
=vNap
-----END PGP SIGNATURE-----

--h7rjevoyojpmg3m3--
