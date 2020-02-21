Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F12C35640
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 05:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F9DD222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 05:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NHBlsLvE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgBUFia (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 00:38:30 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36157 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbgBUFia (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 00:38:30 -0500
Received: by mail-pj1-f67.google.com with SMTP id gv17so240886pjb.1
        for <devicetree@vger.kernel.org>; Thu, 20 Feb 2020 21:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
        b=NHBlsLvEzhPsV9lVrqrxLfj46dzf+dfvYfal/9H20MGjw4nLWWSVa8v81TGtfCiHGG
         UNImlkJ6xyOWAA6l1H1xA2JqGLXbVDYYjArPqkFMKmwUZffHJaGPMeXaVTJX8lG24W7Z
         1BH97JwtFsJ//+S0hygIEpEECdThBP537UmUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CapMNX7pjr8MkESV5PbFvA3nh0aG4lhz0SRP146DeOk=;
        b=i3oGq6qQtM1TuQo1zTcMQ4xy1N7OegbCC1VJFcOgOGp+IYRbkTT8aThCANLigHAnHF
         Cy4ewOa1k867NccZkoL4s05tnn6KgOzQXUbWJ9iIOfkBKAjZlYIzbj+v1PvT3QH5Y9l9
         CQ2mZb36P0o6ERyEs9mUqLyr/dRzJnZRRiPzVJ0+qcu5BhN4aZ+EDtAxkpB7i7FoL10/
         qtiIp8t1E/uuzrHgjP+BARsQq4FWMzd90ew+1/BFI9KVPtCzTxnoSEH27VrmhSKdMT6q
         MlP6GWy43qf2LrVUOdY9RDBPUEfF5uE+RuW9H5Zq7rokg+Pe5dwzq+BMVtpSw9LDDCfw
         EcKQ==
X-Gm-Message-State: APjAAAWiWBhE5wy6L5NfV/PvGLUh4R5VtDz/B6bIozTd3s6RBdr9G+nL
        JIgYQ85jHur11XEEuefOvhLxlQ==
X-Google-Smtp-Source: APXvYqz+fNCi7RyQICRTNgU9IYDRlA2CBQL0xzTHdNzESzxk/Lp56MofgOU6MTmKnMrgVqSEjK8ojg==
X-Received: by 2002:a17:90a:804a:: with SMTP id e10mr1046782pjw.41.1582263510005;
        Thu, 20 Feb 2020 21:38:30 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
        by smtp.gmail.com with ESMTPSA id m12sm1324157pfh.37.2020.02.20.21.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 21:38:29 -0800 (PST)
From:   Evan Benn <evanbenn@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     jwerner@chromium.org, Evan Benn <evanbenn@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Add mt8173,smc-wdt watchdog
Date:   Fri, 21 Feb 2020 16:38:01 +1100
Message-Id: <20200221163717.v2.1.I02ebc5b8743b1a71e0e15f68ea77e506d4e6f840@changeid>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200221053802.70716-1-evanbenn@chromium.org>
References: <20200221053802.70716-1-evanbenn@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This watchdog can be used on ARM systems with a Secure
Monitor firmware to forward watchdog operations to
firmware via a Secure Monitor Call.

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

Changes in v2:
- Change name arm > mt8173

 .../bindings/watchdog/mt8173,smc-wdt.yaml     | 30 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
new file mode 100644
index 0000000000000..ff45e13bc548b
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/mt8173,smc-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Secure Monitor Call based watchdog
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Julius Werner <jwerner@chromium.org>
+
+properties:
+  compatible:
+    enum:
+      - mt8173,smc-wdt
+
+required:
+  - compatible
+
+examples:
+  - |
+    watchdog {
+      compatible = "mt8173,smc-wdt";
+      timeout-sec = <15>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e48ab79879ace..59e8779363c12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1421,6 +1421,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 F:	drivers/irqchip/irq-al-fic.c
 
+ARM SMC WATCHDOG DRIVER
+M:	Julius Werner <jwerner@chromium.org>
+R:	Evan Benn <evanbenn@chromium.org>
+S:	Maintained
+F:	devicetree/bindings/watchdog/mt8173,smc-wdt.yaml
+
 ARM SMMU DRIVERS
 M:	Will Deacon <will@kernel.org>
 R:	Robin Murphy <robin.murphy@arm.com>
-- 
2.25.0.265.gbab2e86ba0-goog

