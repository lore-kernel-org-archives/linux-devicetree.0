Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEE1C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 11F6822314
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="Rj3Vaeua";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xct+q5D+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgBNMYq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:24:46 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53557 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727970AbgBNMYq (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:24:46 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D95287177;
        Fri, 14 Feb 2020 07:24:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=dnk7pJKP+HgrN
        4lk8DCUSISIcaYg2wPtGi46T6k0vVo=; b=Rj3VaeuanI9A6ew5xyhcXLuCAkzMo
        FOy5E4ddX5rzZlhz0YWun3R0J+lOC37ZCT3S/+xMT1wHhHy/LOzkImg+zj/o/gam
        7fPo3Es5jEb8MG9Bg062foRqpnyADxRuiSsXXnnyoP0aDbzUqyRoCheR9KziYZgd
        YZoNXJWBu1wElllTXhzPoqKHyIvfUSoag7Q/wKszDT6A/oUf3XyyABiWIIb7dYxI
        fIhoQQaPtfguX6oExT5Gxek0OXx9hRSXg7bsX0XYtL0heuwDN83e45JVAqaibZxh
        zGh0uzAdVnZLBXw+IgGdbs+9QhKtorFSITMP4paF3sTrkANpXzrLWbZtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=dnk7pJKP+HgrN4lk8DCUSISIcaYg2wPtGi46T6k0vVo=; b=xct+q5D+
        b/EK9Seh9XoyEIz37AF7H+iIcE706DypIxNIdMMsHHHAfkZxngw3N9KewiXEt8jq
        z24XBahyMUPsUN6xnu/mOtrfL3EoJ+Yh6vCZfrQ2C6zAZg0c9uM3tr3gL3fC9SUh
        g023XieIOJXAzvHB92YtEOdiY3Vw2L8osfk9tdM29ZRjuIaXnfSjHCDBEQL7TsqH
        MuJkMpGRwS9W8KGAiAK5L9WqsEb1o+3CEzs1QOw9lqC89WUeJS7nHPoLxJ6CmVwF
        eBsXLC6qTo5gYgsyYN7UxNbs8dgyxjt3yxTMsiuLSE1QSMJoUp1XmsLGBro0kYOB
        GFz5O6hTLS6DGQ==
X-ME-Sender: <xms:jZFGXluHHAzYjJjeDMISw98VLqQK6ClyYSod5rhH3vBJgji5YRKSXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:jZFGXl6xe7gyLTm32in7QXtbqwh59mPfMmTXZOIDrgsIwK_InbjNkA>
    <xmx:jZFGXmRNsEFLqLSEdDJW_GBDQx9k3ta1OOqH6thD8LcecSp4Cau0PQ>
    <xmx:jZFGXnvez563NQKQmBwfIRcgI5ADjTRjOGfeQIJOE_0f5Yu6xOqjEQ>
    <xmx:jZFGXjAB30wWtLToJkzgVrtwD_Pa2xUf1-Il_airvLycM-VjrqK82w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 70B13328005A;
        Fri, 14 Feb 2020 07:24:45 -0500 (EST)
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
Subject: [PATCH 1/4] drm/connector: Add data polarity flags
Date:   Fri, 14 Feb 2020 13:24:38 +0100
Message-Id: <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some LVDS encoders can change the polarity of the data signals being
sent. Add a DRM bus flag to reflect this.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_connector.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 221910948b37..9a08fe6ab7c2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -330,6 +330,8 @@ enum drm_panel_orientation {
  *					edge of the pixel clock
  * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
  *					(SPL, CLS, PS, REV) must be used
+ * @DRM_BUS_FLAG_DATA_LOW:		The Data signals are active low
+ * @DRM_BUS_FLAG_DATA_HIGH:		The Data signals are active high
  */
 enum drm_bus_flags {
 	DRM_BUS_FLAG_DE_LOW = BIT(0),
@@ -349,6 +351,8 @@ enum drm_bus_flags {
 	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
 	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
 	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
+	DRM_BUS_FLAG_DATA_LOW = BIT(9),
+	DRM_BUS_FLAG_DATA_HIGH = BIT(10),
 };
 
 /**
-- 
git-series 0.9.1
