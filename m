Return-Path: <SRS0=Tw2w=2K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F08C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 15:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D50C121D7E
	for <linux-devicetree@archiver.kernel.org>; Fri, 20 Dec 2019 15:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="DkomQHJl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sD3QUXn7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfLTP55 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 20 Dec 2019 10:57:57 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:39955 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727181AbfLTP55 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 20 Dec 2019 10:57:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 85DBB63B;
        Fri, 20 Dec 2019 10:57:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 20 Dec 2019 10:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=DWRfGrqmcAZSxRGOF3HGl72f8EB
        7ZuJWZqiu9aOnifY=; b=DkomQHJlMT7fij4JGea//tOVJqfbrW6hyptmKNpYa+e
        NVrUDsINKPMllW3Bo+XD6GnzRGv21tJfmDOUAKqSZO5BcudCnfNPR1QRqpdpg3RJ
        8lJm24JOHYyiPkTvGtTRxmduVGmgnsDN0a35qDoYAiybK/8JwTUN0Z7okfgv3ZJA
        E2dzQiRBs8pgkffif8yCo1G2l/pdkwZhF2OqVXVDOT4jcOj9qM3Lm0mY/uHW+KRe
        zDXDd6xVidKrHUHBZHJpt+5AVUUSnluugImupfz9XdLgXgCdk1Q6SEQNgKAKSp6L
        C1zpDQ4LH5crjxHWJskVE2icUuOKmH3cD8CVjYxwYhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DWRfGr
        qmcAZSxRGOF3HGl72f8EB7ZuJWZqiu9aOnifY=; b=sD3QUXn7GQ/sLewF8dIEpe
        aKOrYz2SDxqE0kivCjtvk6q6lW3+xc/dNq+X1yc/hyNEznumEix5lF4sQM06IXDO
        wa5ZWhP1XIpjFmJqE68WkXHamxFKJlVFFJtoJ8gZuCVQocVJWFubNG+r1pWdLXc5
        T/jh3Pszy+vXUVcZ1woAeQwDygKhfy/srvLr9d8tD1Uo0LTBy+m0jbNetQZHXNdu
        meQYRFHUHD89e3S6sPadaW2ZvqVB3jyrv4IAdXtaEpt442GPQC+ndP9+wExzt85X
        A/t98ULPS+5vsaASm3ZzIQm79o8OwabduD4FF0jcimogSUkJDjaP3lXjckmh+8pA
        ==
X-ME-Sender: <xms:g-_8XQmgia-VUX4bAeKUMBnqJ55En6jU9dCDwathLlTJeMAwjANb1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:g-_8XatDgCcAKQEjqxg0QHGws72P22V6ArelMmNKT7Efy7c_DxkoFA>
    <xmx:g-_8XWcyOx2FC3KyZJ-HeXVNr3bKN6XR312zuIYE4njziu2nwsU7Vw>
    <xmx:g-_8XawNW9h0Qm0Z-V7wjXDMOf4Q1WNBdeD7-0NkxHFcaiuqval_bg>
    <xmx:g-_8XQFwB7OoTIGnAIzHD47cunS23Cjt9v7e37YhjomidfRg-BpPvqkQH0M>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A870180064;
        Fri, 20 Dec 2019 10:57:54 -0500 (EST)
Date:   Fri, 20 Dec 2019 16:57:53 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com, praneeth@ti.com,
        yamonkar@cadence.com, sjakhade@cadence.com, sam@ravnborg.org,
        robh+dt@kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: display: ti,j721e-dss: Add dt-schema
 yaml binding
Message-ID: <20191220155753.n3dn2zwwlcp6jhwe@gilmour.lan>
References: <cover.1576857145.git.jsarha@ti.com>
 <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5g2qeeyvhxl6r4rp"
Content-Disposition: inline
In-Reply-To: <e05570c9c5c0a22f5aaa36dd2503fe918b1f941e.1576857145.git.jsarha@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--5g2qeeyvhxl6r4rp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 05:55:11PM +0200, Jyri Sarha wrote:
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
> v5: - itemize reg, clocks and interrupts properties' descriptions
>     - there is no "vp" reg-name, only "wb" for write back
>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--5g2qeeyvhxl6r4rp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfzvgQAKCRDj7w1vZxhR
xQuJAPoCMeJSZlBNoqBslhL4ciQb5qC/a79LgCL5VVW9MAuDggEAwLzB9XTsBEDj
mWwNPp/cIcyOuk1le02mJ0Y5wCYsNAU=
=mW22
-----END PGP SIGNATURE-----

--5g2qeeyvhxl6r4rp--
