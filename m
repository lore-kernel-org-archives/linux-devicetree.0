Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101C8C10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 23:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D934E206F1
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 23:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K9s8lX3R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgCLXA4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 19:00:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44981 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgCLXAz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 19:00:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id b72so3995635pfb.11
        for <devicetree@vger.kernel.org>; Thu, 12 Mar 2020 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E2w4krPueMxqp9WVS9Bmgwu1G7qbURrhskFPuQKI+Qo=;
        b=K9s8lX3R4NqWossEJOjJWwu/JM7uZF1naZX2PQufa2n2iWi7VoDsE9U8k7hfptxu7q
         +nyzufYmjai4EHCz2RfheTbGC60BwxhaUn0QgfLynsXUke5brG+x377NLqXMkD7h3gO5
         s8LQgWmT4DE50aeE9ZQ7seYGlDtFslELj9x/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E2w4krPueMxqp9WVS9Bmgwu1G7qbURrhskFPuQKI+Qo=;
        b=nfovmDQ9vYgrhGtAZ23LXxfiG4hKy02erXMPI9mPEyeDWL15uynZPudIWzVwgkw68L
         ySsI+MWF5TCqnmNXByjhAXU6aQdrlnT5E3uW5XWTCMBzzx/vfRVnwtBfH9PlYVzFB2XZ
         XjnyItWro9sULiCgI1KQaozyqYcBOJiXGfzzTdzzeQLRl61he7za5gNIetgH8HeXkVS8
         2EnVlE+pRb617JdjRgH3SvcHy0GdnoWPrEq16TJb3BkuytHHFvdbS9h8aQo5L8I12Gjl
         lOTc9M5+MZ5anaPmU8vyPsNXAFg73m3rdyfhQfoP0QV+J3SiXoAdWGBPmGZjLbkXFP5L
         UpWw==
X-Gm-Message-State: ANhLgQ1x/TXZYMEIZ5Lwtg+vhhoX2N8E03oKiJ5lZi0RPN2sCdOVDPNS
        4d1d/3EWzIBSOUDnRGDy5LpSgA==
X-Google-Smtp-Source: ADFU+vsaPrcs+BYX+Cp/Tzk02V6462j0n6ituvkhwldXYQr/3fKwRO3t368uirahQISKrE9SEcKyTQ==
X-Received: by 2002:a62:7c82:: with SMTP id x124mr2305488pfc.280.1584054054878;
        Thu, 12 Mar 2020 16:00:54 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id v123sm28763161pfb.85.2020.03.12.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 16:00:54 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: Add cros-ec Type C port driver
Date:   Thu, 12 Mar 2020 15:57:12 -0700
Message-Id: <20200312225719.14753-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200312225719.14753-1-pmalani@chromium.org>
References: <20200312225719.14753-1-pmalani@chromium.org>
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

Changes in v4:
- Rebased on top of usb-connector.yaml file, so the “connector” property
  now directly references the “usb-connector” DT binding.

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

 .../bindings/chrome/google,cros-ec-typec.yaml | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
new file mode 100644
index 0000000000000..6668d678dbcb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -0,0 +1,48 @@
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
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+
+examples:
+  - |+
+    cros_ec: ec {
+      compatible = "google,cros-ec-spi";
+
+      typec {
+        compatible = "google,cros-ec-typec";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          power-role = "dual";
+          data-role = "dual";
+          try-power-role = "source";
+        };
+      };
+    };
-- 
2.25.1.481.gfbce0eb801-goog

