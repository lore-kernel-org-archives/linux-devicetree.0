Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76020C3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CDF72168B
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="CHTH14YK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2xxLZeRt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgBNMcu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:32:50 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41115 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728336AbgBNMcu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:32:50 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4C38D6107;
        Fri, 14 Feb 2020 07:32:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=a91FR2Cpmv6xb
        sO27omkaVt7g4YCf2kEALjXSevqod4=; b=CHTH14YKgU8rFPIzXMeR7b2/XBRgy
        5zGD8ifWWjOXfquUrz4uVcsbc9T2wbK5szF8R8QcWDsK4L62VeGpqcmkb6QlAMkU
        FF22u76R6E8sAjxCVVQdUdReAAL2lfZJKoRbeGFjeekeGBcbTid3bCEgUJn8DkUF
        KoRBneSUXQyzBOm1WcaiCgnLVmkKZ8TTl9IHHNcxvJxlHhFUfdN8RMktttFfArux
        GiOUtxT+EOOF7luGMe+N6M7NrUv9nOsWL3wYSRfAUrPS8aY5Zg0xR4NSPkCGlkqA
        DaXPeEt/u1KKpAnFN2N0Dc/DsZjDHc4VZvmun3E3kvADtPi8LhvbNxUsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=a91FR2Cpmv6xbsO27omkaVt7g4YCf2kEALjXSevqod4=; b=2xxLZeRt
        zC1bobYhWc2taTidhWj0KaX6bdrH5wdNGYU7Kpt0r6w2QEC8DQJp5i+U7NaUd4d0
        JK8QHR7tpPTZbEv8n1nrBMf9uB9DCP9V1jIhhFGciQmfUrV3Vxkz9CUzP7lUGkKf
        a0kuHfoyEyem/wA6n+CoQLwynicwMcbviir04uPZ1GN9qfzzvv7ZD0t8Z/p0P9GN
        vKhzBoap/FdGCFPhURgzh7CrHKBxgnI58HPTgDIzvbBHsxaBL2yRS2Rc3/wwTBnV
        E6tmCC80hDwMtAFGV+yvjVaaV31+C274tfEXw1kHMqMllyIGjWtyE49eD76io9Vo
        kK6IkGTsGvCzqQ==
X-ME-Sender: <xms:cZNGXg5s4RRLWKYBiRztMi-5pTngh3RU97yu8mtidMDY8_V_V8zhkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cZNGXsXkN1-7Vqvrv2awEL6i_MmHSpjq_jxco7Ps84uifL0blvrgWQ>
    <xmx:cZNGXv6TGp-juVwIL_-vk6uX1mUzL89eruQyTsMkE31doh7n2Oyt4g>
    <xmx:cZNGXnXxt4WMz7bVWPdgUh-xuOncbfoBMMKaEcpDfwJYEl2vaJzd1A>
    <xmx:cZNGXiImITWdYMi9dGkLHzTn7LC8nKj2b4xhYCviE9ggbwqIhsgRaQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E0DE5328005A;
        Fri, 14 Feb 2020 07:32:48 -0500 (EST)
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
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] drm/sun4i: tcon: Support LVDS dual-link
Date:   Fri, 14 Feb 2020 13:32:44 +0100
Message-Id: <20200214123244.109300-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214123244.109300-1-maxime@cerno.tech>
References: <20200214123244.109300-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some LVDS encoders in the Allwinner SoCs can output on a dual-link. Let's
add a DT property to toggle it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 6 ++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index e616cc901b4e..ed1f09e52ef3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -488,6 +488,9 @@ static void sun4i_tcon0_mode_set_lvds(struct sun4i_tcon *tcon,
 	else
 		reg |= SUN4I_TCON0_LVDS_IF_DATA_POL_NORMAL;
 
+	if (tcon->lvds_dual_link)
+		reg |= SUN4I_TCON0_LVDS_IF_DUAL_LINK;
+
 	if (sun4i_tcon_get_pixel_depth(encoder) == 24)
 		reg |= SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS;
 	else
@@ -1219,6 +1222,9 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		} else {
 			can_lvds = true;
 		}
+
+		tcon->lvds_dual_link = of_property_read_bool(dev->of_node,
+							     "allwinner,lvds-dual-link");
 	} else {
 		can_lvds = false;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
index d36c304b1607..2a57d24e2772 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
@@ -98,6 +98,7 @@
 
 #define SUN4I_TCON0_LVDS_IF_REG			0x84
 #define SUN4I_TCON0_LVDS_IF_EN				BIT(31)
+#define SUN4I_TCON0_LVDS_IF_DUAL_LINK			BIT(30)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_MASK		BIT(26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_18BITS		(1 << 26)
 #define SUN4I_TCON0_LVDS_IF_BITWIDTH_24BITS		(0 << 26)
@@ -263,6 +264,9 @@ struct sun4i_tcon {
 	/* Associated crtc */
 	struct sun4i_crtc		*crtc;
 
+	/* Is the LVDS link a dual-channel link? */
+	bool				lvds_dual_link;
+
 	int				id;
 
 	/* TCON list management */
-- 
2.24.1

