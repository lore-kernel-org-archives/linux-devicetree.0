Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9947AC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:48:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46050206D3
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 10:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="hpoeKy4M";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wDSmux4G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfLPKsW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:48:22 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56731 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727099AbfLPKsV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Dec 2019 05:48:21 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8277E712E;
        Mon, 16 Dec 2019 05:48:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 Dec 2019 05:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=b2sdt1L+RtAvCJWD+Ejy+ZFvgQM
        jCXlABUGffB8yAfA=; b=hpoeKy4M0e/xSvJLEpsfWD6wOgXYRtamc7oXmnJ0piJ
        I3b0fZd7v59vpwxad7wQ7IxLTz9XYIZcSri9aKECh0m9CZAqp7RJy/wpf+TKCk0H
        5drdwgmqEjXT2Q+noD1x+8Jeh0cexJphIVqVMMezk5wyNUeVKsY512uvA2jyko62
        joC4nuay5b6kHnbeRsHJctp83oWLygRop0qtKLLF4l0x4L5U29IPwBc1qC6a147H
        iyKQZeFWzr9T1mpkPO5GSA02X+Tb7bU/Eh/l1s+CXUMrr18ApOQ+vwKrZWnS7o5z
        08+V6irSPmYEc1zbk10CNKSW89FJVspqMaV3OK1+0QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b2sdt1
        L+RtAvCJWD+Ejy+ZFvgQMjCXlABUGffB8yAfA=; b=wDSmux4G5XsrldAYsui0YF
        pYc8Svcsbxs4ZWyysfS0XnYYgzgFlGK65W2CxBUJlCWNyTC5mWVMT2cvaAfXSHfS
        uquhig/HLIC5SSZgSyJBr7pRjkYsl0aioO4aAme/OFok3dRbGp+dYN3Egryn3BjN
        ZQKtlfGjZRyzGqWJsuYq79ril5x5A7tBykog+2quKzQOsD601klvnizLN6sSJe21
        ORNH77lHrfe3ksC54G4wLc/YrjRHzwzNEC0MhJHCxcStVH5pKSPVYX6Vcg0Y8+K6
        O4HW2lD5mxpboe7fh8+ay7aHynmv3gNcxX2SFDwT0RtxurAfT9HyrPMpoL9KjUtw
        ==
X-ME-Sender: <xms:82D3XYYias_kvtl7_R0ILc0k8BsgyyYH-tzt2rV1jsQwfOdwtKr3XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:82D3XWofO-dhm5zVt2cImA2pQHn1JHEAMECKaBperVUf4LUGme1KBQ>
    <xmx:82D3XcYf6FwSIxZiZteTo-Eyu0wayV82DR75lHASu3ZTWx5dJdEZjQ>
    <xmx:82D3XeTmSoQpebhQDlaOCf4ZnlRApl7Hq_DyQFTnf4GRE6ikH9CZZQ>
    <xmx:9GD3XYvCRlj-vrtszBqs79rDoXPTEjGttA70nTEU0BduQ4J5v2mBdw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id ACF288005A;
        Mon, 16 Dec 2019 05:48:18 -0500 (EST)
Date:   Mon, 16 Dec 2019 11:48:16 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/12] dt-bindings: display: rockchip-lvds: Document PX30
 PHY
Message-ID: <20191216104816.zttjrgck3rdr54ok@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="inqcuz5g7xh4n5en"
Content-Disposition: inline
In-Reply-To: <20191213181051.25983-3-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--inqcuz5g7xh4n5en
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2019 at 07:10:41PM +0100, Miquel Raynal wrote:
> PX30 SoCs use a single PHY shared by two display pipelines: MIPI DSI
> and LVDS. In the case of the LVDS IP, document the possibility to fill
> a PHY handle.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-lvds.txt     | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> index aa5663a6fd42..ec7b4341cfd2 100644
> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
> @@ -19,6 +19,9 @@ Required properties:
>  - rockchip,grf: phandle to the general register files syscon
>  - rockchip,output: "rgb", "lvds" or "duallvds", This describes the output interface
>
> +- phys: LVDS/DSI DPHY (px30 only)
> +- phy-names: name of the PHY, should be "dphy"

Should or must?

Also, phy-names is optional only for px30

Maxime

--inqcuz5g7xh4n5en
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdg8AAKCRDj7w1vZxhR
xel0AP9MqWCTdMxRsTUEkW3yY3dbF1oX5qWpR8bMcDtuj70uRwEA57+6MTtKXQt5
k9opFOaTXgz5rq8ptFWDC/kAy5Z8/Ao=
=SRme
-----END PGP SIGNATURE-----

--inqcuz5g7xh4n5en--
