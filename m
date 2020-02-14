Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47027C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BC872168B
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 12:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="q7gl3hyD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wiCQvRzi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgBNMcu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 07:32:50 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34295 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgBNMcu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Feb 2020 07:32:50 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3490460DC;
        Fri, 14 Feb 2020 07:32:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 14 Feb 2020 07:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=l8eDDHNYcUg2vqAcfVnoMzWlXT
        5rDFAUpSbmbYQS3/Y=; b=q7gl3hyDPfv4sQi//Gm+Ml6FO8bhyR3GNEh7WiVISb
        SbVB6DhN3qalZYC5wcU7ph7/+PF5MiXbhfmRaoNp5iYgaphdWcSh1YyG1B8jbXmm
        JztJ0zS/9c4MKb5C/bfD/Rfv8acL4i+jMf/9yqG+9r57WiTWf054ox6ul2ErWAe7
        YZB8okJH6HFUqubaloTLrte0+vu1qwI5rMFjDNKBEzEtfvviglHjMjYOISLOW8bm
        wxHDLiXuw0uNYJyATOEMpkqX9lFnC8jmc666tbKITveR42x5rTPpElc9TS0TL1Bq
        o6IxPWx6fUUgsoZMbZegJfT64L7BeehNNrDPkfdUw4jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=l8eDDHNYcUg2vqAcf
        VnoMzWlXT5rDFAUpSbmbYQS3/Y=; b=wiCQvRziYW5SdgAKHR2T14J2bLJpYnQ2K
        85PDUHPxX0b6vlQ0prgHagQ3+ljh+I6Dubdy7a75eXNdIDAudUrk/yynyJw/3gqA
        ODBXMrUX7yFWiBub70o6I3f/8cpTJ0iPyBnljoP7yqKLhgH0ZAwn8XX1r9+97dCn
        JrQNEJQq2ATJJxiEgYcwJLzxES7l/frCtlP+Pd79F4rTTIE9x2XrgDlv9wjZSc5Y
        9b3C7ZACWfAO7WzR1U8oexueAx9k+G4kzfIaxBOKvzgpP+L7L0tTGS6NIlk5UFsN
        RiUmNaDESfIAZjEypQ91kFtiOuRm/By6o7e9L5PXxMGkTNjkjfK/A==
X-ME-Sender: <xms:b5NGXhWX3W3AAbQV8McMdGewxQy9sYVUFgWX5IIpD8CSTg8yg7W4Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedtgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
    ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrdekle
    drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b5NGXki6WnYOVVKbSUrCyeCStEIhBTixD4yTYqd2Wxt7QTwkwEFfSA>
    <xmx:b5NGXkIyfYWw1VqMCn774jPEIVrKdTEsQ9i-3vynQAZR34835F8W4g>
    <xmx:b5NGXucuKNKGrQUP4-lV08lyvklhLtrnOlBDkXhQmYT1RnIKp-mQ-g>
    <xmx:cZNGXoiTlcty2ifP9whSTomBfktvCQTMLQbDHaojQSVIfPaKu--bcg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 813DC3060C28;
        Fri, 14 Feb 2020 07:32:47 -0500 (EST)
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
Subject: [PATCH 1/2] dt-bindings: display: sun4i-tcon: Add LVDS Dual Link property
Date:   Fri, 14 Feb 2020 13:32:43 +0100
Message-Id: <20200214123244.109300-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

SoCs that have multiple TCONs can use the two set of pins on the first TCON
to drive a dual-link display. Add a property to enable the dual link.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 86ad617d2327..aa6dd8409dbc 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -105,6 +105,13 @@ properties:
         - const: edp
         - const: lvds
 
+  allwinner,lvds-dual-link:
+    type: boolean
+    description: |
+      On a SoC with two TCON with LVDS support, the first TCON can
+      operate over both pins sets to output in a dual-link setup. This
+      will be triggered by setting this property.
+
   ports:
     type: object
     description: |
-- 
2.24.1

