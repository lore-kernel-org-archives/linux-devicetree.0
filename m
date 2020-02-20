Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7077EC5ACC4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 00:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A289208C4
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 00:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MsiQ46r/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgBTAcy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 19:32:54 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40017 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgBTAcy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 19:32:54 -0500
Received: by mail-pg1-f194.google.com with SMTP id z7so976597pgk.7
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 16:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RPKl8ed3MCwjZdihNPRiM8dZ6C1II4prnCPIp0h4Mo=;
        b=MsiQ46r/7p5OvbwLm7pbqAzcrVrKwGjW0tUxBA3VYdta9MNi2emShRDqrqVFdAcide
         TLRfYTl6dX1D6wKZAv6qdKKRfHmR24qmD4PhgaRMc0AlRTJVHc9r/WFWB3+eKDvOOr+4
         CbzNCQV5ULpzumRHUQuLY1kFg+HXsqUMUC9d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RPKl8ed3MCwjZdihNPRiM8dZ6C1II4prnCPIp0h4Mo=;
        b=i8eBwPWoIt0hJBPhHw4b8sQc/dZ5AxGjQjrdEB4OR0OR+VJ/UXP68Q+TstMsrWqlPa
         D0I+mlAvY2LffTdO/IvoAkPpv/jfCxXNcIhoG5iidM2vnO5NNYL4ib2/6XCFMhDZsS5r
         AJttSjhtnee56x8wq9rUpQB1KHiizt8JgG73QYarOpFw/d+Wx67GAvQlQMdxk/tVmtxF
         OPxVQZi1zHYuk9vRuFKBNTU3m9qN1s6yZCCPcnZyre4c1G8a7k1Ykp4SyW3oEqug9x2P
         5FeEw2Wag6OieljvwGnjzzORmTvL8Ql17rOrOyEXm2wqpj6wL8K014wMudY4dHI+A9t7
         iCfQ==
X-Gm-Message-State: APjAAAW1/AA0cFIU8b3opLmZVxQ/PtHMfkkEjtLsm5P2hRfsUasnxluQ
        WYShJiEN2UtLE7G5vU5UB5F/Cw==
X-Google-Smtp-Source: APXvYqypRCDxLPspFua+8MzfNLS/cyOboQS5/6cF0A+lBgATOSzAoo4nqNRrNNqbFaZVGOK7UC5LnQ==
X-Received: by 2002:a63:5848:: with SMTP id i8mr29689533pgm.438.1582158773666;
        Wed, 19 Feb 2020 16:32:53 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id d69sm815370pfd.72.2020.02.19.16.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:32:53 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@intel.com, enric.balletbo@collabora.com,
        bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: Add cros-ec Type C port driver
Date:   Wed, 19 Feb 2020 16:30:55 -0800
Message-Id: <20200220003102.204480-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200220003102.204480-1-pmalani@chromium.org>
References: <20200220003102.204480-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some Chrome OS devices with Embedded Controllers (EC) can read and
modify Type C port state.

Add an entry in the DT Bindings documentation that lists out the logical
device and describes the relevant port information, to be used by the
corresponding driver.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v3:
- Fixed license identifier.
- Renamed "port" to "connector".
- Made "connector" be a "usb-c-connector" compatible property.
- Updated port-number description to explain min and max values,
  and removed $ref which was causing dt_binding_check errors.
- Fixed power-role, data-role and try-power-role details to make
  dt_binding_check pass.
- Fixed example to include parent EC SPI DT Node.

Changes in v2:
- No changes. Patch first introduced in v2 of series.

 .../bindings/chrome/google,cros-ec-typec.yaml | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
new file mode 100644
index 00000000000000..97fd982612f120
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chrome OS EC(Embedded Controller) Type C port driver.
+
+maintainers:
+  - Benson Leung <bleung@chromium.org>
+  - Prashant Malani <pmalani@chromium.org>
+
+description:
+  Chrome OS devices have an Embedded Controller(EC) which has access to
+  Type C port state. This node is intended to allow the host to read and
+  control the Type C ports. The node for this device should be under a
+  cros-ec node like google,cros-ec-spi.
+
+properties:
+  compatible:
+    const: google,cros-ec-typec
+
+  connector:
+    description: A node that represents a physical Type C connector port
+      on the device.
+    type: object
+    properties:
+      compatible:
+        const: usb-c-connector
+      port-number:
+        description: The number used by the Chrome OS EC to identify
+          this type C port. Valid values are 0 - (EC_USB_PD_MAX_PORTS - 1).
+      power-role:
+        description: Determines the power role that the Type C port will
+          adopt.
+        maxItems: 1
+        contains:
+          enum:
+            - sink
+            - source
+            - dual
+      data-role:
+        description: Determines the data role that the Type C port will
+          adopt.
+        maxItems: 1
+        contains:
+          enum:
+            - host
+            - device
+            - dual
+      try-power-role:
+        description: Determines the preferred power role of the Type C port.
+        maxItems: 1
+        contains:
+          enum:
+            - sink
+            - source
+            - dual
+
+    required:
+      - port-number
+      - power-role
+      - data-role
+      - try-power-role
+
+required:
+  - compatible
+  - connector
+
+examples:
+  - |+
+    cros_ec: ec@0 {
+      compatible = "google,cros-ec-spi";
+
+      typec {
+        compatible = "google,cros-ec-typec";
+
+        usb_con: connector {
+          compatible = "usb-c-connector";
+          port-number = <0>;
+          power-role = "dual";
+          data-role = "dual";
+          try-power-role = "source";
+        };
+      };
+    };
-- 
2.25.0.265.gbab2e86ba0-goog

