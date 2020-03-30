Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7827AC2D0EF
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 16:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4ED6B2073B
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 16:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="wlXWQ6ph"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbgC3Qpt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 12:45:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37891 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbgC3Qps (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 12:45:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id f6so16154217wmj.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mVWLIOr3nu4VRkeATbgbJ5KeY5vKIQwBYj+MAP3b5JU=;
        b=wlXWQ6ph9cl7WGo45IOnoAIi3e/MSO9oLEoRA1ui6cYxiDHYf3FsXYm9gEZbPt6PzN
         YJ2XdwUIJiJf/rcVUy2rtZ9s9ehdlTf2/Y/Nte8aPxixNX4erKQLqbKHbLZrDUXSfFpe
         ceHYovcbz6AcVFNxox7oRVx/1iokPAQ4+k2uSEq3hq3IcEMnbTwHizwipjWU+Tf6omh+
         06ARQQqKCt8KkfGSuXCSokuC3w187wFjsld78q392U4Uj2HewFETdSuVawUQYigPj1qf
         PAd3edOz0rg8d8o3w62Gui1Xom/pIRAvJf2XZTXvxtHrrP41BQrEYDt5mOdytNz80yYa
         5fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mVWLIOr3nu4VRkeATbgbJ5KeY5vKIQwBYj+MAP3b5JU=;
        b=lFe/0kp6a35OQ5E4Ms6d5klCQnL5TmpB/JiA7uMzr7+LtcLSNEfe55enxwhbnt+4HO
         1zZj+b+lPrdMVwTQHOZPBswhjsfSMsZ4R8a4B3gupoDRh3IMcM9gszS/QHSU3nj8xyWF
         IleLrSP5ZKalXDIOe3Yj5+zYp+NjaMV4rY26z+IT4oztbJcfCcojhi5wyK4cSkLjoB1d
         6Ozww+v6LYDv2lWykG0HeLfxj62S/9viSj4RmwFCBNSQpJ37f63anex47MP9odCikEaD
         uMfPyr6iA6J3OGKNhc/7WRvE4I6w9ybAbc9vpXUSHHbJUuxwVmQBnQkb7grR46Puhv6/
         k6Hg==
X-Gm-Message-State: ANhLgQ0+ClsD0+hxOqu58H93qmrPd8z0QerVNib5mOtq4XwkZ6VgbAnm
        uz+16judjjGuXO4E46T9URwH5A==
X-Google-Smtp-Source: ADFU+vuVTlTSvqv6rHsE7jknCgVQJpj+jErMpQqAWXfcsze5yFyK8CxqxzsEo3dbRwx9EYW1+2X0Yw==
X-Received: by 2002:a7b:c343:: with SMTP id l3mr214394wmj.38.1585586745976;
        Mon, 30 Mar 2020 09:45:45 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-177.xnet.hr. [88.207.96.177])
        by smtp.googlemail.com with ESMTPSA id h2sm146711wmb.16.2020.03.30.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 09:45:45 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v5 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon, 30 Mar 2020 18:43:29 +0200
Message-Id: <20200330164328.2944505-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330164328.2944505-1-robert.marko@sartura.hr>
References: <20200330164328.2944505-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds the binding documentation for the HS/SS USB PHY found
inside Qualcom Dakota SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v4 to v5:
* Replace tabs with whitespaces
* Add maintainer property

 .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
new file mode 100644
index 000000000000..4a6b5aa83925
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcom IPQ40xx Dakota HS/SS USB PHY
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ss-ipq4019-phy
+      - qcom,usb-hs-ipq4019-phy
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: por_rst
+      - const: srif_rst
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+examples:
+  - |
+    hsphy@a8000 {
+     compatible = "qcom,usb-hs-ipq4019-phy";
+     phy-cells = <0>;
+     reg = <0xa8000 0x40>;
+     resets = <&gcc USB2_HSPHY_POR_ARES>,
+       <&gcc USB2_HSPHY_S_ARES>;
+     reset-names = "por_rst", "srif_rst";
+    };
-- 
2.26.0

