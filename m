Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62368C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3566B2075B
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 09:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="n9qLyvJ0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HDGVEXps"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLIJeu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 04:34:50 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39123 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727454AbfLIJeu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 04:34:50 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 7BAE3228A2;
        Mon,  9 Dec 2019 04:34:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 09 Dec 2019 04:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=mKPUX87mu/fBK
        Hm6UpGd87kix2+aso87ZbphQBUSJ0g=; b=n9qLyvJ027c8MM0s2e9x8V6nYdEVE
        1i5wvw0LrX5h9ETBcVIidFEQ/IrTF0w5TOyrIf1eFLmOUjKDLqCuLZ/H08tlwSjy
        JMeZFFrLPm+US1n2H8mWNMjkRJaHhI35mQuA7/Hn+O/exp19cFs/HewJkhGyiObo
        n8/zTNWCX2vcJH9S1PFgHhxeQtxKtlRgA5OnVsEPrdvWpiG+vnxmIVKX6x9Gt/zc
        q/aSyMYhKFRdK3MTR1eToXDa8/twamWNsx+hL56ADK+2dI7os2AkTAP8exqvxvaa
        VpaUkkCISpHmob96deM3PPLoYZjErUZD51yOrmVe9DZRDcMFNI1AZFanQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=mKPUX87mu/fBKHm6UpGd87kix2+aso87ZbphQBUSJ0g=; b=HDGVEXps
        Doo3ncZigmq4LeE3IgrmPwfE6wkNtispHA6IgQXCBSYGjPI2rXlpwP+WCNGRvKjL
        saIIG2gxDcLgeWDIIkih+/BSVfs0nNgqXdx4MSoCZ+1OKcpY4GKIBZjZBK5/gFFq
        tHt2RkWoYb8wIj9ghvck9MJ7WePqUA/r7wlvvet5OHKcnCQxMV3HD7AELSAuNen0
        jhW/p3t9Uql9sZ397toVcGpPlrrt6zSHOel0JjY7KAppy1bY5ONXz9TLSdNzsTuG
        S1dqjAfYKmlDJioum5bjQzcXdvrBP4fZWKNjArd3gJapsAghZIWvPBnTnL4KE123
        OdQkxrcuLKHBKQ==
X-ME-Sender: <xms:ORXuXXSNuxz6kO7E6TX9kjrXy0DPlXpojWamlRGt-PklqZrlVhqqlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
    rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ORXuXbTIjnTIWrsPo068HUEaywVux-AdVsBas1Lvv7C3bDgy795KYQ>
    <xmx:ORXuXc-JF_-RU38L4hhoGLx1t1UHNeqVFeH5yWLpBAQLbw2_pgxuKg>
    <xmx:ORXuXZ8fBif_nZUoZDHnoE8syONvj3I0ID0LqaeRGj3vZNvR8vQHbQ>
    <xmx:ORXuXa2xDW5TYNsCpE9YGukNO3faPZS5-qD4xTNQyaieDKbJQOaATA>
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 19D1630600A8;
        Mon,  9 Dec 2019 04:34:49 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        krzk@kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/4] dt-bindings: sram: Allow for more specific compatibles
Date:   Mon,  9 Dec 2019 10:34:39 +0100
Message-Id: <20191209093441.50694-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209093441.50694-1-maxime@cerno.tech>
References: <20191209093441.50694-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Even though the generic mmio-sram binding has a list of the sections
compatible allowed, most device trees have more specific compatibles
attached to those generic ones.

This creates warnings at the moment, and we don't really want to cripple
the generic binding with all the vendor specific combinations that would
prove to be hard to maintain.

Let's allow additional compatibles for the sections, and then we can have
the vendor-specific bindings to reduce the scope of what's allowed exactly.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/sram/sram.yaml        | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 83e3bc64d6fc..9ffef983510b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -64,15 +64,16 @@ patternProperties:
         description:
           Should contain a vendor specific string in the form
           <vendor>,[<device>-]<usage>
-        enum:
-          - allwinner,sun9i-a80-smp-sram
-          - amlogic,meson8-smp-sram
-          - amlogic,meson8b-smp-sram
-          - renesas,smp-sram
-          - rockchip,rk3066-smp-sram
-          - samsung,exynos4210-sysram
-          - samsung,exynos4210-sysram-ns
-          - socionext,milbeaut-smp-sram
+        contains:
+          enum:
+            - allwinner,sun9i-a80-smp-sram
+            - amlogic,meson8-smp-sram
+            - amlogic,meson8b-smp-sram
+            - renesas,smp-sram
+            - rockchip,rk3066-smp-sram
+            - samsung,exynos4210-sysram
+            - samsung,exynos4210-sysram-ns
+            - socionext,milbeaut-smp-sram
 
       reg:
         description:
-- 
2.23.0

