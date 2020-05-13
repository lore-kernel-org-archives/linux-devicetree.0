Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FA1CA90AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B721120659
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 14:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="TyN/Kass";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jbDoz/0+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388412AbgEMOHk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 10:07:40 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:33895 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387608AbgEMOHk (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 10:07:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 4570C5C01D4;
        Wed, 13 May 2020 10:07:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 13 May 2020 10:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=M/uT2VAMvJxq+
        N8SIgjpFxvdiYGvkWfI32zs4UAQuM4=; b=TyN/Kass/M132biLl9vpinE7KZ58U
        vXLigWwELkOFihewym59vM5MWrjupzlbcsqdGnF6hjCg8fBepMdEUW26gKm95NXR
        4fWi5lFXqamZS7Iv/pSk96xbVWjuZELYsQ538vfyYgpTVQyxolKaeqy4DOmr6cPJ
        gdZrsZDVYcN1TUE2rIn+XPFWQeZFku2mKe9N02AtvRJnVIFzM11PRIp1xEILDQEa
        l5PeV7MWMqvn578w85jUJNJId8lIouv6zw+G+TG7dc+9omeYI8FWvJt3sLDsXrp0
        QaWlfC7N+K4mhsiT8W/d/LVslG1OiDxx9AvSRECyylds5Y7qbwL2HePxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=M/uT2VAMvJxq+N8SIgjpFxvdiYGvkWfI32zs4UAQuM4=; b=jbDoz/0+
        /19pRxYNOLGM4fX1jG/0X4Wrwr9rYziyAAZspwLC0bnFSwDhW1t6h+mYfIUMi9Jc
        JBanS5GLd82bs0fA3e7VqpxYyJt0+YljOAYQ8b7o3UF/FKP3/Nw0KH7rUTZVNsGr
        DCE7VOlOg+KSftsKFK3AdulwmPcwCcdu3xf1rmXGKx1ylNYJtVT+aSTp4n1+m+vw
        BpSQ/qVKEcjJqQE5VWUatrLi/QbEUwzg4hc6I4vWm0CuyTUaEe2bOlecgVMRk3Oq
        CYTEJRMtdawWchWDCsLS7Yj9Fds+C3hlYqPd+k6t13o8oYpbV21ckkXhEV3rRAbZ
        8wRjBn0UbC7I1w==
X-ME-Sender: <xms:K_-7XsD2tylqE5CUUVk_addz0TZKCChKmfpFrjzMVIJoSpKMUaiAgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K_-7Xuir-ku70jvSRLp4u9i6pyV9poZSinRdM8QtTFIK_ck4Wsy24g>
    <xmx:K_-7Xvn5bTHi9aaS78pZir_hT16msnDAE86uznBoSygIa84xJDLlWQ>
    <xmx:K_-7XiyR2H58xceS9ymBELIBbAar2sbB8I9d0S-s7M8G5BHoQvhbKw>
    <xmx:K_-7XgGMEIKJEr_H2128NPPU_lDebadA1WqOLCWCS1afVNzWstvfkQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BA2FD306630A;
        Wed, 13 May 2020 10:07:38 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 5/5] drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU
Date:   Wed, 13 May 2020 16:07:24 +0200
Message-Id: <9a4daf438dd3f2fe07afb23688bfb793a0613d7d.1589378833.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
References: <cover.b27dedd61e008ffcf55a028ccddda3bb4d21dfc8.1589378833.git-series.maxime@cerno.tech>
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
index 56cc037fd312..cc4fb916318f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -363,6 +363,19 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
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
