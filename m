Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48556C433E4
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27B4D20829
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 01:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HKwLJeZI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgHMB3h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 21:29:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57534 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHMB3h (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 21:29:37 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54B25DC4;
        Thu, 13 Aug 2020 03:29:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597282172;
        bh=aP00vh/Yl0i46i+VQZNlATPsa2UNz+xKT3vkI5WjEiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HKwLJeZIGRPguSDljWf9XzttWn3Kka+NPkLZ0D6ruk5HH8OBasE+ceNmGI1sUgc6U
         eO0et182qbs7sn8BTKqDc+3jaFffHaS1qk/HbFmWUMHrb/DVy0Sf4TgupyFfyZA9OY
         4zOyt3J3DE1YYqR8vfUeX2ZjgQcFBVK+E8bu8asw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Subject: [PATCH 3/8] dt-bindings: display: mxsfb: Add a bus-width endpoint property
Date:   Thu, 13 Aug 2020 04:29:05 +0300
Message-Id: <20200813012910.13576-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
References: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

When the PCB routes the display data signals in an unconventional way,
the output bus width may differ from the bus width of the connected
panel or encoder. For instance, when a 18-bit RGB panel has its R[5:0],
G[5:0] and B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10]
and LCD_DATA[23:18], the output bus width is 24 instead of 18 when the
signals are routed to LCD_DATA[5:0], LCD_DATA[11:6] and LCD_DATA[17:12].

Add a bus-width property to describe this data routing.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/mxsfb.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mxsfb.yaml b/Documentation/devicetree/bindings/display/mxsfb.yaml
index ec6533b1d4a3..d15bb8edc29f 100644
--- a/Documentation/devicetree/bindings/display/mxsfb.yaml
+++ b/Documentation/devicetree/bindings/display/mxsfb.yaml
@@ -58,6 +58,18 @@ properties:
         type: object
 
         properties:
+          data-shift:
+            enum: [16, 18, 24]
+            description: |
+              The output bus width. This value overrides the configuration
+              derived from the connected device (encoder or panel). It should
+              only be specified when PCB routing of the data signals require a
+              different bus width on the LCDIF and the connected device. For
+              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
+              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
+              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
+              LCD_DATA[17:12], bus-width should be set to 24.
+
           remote-endpoint:
             $ref: /schemas/types.yaml#/definitions/phandle
 
-- 
Regards,

Laurent Pinchart

