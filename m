Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19D2C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A51112075B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Gm1hRYX+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WoRSJ/D/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLIJex (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:34:53 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49685 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727454AbfLIJex (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:34:53 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id F329522855;
        Mon,  9 Dec 2019 04:34:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=S5c/sy1rEfhoC
        tKq1f3YwzXpZZiw9bf4fsl2pQLauCM=; b=Gm1hRYX+P4eIv90Wp1zpSYlo2it95
        mclPXvfYsFPAZqMhBpvU0j9xNQ/dxptE6/B1zkLGlC1jEnZbSBNFlrnfkZ0QNuFT
        Ej8ilray5YvxdnE8ZXCWzJ/2X9r2O0SAoM7yxv/5VSteNBt1+Fq7EEQogiw0VfTl
        vjh08Tb+scfOtsu11xx8ArLmThAlOPmd1GvsV46aTNoej1JI4MnqOth0iM7VqOO7
        CQNlhH6vfA1H3gyGE8P9CZ592GC+wmJsXoGtu9HiJ51h+S+KUe9Ae07mbS2miP1z
        3njY/a1+E1gbp+yp905apS+q5Tteb1sYS/rNjTZU+yVExIhtARCxdX5Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=S5c/sy1rEfhoCtKq1f3YwzXpZZiw9bf4fsl2pQLauCM=; b=WoRSJ/D/
        kjMqWPPUgk6iPmiK9jejSrzmdPCCpl5pj27wJ9cngEKs4Zb7nC3W05xqDbDuD/6A
        R3ofNcOYfW1SyRFHT1TeemgSQjMXCa8yz92RVOHlzknX75jmAcqNydvsIH8GVJn2
        lcEFuVLt4/u4guoM1Witn6Tx7zpeLuxEYk6y0nz4Mc+C7Fk8TB4bH38sGN3Wu9kE
        8hFMcsQpDkOHIL/w29nM8KPhvUocbeB2DMSAKPbj6+2uWVHqucxoN/Vfw6l5IdCU
        YdTWCk7sB4z3m3daQypFoRbczE89KOskOxjsdKyMii3BEQJsr5/a6QR1whhdVza6
        dLkFyspJP5NuLw==
X-ME-Sender: <xms:OxXuXchVn6Nu7cjuoDxoNnl_EmJKaNtIsBGnWhDnvLJdnyn8JO7XcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:OxXuXaCgXiNqTuAAVHUCmg7-u1btZ2ge5EypcQv-m14dGEWsVR5_KA>
    <xmx:OxXuXb9x8CMxStJdislNuKmDqek_U7vby-CsL_4NAgrLXjhGIBg29w>
    <xmx:OxXuXbFcqV6iPY1olGMYCy-xQf2-NfCbxmNLWwwU6SzdXxjsJSXwzA>
    <xmx:OxXuXVliBq3lhhFtiK0RCguwhDEamrnm17FYW1d7GxwPfBdnr5CrOA>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 74A2A8005B;
        Mon,  9 Dec 2019 04:34:51 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        krzk@kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/4] dt-bindings: sram: Add Allwinner SRAM compatibles
Date:   Mon,  9 Dec 2019 10:34:40 +0100
Message-Id: <20191209093441.50694-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209093441.50694-1-maxime@cerno.tech>
References: <20191209093441.50694-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The mmio-sram binding was added missing a few SRAM sections compatible for
allwinner SoCs. Let's add them.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 9ffef983510b..7b83cc6c9bfa 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -66,7 +66,11 @@ patternProperties:
           <vendor>,[<device>-]<usage>
         contains:
           enum:
+            - allwinner,sun4i-a10-sram-a3-a4
+            - allwinner,sun4i-a10-sram-c1
+            - allwinner,sun4i-a10-sram-d
             - allwinner,sun9i-a80-smp-sram
+            - allwinner,sun50i-a64-sram-c
             - amlogic,meson8-smp-sram
             - amlogic,meson8b-smp-sram
             - renesas,smp-sram
-- 
2.23.0

