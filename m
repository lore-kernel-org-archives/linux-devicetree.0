Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7252DC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 17:53:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4530D20780
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 17:53:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="pVaSqStD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MZNc3HlM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgC3Rxi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 13:53:38 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51899 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgC3Rxi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 30 Mar 2020 13:53:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 151FB5C0138;
        Mon, 30 Mar 2020 13:53:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 30 Mar 2020 13:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=mgR3D3zqcJ1KgSGC+204rTVds/V
        oKOPgYAKcEaRCR3I=; b=pVaSqStD9BOCE7oL66tSTUJJv48rfpCAn1ijcwWGNlC
        FEWha0lkwTAUttmyfok9LA9wD6pvIKbqs9MKWQp2y28HgMr6IWd80kGNPsJdz9bC
        fKYx2UtT6r+E8LUKgV79gNBfiwhmDyGYeWYcx7AAXX6Ho9bFYfP7MbhMC89wSbCI
        tjdDCUZ0lLGQKOrGXAnGQWhFoBf4miQXVYHXB2H+bs8HNqf76wRLJ6t9EFhqgCi4
        tT8oG9AjMq6d6a3U8b0YOQ7RRvDXvHNJaNWpQbhoeuftFNHnXOiqfeuXHV9R+GRL
        AW0RQN86gfXMtMU+f3wpNfvH/vCnXFlShB9cGUSWLgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mgR3D3
        zqcJ1KgSGC+204rTVds/VoKOPgYAKcEaRCR3I=; b=MZNc3HlMmBBSSEiF6FM8fB
        fRkBL9o9mHSgsGF2xRnufR+FO3Uy8Ud/db8rJp6SWWhCXN8WnGDwiXId8SefCpE0
        09lGcu8x/H3M4+84kEQ+MzjrI8h8rqw97Ys4b+CZsZ1VEuJBDJgCw0jeVWpLPGHL
        2HzkbfaQfukJ93FTJYXEagTCy5wlKqiTQ7ln+lMMQVSj8umQRIf6MaMA8AS1GbeJ
        YfdcamZfI6qVceM/9Sk1AWDYtm0nO3LlhoiT7xkh6WFpHzQWZOBbFA1EzHYoCJFj
        LwxkcDO8hUdVBMnYZXwb1f7FFih8N11XPdDKfm4+uFS174BhNVDTJdvmOdgY/H6Q
        ==
X-ME-Sender: <xms:HDKCXvImM_LQGGZg7r9TFfJTWNcDCBBW6o-NwITvQrtZO-EcNNsAzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkpheple
    dtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HDKCXvmBbLsJOxywwYElPil87O-Dg-DPmacfEt9_lY7KVdmWY5weUg>
    <xmx:HDKCXu9XYxQzzLzhGMROVhYDRqfIb0op08d_vQnSQ21MH_qVbvtvJQ>
    <xmx:HDKCXu5G9v4yaNtLlqEy1x_iVFaDy4K96O-74nD9XlcV299kK9MoPQ>
    <xmx:ITKCXmOPHgMHcUlImX3tzqCRZXpXa6WT0xYfX9o8DLk_nOuusRc5mQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5AE1A3280060;
        Mon, 30 Mar 2020 13:53:32 -0400 (EDT)
Date:   Mon, 30 Mar 2020 19:53:31 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Qiang Yu <yuq825@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, lima@lists.freedesktop.org,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: add opp table for mali gpu
Message-ID: <20200330175331.4o7iunuw7anwlmco@gilmour.lan>
References: <20200328091632.12837-1-yuq825@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fs72k4kzd3zlkg52"
Content-Disposition: inline
In-Reply-To: <20200328091632.12837-1-yuq825@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--fs72k4kzd3zlkg52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sat, Mar 28, 2020 at 05:16:32PM +0800, Qiang Yu wrote:
> OPP table vaule is get from orangepi lichee linux-3.4
> kernel driver.
>
> Signed-off-by: Qiang Yu <yuq825@gmail.com>

Thanks!

I've fixed up the value typo, sorted the opp table according to its
node name, and added some new lines after each OPP node. This will be
part of 5.8.

Maxime

--fs72k4kzd3zlkg52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoIyGwAKCRDj7w1vZxhR
xednAP9gvyOKiByE8Fiks6VW3DsnsVEnfi1WpPbOdJiv+ErK3QD+PKcUkslxkuzc
Cp1Tv6r9bfBseVedxQUUBKX2bRMcNgc=
=i72i
-----END PGP SIGNATURE-----

--fs72k4kzd3zlkg52--
