Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44079C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 15:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22AD5206D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 15:44:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="XGkM4f9x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CHw7B4RB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgGWPoZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 11:44:25 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:56629 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727108AbgGWPoZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 23 Jul 2020 11:44:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3EBD358046D;
        Thu, 23 Jul 2020 11:44:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 23 Jul 2020 11:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=3
        WU5tiH6MW2suDFTBvDbYfQ8TP5tgnJIuAQD/XuTOGQ=; b=XGkM4f9xk4vSaNPSq
        B8sEnunFjr0biFvfDNBlH1OmV8qiODcIyJI2fiWqwYukyfRM/LNgHoxS6AmTRtQG
        0uZnJ3qpRADkJ4k+IIxbb2ioBC3enac7CddhNM7FxiUMenw2wtPocXkOwJtXiUWS
        BON6TSvLeORYJQCfs16pm+aptmoWMIiVydkqmf6XLkSxqko/bFDeu14Vki4vLqob
        Ixr17YPu2/S6Uaq72SYjqFLN+VDyzgBwFT9qQn9hkQjwLKX3znbBhrDoKX/SuljN
        TH+NTqK6yItgaWxprpgnkKCKjPockDZps2rvGAtmFB3qI3SXqJzYRJqOz7Ugj4Ol
        LNITw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=3WU5tiH6MW2suDFTBvDbYfQ8TP5tgnJIuAQD/XuTO
        GQ=; b=CHw7B4RBoH4oJkqH1vY1e8D6B2/mKF3Tvl2x1ZMZe9CiKS7mQYzTM4TkS
        5KfEZsr35HNA/l27qM1NuxMFIl2t+1H76rEfi/Daznztqf4UzEbKu5IdC4YmwLDm
        x5D0Crq+de9qk9+68qoMFeG+CJkTcXDZKBbY6v1qcK2YhumSH5P44jqDKAONjsXa
        D2ug/8b/h/nnC6+l2vGu+4qrAe6EEmtYugYQ/dS67f4fda6m10e2hAzj14+hF1el
        +QuYFKQB/0htUvsKI+0QKGjce0R8X0dmFfBhloDT9SvrGdli5b9C0kHYGcKyjTuC
        2KutWzLd36xJzP5nr2FqBhLp4j4eQ==
X-ME-Sender: <xms:V7AZX9HH9jlNg0YUYena9d9jFpx3LvaNbDrEjNINsS1EszVrKOY4qA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrhedugdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:V7AZXyX2OiCjwtm10I8FcF5SBqSyl4WcZk3PNgbsUFaOLxzba3W9Mg>
    <xmx:V7AZX_JjvKn0xmkTmRPqJ2FyGSo4fEfd3rAccJVgo0ch3c_n20-BIg>
    <xmx:V7AZXzFm_crW2JeHYcbppaC04F7uClLJL8EKFSA2tY-MxeyT2Xjz7w>
    <xmx:WLAZX6FTEgDJm6Ir3Tqvf2pmdYCyV3A4-IErTeGQRsQuyLCOPm-nvw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 52341328005A;
        Thu, 23 Jul 2020 11:44:23 -0400 (EDT)
Date:   Thu, 23 Jul 2020 17:44:21 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: bcm: Add a select to the RPI Firmware
 binding
Message-ID: <20200723154421.yzecsy5qctqbgbxc@gilmour.lan>
References: <20200626115433.125735-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200626115433.125735-1-maxime@cerno.tech>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Stephen, Mike,

On Fri, Jun 26, 2020 at 01:54:33PM +0200, Maxime Ripard wrote:
> The RaspberryPi firmware binding uses two compatible, include simple-bus.
> The select statement generated by default will thus select any node that
> has simple-bus, not all of them being the raspberrypi firmware node.
>=20
> This results in warnings being wrongfully reported. Let's add a custom
> select statement to fix that.
>=20
> Fixes: 5bc0b9be8544 ("dt-bindings: arm: bcm: Convert BCM2835 firmware bin=
ding to YAML")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>
> The original binding has been merged through the clock tree, so it should
> be merged there.

Could you apply that patch to clk-next?

Thanks!
Maxime
