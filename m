Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B28C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A8EC22314
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="ht49Dt1Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="slO2uGFs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729032AbgBNMYf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:24:35 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50289 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728223AbgBNMYf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:24:35 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D0FE03AF4;
        Fri, 14 Feb 2020 07:24:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=2f3VFRjW3B+zONorxo3OTyEyy8
        z5poB18m7XL4T/tlo=; b=ht49Dt1YpFBVR6qEV2lxiV0ZvCn9WXy/XSB8C8v3fj
        kizud/Z8YazI0LislRtAooDuAFtWqfMn3H5bQXX3bOsar0HU9QtKHV1OMT6kehMd
        zohdoS7aoBv9Pbto230VOwh6pXVnW/5wKnD2wX5S9+y5PvdJwRHgiE6oITiBR/TE
        vBtunnRT/VIegClqgGZ6BhfpMXcOUrlLJ64stOMcbBVi0EFoOo1njeAsppHWcnqi
        hBMWItowQPNvNtyLip0w8/ZTV695vthkeKZ3uiChDns/yn8KN58BgyRsWSguGYia
        1mfLYVYf20WD+j9mwr4ky37YVay09s+UN5YX391l8H8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2f3VFRjW3B+zONorx
        o3OTyEyy8z5poB18m7XL4T/tlo=; b=slO2uGFs4EkJN83M7x4pGERBGwNqyEh+1
        hXlAl8ZidI1J7pJ9ADDMySyfsWF2gTDxvXyFslTgoZCCGPcgrXG6foU6y9E3cGJW
        ZVjID9oIttD3FWgdoopxk8y4VSy63jKGCevrFiKvcJ0q6maM9xWvCD8oG6NwW9jj
        T7VOBfCq4hJhGiCV1FEN9HPLihIi9VnaVaVxk/qG9kDzdONCaOvH6SdLxwCWqs4q
        xYUlBc1PwIpsPFaSFvuGoYJ7U1OJN/D4hy5vT6MdtKSvjCH2YNcJLPezahPb7eY7
        DMqaRMv7ObsHsFGoLTsnQEWULJ6A9HTEEHLnDs3WEsaQN3YuSaemQ==
X-ME-Sender: <xms:fZFGXgNYKVkylRZpKb5k6Y9PPhxkoo43yJOAQM4IJ8lNyf7SiPOAYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fZFGXl4wnGzixgpbuwFprXm49iPzt5bjM5iFa3k3cTs3G_nx6ux6BQ>
    <xmx:fZFGXjV_R-Crz4VvDURlqG-OSApRvbsyj91j9KR6WgTyXv0248iVPg>
    <xmx:fZFGXsM3elag3TffXXGnSkZ1MbVzHukdPq2jivJLhmd6-4D3dAAjvQ>
    <xmx:f5FGXkLQNIDHojlcgi4bI8K3by7TVKbddCulJhR0ORtoNV6BteBWSQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E495A3280062;
        Fri, 14 Feb 2020 07:24:28 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Date:   Fri, 14 Feb 2020 13:24:27 +0100
Message-Id: <20200214122427.108675-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The A33 TCON supports LVDS, so we can toggle the support switch.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index fdf143042f83..14026b4fa7c7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1475,6 +1475,7 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	.has_channel_0		= true,
 	.has_lvds_alt		= true,
 	.dclk_min_div		= 1,
+	.supports_lvds		= true,
 };
 
 static const struct sun4i_tcon_quirks sun8i_a83t_lcd_quirks = {
-- 
2.24.1

