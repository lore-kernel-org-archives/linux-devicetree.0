Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD64C11D1D
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 793D62467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="zrqAodOp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WgmsgJ/Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgBTSP1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 13:15:27 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57041 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728173AbgBTSP0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 13:15:26 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 585E221E5B;
        Thu, 20 Feb 2020 13:15:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 13:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=EO4iHaNxeieQg
        LG+TqEp9sUs9WIn/s4CrJUTMJBjELo=; b=zrqAodOpNdj3RUp2IZomKJmh1InYg
        DMIunaYe5pwFkSN/OH4Ai+zPqSZz1CAr3ifV+fLVrw+0mz+nuYaEe9cMdKp9tyo0
        Yqxv0nUPkF3AdMZ0bFmMulwH+p0g/fr6KbTqSHnpU9m3v8d6yOurE4jXBkyT7ai+
        vgfcEI1FccxP0gqit2UGJWpuvZnpD/hdBaxNxicsqQ7fNT56PwHScjNL/EcsMpxP
        71prnuPNmeJMIN0oD5Ndj6y+PxnmXpowIWaWll52n8FKVA5AE5tGeIjwmZm+XXd2
        PEOXxHtsdyDhbVPlGTHB4QTvt2pfxJ8go7AxsbopTLh+PP7UCRHK6I32g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=EO4iHaNxeieQgLG+TqEp9sUs9WIn/s4CrJUTMJBjELo=; b=WgmsgJ/Z
        QiEtmM4Vhn7AFskFoNxWrwLynxpIGfDQuuU+eWufiFZyi8Kfj5cqYXmA887NYTwr
        a7Qrp2FuT6DAzhG0DMcQVv7+HRHu7i91eQ5tC6InJ4t+WSayfYCbu/Lov8llIu9T
        Qo/Qi0CJyo4OAyFgCfHf+aye/RAWAMOKa0wX2xQ16ptSeFgKFzoT/V7jp6DXWL3S
        mHB8AJeAx9DYuQY2EvvThNE00u6Cauv/WDp3wbWOdME6LdkJ6zArJHfQF2o2OhxA
        EGG+mubs5UWZBp8nMx16EFf65/UPyQJnmBvsJ3Tp4ZANt6C0H6ZX4CFwcOOR3USj
        MiXwjlSCj7PvVQ==
X-ME-Sender: <xms:vsxOXmD_DXlqg-MRJQ-TFjnTVARVW0sWdrzqvhrfeqDJadCwrD6BjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vsxOXtQlS2l-d4RUiFJYpaAyTw5fLRQ2WwP5b8Lv9GgymxKNoeruHA>
    <xmx:vsxOXpJdjdhXq6XXMqODEBwTrehRQ-Wiky4s0_o3eY3Hekd1es2Vxw>
    <xmx:vsxOXtZdPuhj9cGfKZHaV0HtBZDNtYaguuXcLD01keRny_wZDGAHpQ>
    <xmx:vsxOXpYIOC4sgdyyG8UsVTT5drBHzNrjBvckfOMvapPA3Ilfz9oV3w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0BC893280060;
        Thu, 20 Feb 2020 13:15:25 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 4/4] drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU
Date:   Thu, 20 Feb 2020 19:15:16 +0100
Message-Id: <5ebdf117248c6189e7e4a2631a6681cf9909bd66.1582222496.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
References: <cover.a31c229a83f1d92e6928ae2adb70887da0fd44b3.1582222496.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The main DRM device is actually a virtual device so it doesn't have the
iommus property, which is instead on the DMA masters, in this case the
mixers.

Add a call to of_dma_configure with the mixers DT node but on the DRM
virtual device to configure it in the same way than the mixers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 7c24f8f832a5..85b8930e334c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -372,6 +372,19 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
+	if (of_find_property(dev->of_node, "iommus", NULL)) {
+		/*
+		 * This assume we have the same DMA constraints for
+		 * all our the mixers in our pipeline. This sounds
+		 * bad, but it has always been the case for us, and
+		 * DRM doesn't do per-device allocation either, so we
+		 * would need to fix DRM first...
+		 */
+		ret = of_dma_configure(drm->dev, dev->of_node, true);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * While this function can fail, we shouldn't do anything
 	 * if this happens. Some early DE2 DT entries don't provide
-- 
git-series 0.9.1
