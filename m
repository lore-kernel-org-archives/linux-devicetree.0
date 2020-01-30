Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB37C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 17:27:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ED4A20674
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 17:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="CqOopzMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgA3R1X (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 12:27:23 -0500
Received: from mxa2.seznam.cz ([77.75.76.90]:51316 "EHLO mxa2.seznam.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727489AbgA3R1X (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 12:27:23 -0500
Received: from email.seznam.cz
        by email-smtpc15a.ng.seznam.cz (email-smtpc15a.ng.seznam.cz [10.23.11.195])
        id 58bdb51903b3e17059147947;
        Thu, 30 Jan 2020 18:27:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1580405239; bh=2nleulkEI2ScTi+li6MZ2I7MWAzQbblG7BXMZTMIK2U=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=CqOopzMB/tz6VOWOZXJ959NdDbkx3Y96wOKDETJP05KJaT+AQVTYT63WKC0X0VC4b
         pxuZlwovxtnJSFthfXaTen3Bh2Hc3ApvnJpPDO3eT+FSi378lbPJgpH80fzwbXO8kD
         ixb4Mc7t/yZMoP4Zb9MPuGY2TPXX0dq9voVWD9S8=
Received: from localhost.localdomain (212.69.128.228 [212.69.128.228])
        by email-relay12.ng.seznam.cz (Seznam SMTPD 1.3.108) with ESMTP;
        Thu, 30 Jan 2020 18:14:12 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v2 1/2] dt-bindings: display/panel: add bindings for S6E88A0-AMS452EF01
Date:   Thu, 30 Jan 2020 18:11:27 +0100
Message-Id: <20200130171128.29251-1-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds dts bindings for Samsung AMS452EF01 AMOLED panel, which makes
use of their S6E88A0 controller.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
Hi,
Thanks for the review. I believe I've fixed everything, and I tested that 
I get image on drm-next with these patches applied.

Changes since v1: use yaml format for the binding
---
 .../panel/samsung,s6e88a0-ams452ef01.yaml     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
new file mode 100644
index 000000000000..3d9b480ec706
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams452ef01.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,acx424akp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMS452EF01 AMOLED panel with S6E88A0 video mode DSI controller
+
+maintainers:
+  - Michael Srba <Michael.Srba@seznam.cz>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e88a0-ams452ef01
+  reg: true
+  reset-gpios: true
+  vdd3-supply:
+     description: core voltage supply
+  vci-supply:
+     description: voltage supply for analog circuits
+  enforce-video-mode: true
+
+required:
+  - compatible
+  - reg
+  - vdd3-supply
+  - vci-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel@0 {
+		reg = <0>;
+
+		compatible = "samsung,s6e88a0-ams452ef01";
+
+		vdd3-supply = <&pm8916_l17>;
+		vci-supply = <&reg_vlcd_vci>;
+		reset-gpios = <&msmgpio 25 GPIO_ACTIVE_HIGH>;
+	};
+
+...
-- 
2.24.0

