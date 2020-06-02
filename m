Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CAEC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9445920757
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba7KzQri"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgFBQNZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 12:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgFBQNY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 12:13:24 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06804C08C5C1
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 09:13:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id v19so3503937wmj.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 09:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wRxyk7AgJAjBP1wGNSxBpMY9GpEBrSY1kU+d8H0i7g4=;
        b=Ba7KzQriq4ldTyFY9mdZUjBqtOiBpnQ+CEELdLxzKIXDI/jSv7ozfOxr0ps/Wwu8Bh
         RDWvmuJDYLZTCjObQdfk92Xh7Ypv30SKo/duZv8uqWABimxepLOb5bOjMuWljT8mg0zX
         wejpuH8riYTCLR+MDVAZ7M1/Es/8TtUTiCaeXhBi/+D8vJsOSNfKJNQZBYQAbuSdLG8q
         25uB9MQwMFRglqZg97KtDhVHHEHVWu7qDF88OLYkX+FFbwG0pAsCE1aLq+KfUaEUZduY
         sD9U7nNMgfuLlwNn86T2qUtYKSVpxJpAU5DvMlmmR5lzp7lDVsCNnCZ8B8VwxyT6Sfz4
         thWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wRxyk7AgJAjBP1wGNSxBpMY9GpEBrSY1kU+d8H0i7g4=;
        b=LDnNnsbEFcjrz2E0iGwHAbqItQ56rRtak5URg8hy2YGGzGcfkbfkZAK4eo57U/pb5e
         kqW2BSUjQmV9GJuLO3yF1Mb90oenEgZzAV5XJWss08SgabXw4m1aCc1PYfSbpPrDEnw0
         WAsVe92tr3d7CTUNKdhyaBr5doxK4FQUlj7/AhOZ97KYwHXYSNrknslgkfeYU1v8kOMP
         HRcF2Bhp9aXR30CFQdlv5O5mrhsIa+/YtUHpHN/UFGYBqfaiJcs79PcSZP4GQ9E8WRg3
         HAA0CoizK5ZBrc5mzxe8JEEb69kD1xfc9/7uUn1dabRa8OZgLlfo9+QOaigazpXuEXvt
         1vqg==
X-Gm-Message-State: AOAM530mdQpvz2f4n9ER37h1wriXC6sUiKOHhsc9ukWk+S26PHAp6y7c
        I+Eu7+u2Z2vEkogFN/WXiv0=
X-Google-Smtp-Source: ABdhPJyhyXS+zlCY2FEcEC9B+zbR+jwx7JHDxGRXIcKw1wuN3lHDEaJjI9hgdrBfKlWlnVJ4br5dYA==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr4765547wme.162.1591114402656;
        Tue, 02 Jun 2020 09:13:22 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id s132sm338062wmf.12.2020.06.02.09.13.22
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 02 Jun 2020 09:13:22 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: NSP: Add support for Cisco Meraki MX64(W)
Date:   Tue,  2 Jun 2020 17:11:18 +0100
Message-Id: <dc4c69de81ecc422d0b2895c6020832e28ba8839.1591114003.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1591114003.git.mnhagan88@gmail.com>
References: <cover.1591114003.git.mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hardware Info
-------------

Processor	- Broadcom BCM58625 dual-core @ 1.2 GHz
DDR3 RAM	- 2GB (4x SK Hynix H5TC4G83CFR)
Flash		- 1GB (Micron MT29F8G08ABACA)
Switch		- Broadcom BCM58625
Wireless(MX64W)	- Broadcom BCM43520KMLG (2x)
Ports		- 5 Ports
Serial Port	- 115200 8n1
USB		- 1x 2.0

Tested with Kernel 5.4. PCIe is inactive on the non-wireless MX64.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm958625-mx64.dts   |  15 +++
 arch/arm/boot/dts/bcm958625-mx64w.dts  |  23 +++++
 arch/arm/boot/dts/bcm958625-mx64x.dtsi | 136 +++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx64x.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-mx64.dts b/arch/arm/boot/dts/bcm958625-mx64.dts
new file mode 100644
index 000000000000..ec1017b8bf68
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx64.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64.
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-mx64x.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64";
+	compatible = "meraki,mx64", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-mx64w.dts b/arch/arm/boot/dts/bcm958625-mx64w.dts
new file mode 100644
index 000000000000..a3fbf0fed218
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx64w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64W.
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-mx64x.dtsi"
+
+/ {
+	model = "Cisco Meraki MX64W";
+	compatible = "meraki,mx64w", "brcm,bcm58625", "brcm,nsp";
+};
+
+&pcie0 {
+        status = "okay";
+};
+
+&pcie1 {
+        status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm958625-mx64x.dtsi b/arch/arm/boot/dts/bcm958625-mx64x.dtsi
new file mode 100644
index 000000000000..4be3dd314beb
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx64x.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX64 series (Kingpin).
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-mx6x-common.dtsi"
+
+#include <dt-bindings/input/input.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+
+		power_orange {
+			label = "power:orange";
+			gpios = <&gpioa 0 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		lan1_right {
+			label = "lan1:right";
+			gpios = <&gpioa 18 GPIO_ACTIVE_LOW>;
+		};
+
+		lan1_left {
+			label = "lan1:left";
+			gpios = <&gpioa 19 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_right {
+			label = "lan2:right";
+			gpios = <&gpioa 20 GPIO_ACTIVE_LOW>;
+		};
+
+		lan2_left {
+			label = "lan2:left";
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_right {
+			label = "lan3:right";
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		lan3_left {
+			label = "lan3:left";
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_right {
+			label = "lan4:right";
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
+		};
+
+		lan4_left {
+			label = "lan4:left";
+			gpios = <&gpioa 28 GPIO_ACTIVE_LOW>;
+		};
+
+		wan0_right {
+			label = "wan0:right";
+			gpios = <&gpioa 29 GPIO_ACTIVE_LOW>;
+		};
+
+		wan0_left {
+			label = "wan0:left";
+			gpios = <&gpioa 30 GPIO_ACTIVE_LOW>;
+		};
+
+		power_white {
+			label = "power:white";
+			gpios = <&gpioa 31 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-buttons {
+		compatible = "gpio-keys-polled";
+		autorepeat;
+		poll-interval = <20>;
+
+		reset {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&gpioa 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			label = "lan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "lan2";
+			reg = <1>;
+		};
+
+		port@2 {
+			label = "lan3";
+			reg = <2>;
+		};
+
+		port@3 {
+			label = "lan4";
+			reg = <3>;
+		};
+
+		port@4 {
+			label = "wan0";
+			reg = <4>;
+		};
+
+		port@8 {
+			ethernet = <&amac2>;
+			label = "cpu";
+			reg = <8>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+	};
+};
-- 
2.25.4

