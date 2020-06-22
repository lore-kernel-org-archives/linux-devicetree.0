Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC019C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D4D2076E
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 00:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ht7wxKMT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731175AbgFWAA0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 20:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730227AbgFWAA0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 20:00:26 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2A5C061573
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:25 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id 59so13862943qvb.4
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 17:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=lqWNh4cjY5fi3rvDMvF8BtNR8CV/iggx6/xYsfQ6psI=;
        b=ht7wxKMT/fIaXV/S1lp3i3Md/xQcpbmhSuaenqwRGfaIZ+zGAeHrQUTN6uTM1xP7JK
         t78O5ornxb/UwmzZy7KtpxlIZiwERtYwvpv6E83df+WANCWpHpK2tI0lzIe9NNiKWw1n
         SeuTp7Zt7sahBIPMjC8oPPRcbbMmkz+7sFL2/OgKeHIoSWqPYrfDyYc13gPmvKlb4/fg
         r1eRK1aemaJld3FTenVEPt06Sh2cIyr8KOonSLCpz7Lu27mPbEYUdKyxKjgYqrQCQezv
         8NoOjuatSmRwmxOUYSyoLchQHKdYBSOpw6TtK5F4MOHdcqWoONkvr/qlzVHwqjGnS3QZ
         U25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lqWNh4cjY5fi3rvDMvF8BtNR8CV/iggx6/xYsfQ6psI=;
        b=THe6zFVxflx95Mz28lVDKan1FYv+OLvSq5T2XvGfawGGrgGlstW1LrLGTGHqW2VuaF
         qSo5QmihLCLUtENNf2IscdE/f1OHjcGluv1KO1bCqrEub81HPGfrLwpJELJHI+c+lGHM
         9X1wXXTNkUgyE9hrYCyiqVdgCA3EGJKnbm36k0NHPuJQndVFLSm4uFw5YBzr/gRydnsR
         YHV+6ly7/UDQ9VU0EpubGCtJIn0pv6LB6aykO0o4Y2x2a5hlM8oAkiGVyCjnVcSYHXER
         eSGOyb0Q5ktUUnwKkHwQ8MqomCZHHI5XjJvhWwDzd5kFQa7EmDpzRyj9PBJnJZpt8LSB
         CvOQ==
X-Gm-Message-State: AOAM532sYlcSG+H8GExFaurJxtqb29rvb0fflEKW2a6lzMXo7wpyBfSM
        /wb/82r4bNThGXg3QnuzHGss//69+Bz7
X-Google-Smtp-Source: ABdhPJydGk6Im3kxlgOKKqsl4SjlCzX8kucqpIpbEP/WO70SXTpkS6DG75SEd/eLunF7ZuWajgFwlgp+651N
X-Received: by 2002:a05:6214:94a:: with SMTP id dn10mr24111642qvb.69.1592870425099;
 Mon, 22 Jun 2020 17:00:25 -0700 (PDT)
Date:   Mon, 22 Jun 2020 19:59:48 -0400
In-Reply-To: <20200622235950.169001-1-jnchase@google.com>
Message-Id: <20200622235950.169001-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200622235950.169001-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH v6 1/3] dt-bindings: Add ch7322 media i2c device
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ch7322 is a Chrontel CEC controller.

Signed-off-by: Jeff Chase <jnchase@google.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 2 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
new file mode 100644
index 000000000000..daa2869377c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Chrontel HDMI-CEC Controller
+
+maintainers:
+  - Jeff Chase <jnchase@google.com>
+
+description:
+  The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
+  programmable through I2C and drives a single CEC line.
+
+properties:
+  compatible:
+    const: chrontel,ch7322
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the RESET pin, if any. This
+      pin is active-low.
+    maxItems: 1
+
+  standby-gpios:
+    description:
+      Reference to the GPIO connected to the OE pin, if any. When low
+      the device will respond to power status requests with "standby"
+      if in auto mode.
+    maxItems: 1
+
+  # see ../cec.txt
+  hdmi-phandle:
+    description: phandle to the HDMI controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      ch7322@75 {
+        compatible = "chrontel,ch7322";
+        reg = <0x75>;
+        interrupts = <47 IRQ_TYPE_EDGE_RISING>;
+        standby-gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+        reset-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+        hdmi-phandle = <&hdmi>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..c1c17ca17830 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4101,6 +4101,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
 N:	cros_ec
 N:	cros-ec
 
+CHRONTEL CH7322 CEC DRIVER
+M:	Jeff Chase <jnchase@google.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
+
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
 M:	David Rhodes <david.rhodes@cirrus.com>
-- 
2.27.0.111.gc72c7da667-goog

