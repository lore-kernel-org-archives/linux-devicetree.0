Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DBAC35247
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 02:20:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C0A820720
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 02:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgA0CUf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Jan 2020 21:20:35 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:58556 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgA0CUf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Jan 2020 21:20:35 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 485YPY3pw9z1qqlB;
        Mon, 27 Jan 2020 03:20:33 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 485YPY3N6Lz1qwXd;
        Mon, 27 Jan 2020 03:20:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id PW3gTicwPtcf; Mon, 27 Jan 2020 03:20:32 +0100 (CET)
X-Auth-Info: xzYvJNuWmKe4Het0iJHLWjiEDyhDjKIpikfMwvn4dEw=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 27 Jan 2020 03:20:32 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>, Sean Cross <xobs@kosagi.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: it6251: add bindings for IT6251 LVDS-to-eDP bridge
Date:   Mon, 27 Jan 2020 03:20:22 +0100
Message-Id: <20200127022023.379080-2-marex@denx.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127022023.379080-1-marex@denx.de>
References: <20200127022023.379080-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sean Cross <xobs@kosagi.com>
Cc: devicetree@vger.kernel.org
To: dri-devel@lists.freedesktop.org
---
 .../bindings/display/bridge/ite,it6251.txt    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
new file mode 100644
index 000000000000..c5db82cfe8ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
@@ -0,0 +1,35 @@
+ITE IT6251 LVDS-to-eDP bridge bindings
+
+Required properties:
+- compatible:		Should be "ite,it6251"
+- reg:			i2c address of the bridge, i2c address of the LVDS part
+- reg-names:		Should be "bridge", "lvds"
+- power-supply:		Regulator to provide the supply voltage
+- video interfaces:	Device node can contain video interface port nodes
+			for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	it6251@5c {
+		compatible = "ite,it6251";
+		reg = <0x5c>, <0x5e>;
+		reg-names = "bridge", "lvds";
+		power-supply = <&reg_display>;
+
+		ports {
+			port@0 {
+				bridge_out_edp0: endpoint {
+					remote-endpoint = <&panel_in_edp0>;
+				};
+			};
+
+			port@1 {
+				bridge_in_lvds0: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+
-- 
2.24.1

