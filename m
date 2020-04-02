Return-Path: <SRS0=tl9x=5S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3032C2BA18
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87A652077D
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Apr 2020 23:02:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QomA5Njt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389821AbgDBXCG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Apr 2020 19:02:06 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:39060 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389366AbgDBXCG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Apr 2020 19:02:06 -0400
Received: by mail-il1-f194.google.com with SMTP id r5so5405994ilq.6
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2020 16:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8h9TNvv6CZ2PKXPL953qS4ZWG+3/jrimtqMPT6Mv1pU=;
        b=QomA5NjtFvJQErByC8wHcdpBoa4FleTSJNfY747f268VshMlihtHC6OviHbjhlZBM6
         yc3Nxmlb3GRhGQ5nmF22Xfy46volL/Us88RKVifpWoYcayJ1q5Hd4XZyOeh8E8knn4u9
         g2KKzgTI5UZAYJxVUTae7wN3FCUs8sT3zy3k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8h9TNvv6CZ2PKXPL953qS4ZWG+3/jrimtqMPT6Mv1pU=;
        b=uYmx64cszGa3z9LTDEGqHhRSbDG/HdeJPHMtlf0IxhBpql6NjtqXcs14I/Cn0vKp2M
         DwIHTIftgTiUAOBu/6K/x9A8seWhqtSZmXoN4GxU6QXLy00P94201oj1T2w+XRFMAVpk
         R9zspb0gpX/9Uhcg2khykHrQ18zN8h3N04MtDncL9kzkP62GJIG3zjhyZKtJlsWvlsBG
         femNQyE3GSLyl11xGdoPuSTKZ9jh23UqtgqfU1MD+xI9ckb5w7p7VAOJkPG18f1rpYp1
         Lv6DNf+jh49hnkKer29wZO87tXbACipIaFm4ENQEI8ExQUEUS5BfxAouQCTbjP7RdYm9
         vmDQ==
X-Gm-Message-State: AGi0PubEpBpEhverlOzxUMKmAdwV4D8YrXZ0dH3FPFNbowAD5EroNVEy
        XBeqTRVV9oMydKNnQB/iCmAdsh41RU8=
X-Google-Smtp-Source: APiQypJfC8VUbwJAGR7sUSeGGe0EC41G2TO8QzvnR3qOZDxuY//+mCVxGZ3gqZhd37cWATOWh6pVDA==
X-Received: by 2002:a92:d490:: with SMTP id p16mr5940369ilg.300.1585868525477;
        Thu, 02 Apr 2020 16:02:05 -0700 (PDT)
Received: from derch.Home (75-166-136-192.hlrn.qwest.net. [75.166.136.192])
        by smtp.gmail.com with ESMTPSA id v24sm1808461iob.0.2020.04.02.16.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 16:02:04 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>, linux-iio@vger.kernel.org
Subject: [PATCH 1/2 v2] dt-bindings: iio: Add bindings for sx9310 sensor
Date:   Thu,  2 Apr 2020 17:01:29 -0600
Message-Id: <20200402165720.1.I6ed779cd21abf3e70f21c1562bbda81f590976ab@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds device tree bandings for sx9310 sensor.

Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2 changes:
 - Added power-supply
 - Changed to dual license

 .../iio/proximity/semtech,sx9310.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml

diff --git a/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
new file mode 100644
index 00000000000000..b52ffdac678b54
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/proximity/semtech,sx9310.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech's SX9310 capacitive proximity sensor
+
+maintainers:
+  - Daniel Campello <campello@chromium.org>
+
+description: |
+  Semtech's SX9310/SX9311 capacitive proximity/button solution.
+
+  Specifications about the devices can be found at:
+  https://www.semtech.com/products/smart-sensing/sar-sensors/sx9310
+
+properties:
+  compatible:
+    enum:
+      - semtech,sx9310
+      - semtech,sx9311
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The sole interrupt generated by the device used to announce the
+      preceding reading request has finished and that data is
+      available or that a close/far proximity event has happened.
+    maxItems: 1
+
+  power-supply: true
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      proximity@28 {
+        compatible = "semtech,sx9310";
+        reg = <0x28>;
+        interrupt-parent = <&pio>;
+        interrupts = <5 IRQ_TYPE_LEVEL_LOW 5>;
+        power-supply = <...>;
+      };
+    };
--
2.26.0.292.g33ef6b2f38-goog

