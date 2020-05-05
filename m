Return-Path: <SRS0=A/SL=6T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31EFC47254
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2C3C208DB
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 May 2020 10:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="nA5ILPf0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cO3vRcMa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgEEKJt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 May 2020 06:09:49 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:57561 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728402AbgEEKJr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 May 2020 06:09:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6802F5C00FB;
        Tue,  5 May 2020 06:09:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 05 May 2020 06:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=ZkRxrxZSNGuow
        kN4P769eI5gSRZrMFISAKsJx9k9slQ=; b=nA5ILPf0AQg6dLXKDa1ck8Gb+YYRF
        T5c58/RVJ2DznRfZo4/RkbPy7k5x75tRx8xr2hkxLVat18hth9KHZm7J0DlAqV3a
        /kczUXEeySSfcTIwrz8CV/vxlFGEb/iNivsJrclQ2hw89JKo71U3N3NgXbx5gEIP
        z8eEBUR+wehlk33HCb7seB6Do5XmFVcXCwpYXCssd8d/e81MoQclMQU/O29t5UwT
        Z8rokeSnhBhsbde/cAQ83UqEtq45JqxVNE54JJx3H5IXGJohOZmZfs4vk4CX2xPq
        9HUnmNrabYFPzNkaf6657PkcjC9nGsJ6X4hDpVEsIn7diHUehmq1itjNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ZkRxrxZSNGuowkN4P769eI5gSRZrMFISAKsJx9k9slQ=; b=cO3vRcMa
        s3L8Bjhyk8eMNasE8zQcsyHrjeP2ZTbE2o3wo5k9HpkH4q2KDxWq2dcx4ylACzJP
        4UNtoedlFhCCdpCndNu/VOmr+6FkxUmXDtM0bFnTiMAYgepk5cnNdLduhURNF11P
        YAxEtLvg0IoTVQPNIbLjXuENdQNh5CvkzLP3WvvcudUDkdb/Y5s/hjenP2q6xrqV
        7EVfn+fzRQRBETYI2mmqhLWxCywhlVzcwBtUJlmx6OMgS31gVUgsB5jb6e969Upn
        glBnfDVJJ6k+UICOqVP7lOu8w8zpqB87mhN92CHvsQjZ5mx7KPtvDPkOVK21KP1I
        Qui73hm68dmXlQ==
X-ME-Sender: <xms:ajuxXvaG3u16RtYgSZVj7EYmoy4QSwxdJklqz1Nsk0PJxz4LL9RnRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeigddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeefnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ajuxXnusJuVCfT5YMomHO2hFabtOZf5u27yomLpVstiz8pfcaipwcw>
    <xmx:ajuxXp9bo0VzCtr4r3ByUnHKhrkNA67ehvGV2GAWgoKMAoi4Y5BnGQ>
    <xmx:ajuxXvU7ggdsEYp9GKR_mDEDOTITE5QsqilG5ZoFFC_RI94htSd6oA>
    <xmx:ajuxXvcDgSdce_cjKghqPHHNfpTt1vdtkOJPUEPeFTyAnLe7ZC1ElA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 060DC3065FD6;
        Tue,  5 May 2020 06:09:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 5/5] drm/sun4i: mixer: Call of_dma_configure if there's an IOMMU
Date:   Tue,  5 May 2020 12:09:34 +0200
Message-Id: <842e925855d32dc394ebe358b2678474eddd3f33.1588673353.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
References: <cover.70f96f9afd2e04161ebece593ae6cd7e17eca41b.1588673353.git-series.maxime@cerno.tech>
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
index 4a64f7ae437a..19b3b4184704 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -452,6 +452,19 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
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
