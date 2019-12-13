Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968D9C3434E
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D32792476A
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbfLMSLC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 13:11:02 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:35121 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728599AbfLMSLC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 13:11:02 -0500
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 054D4200004;
        Fri, 13 Dec 2019 18:10:58 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandy Huang <hjc@rock-chips.com>
Cc:     <linux-arm-kernel@lists.infradead.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 02/12] dt-bindings: display: rockchip-lvds: Document PX30 PHY
Date:   Fri, 13 Dec 2019 19:10:41 +0100
Message-Id: <20191213181051.25983-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213181051.25983-1-miquel.raynal@bootlin.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PX30 SoCs use a single PHY shared by two display pipelines: MIPI DSI
and LVDS. In the case of the LVDS IP, document the possibility to fill
a PHY handle.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/display/rockchip/rockchip-lvds.txt     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
index aa5663a6fd42..ec7b4341cfd2 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
@@ -19,6 +19,9 @@ Required properties:
 - rockchip,grf: phandle to the general register files syscon
 - rockchip,output: "rgb", "lvds" or "duallvds", This describes the output interface
 
+- phys: LVDS/DSI DPHY (px30 only)
+- phy-names: name of the PHY, should be "dphy"
+
 Optional properties:
 - pinctrl-names: must contain a "lcdc" entry.
 - pinctrl-0: pin control group to be used for this controller.
-- 
2.20.1

