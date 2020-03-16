Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D28C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 09:00:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57E8220658
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 09:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O+/EkEaR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbgCPJAy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 05:00:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34044 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbgCPJAy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 05:00:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id 23so9576872pfj.1
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGTp0aw5UViZrykS90Wdmo0NeHyVyuCEPd0W8cnwwcM=;
        b=O+/EkEaRDUC3lhE2OfWN6jtHMfQFiTbtgKD8XJcQSNYQze/KmfORZPLJYJBuM+0SqD
         KmX5afZ+gt+FovYZmGAV92dQGT0hXiH6sE7AJ12wkMCrecXmqPNLGnK6sgsvzhH4JXrY
         XuLkx3z8qobUQpxhKOJo7guJTN7Nbvn2NC31Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGTp0aw5UViZrykS90Wdmo0NeHyVyuCEPd0W8cnwwcM=;
        b=GAqer7yoLIuWO4XmldIseg4cVpIJ29AmJg52NZRi1rK5uZKHjOhrNvyeMurvKZiE9Z
         evF/KOGejOzIqFOL3kYDWGw8hNjVVvZTzPdsrjofyvixoiJFhW87Idk1l3lK6O4SURyf
         v0IX1rLd8vE9UfkltYnwZZw8ZS1ECNGgJ6tPLHHMs+L8V1jRvNJ+JRPPtdSb1il89nb0
         lo0OtSEN4xY8Bqhm91Vznne8rPkEt3nY27GgOVsDSwTjqGNRNnLMWxCwCKmJw/V3xKax
         zraKFmLB2UGzu38CeEwQ6B7K7Ly2kM/WAVnczCbT7Jpkq87UQ9DpltMLqIloXWWeHvCH
         MBYg==
X-Gm-Message-State: ANhLgQ3qKmtVJNkMbTdz34OSpzrUqKvLpU4enKCNPfQo108+hOaGrfjG
        hlrWMMg7+FiliRzsEnEEf3REFA==
X-Google-Smtp-Source: ADFU+vtLPRqHTpQ6B+vPCSr2M0cfUNwrR+7iWd4BM7L0ER24RaJ7zrbl7SD7IUIJmxTp2qFccPa4PA==
X-Received: by 2002:a63:7a02:: with SMTP id v2mr25362946pgc.13.1584349253858;
        Mon, 16 Mar 2020 02:00:53 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id d3sm65040080pfn.113.2020.03.16.02.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 02:00:53 -0700 (PDT)
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
Subject: [PATCH v5 1/4] dt-bindings: Add cros-ec Type C port driver
Date:   Mon, 16 Mar 2020 02:00:15 -0700
Message-Id: <20200316090021.52148-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200316090021.52148-1-pmalani@chromium.org>
References: <20200316090021.52148-1-pmalani@chromium.org>
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

Changes in v5:
- Updated License identifier.
- Updated DT example to be a full example.

Changes in v4:
- Rebased on top of usb-connector.yaml, so the connector property now
  directly references the usb-connector DT binding.

 .../bindings/chrome/google,cros-ec-typec.yaml | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
new file mode 100644
index 0000000000000..6d7396ab8beec
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    spi0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cros_ec: ec@0 {
+        compatible = "google,cros-ec-spi";
+        reg = <0>;
+
+        typec {
+          compatible = "google,cros-ec-typec";
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          connector@0 {
+            compatible = "usb-c-connector";
+            reg = <0>;
+            power-role = "dual";
+            data-role = "dual";
+            try-power-role = "source";
+          };
+        };
+      };
+    };
-- 
2.25.1.481.gfbce0eb801-goog

