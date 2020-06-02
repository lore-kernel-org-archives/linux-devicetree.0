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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54983C433E3
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E51B206E2
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 16:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ah5ZAsYQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbgFBQN0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 2 Jun 2020 12:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgFBQNZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 2 Jun 2020 12:13:25 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25F5C05BD1E
        for <devicetree@vger.kernel.org>; Tue,  2 Jun 2020 09:13:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x14so4012694wrp.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2020 09:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2A9hisu7OCmqwJQRNm/eLMXrMSsroMPdlllTVf5Mc88=;
        b=ah5ZAsYQjmWmYiJC+YPLhMVumSOCWJ74DRWtWELgxxn1T3cXR/F0SKmj3X7ICKGGeW
         Kt2sO+YZZDqlK0HYjLa/YQyIIkWiUN+hNBsuI3PGjYg4mOyiFb6h8pPinuOqiMdw+I3i
         LvNTXzBGEC49gS5RTqkVMjy7liUTi6iQZK9RAT5PfZJ9d/07B5FjxCvEin+C4QQES/+8
         JXKUiZbpD/j5YNfmy+Z40Co2kxNVBAmccNXsIe5yOfS7V4Dwnb3PiyPUyqOEBTutIh6N
         sPOb9SJ70Fuc6fI9N7tLgrJ6yVDoN1chMxT0w0AtfzoArYi9t8T2k56fM8FDEUfYZrNq
         fnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2A9hisu7OCmqwJQRNm/eLMXrMSsroMPdlllTVf5Mc88=;
        b=rMMhNrpBNgsN8cVeB27SqECJ9dlhU0TDL2ZoMgH3nWuilRY3DIgNjkp9uV7N40+Eok
         QnL7IAuPOnhs1GJfoBdMiitGxfX2VpNQgMyqDx2bSVugL1icmsFDpNedK5UJbBw31l9X
         4JkoWHjKLL1ZxhfhtGAVy/vYY/aiJI5CeW9aok2Ts6vAI7X86/Ok8UhiYpt7ULhToVgn
         nQDz1D564wEbuRE39ec56A+fChlMiylOwAlvgaMy866jP+OvFb1IJhRIYzlA/F9vX3/K
         0pqpgQmWkdUhQvaiYKqy0j6EVhhy+Av0jcgLZ5cgyaYQgARbyGG8eF4VqYVE4uSGfWLM
         BaZA==
X-Gm-Message-State: AOAM533iPSKdYrwWbuGEVXj9KWjZ9I3lNtUxctk59fJtUxJN4XedNnKQ
        +90f9cF/GcOVXV+1vyeKx8Q=
X-Google-Smtp-Source: ABdhPJzcrmjBQDGQXTWgzWTFICr9GkG3GW2ikvynC6gMlEGjRXqfuClkZYDY15Jqk+tGlOegPX5Esg==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr26861530wrt.193.1591114403558;
        Tue, 02 Jun 2020 09:13:23 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id l17sm273714wmi.3.2020.06.02.09.13.23
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 02 Jun 2020 09:13:23 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: dts: NSP: Add support for Cisco Meraki MX65(W)
Date:   Tue,  2 Jun 2020 17:11:19 +0100
Message-Id: <bceec91d0c933cbe1dd365d6d532bb241c8be2af.1591114003.git.mnhagan88@gmail.com>
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
Switches	- Broadcom BCM58625, 2x Qualcomm Atheros QCA8337
Ports		- 12 Ports
Wireless(MX65W)	- Broadcom BCM43520KMLG (2X)
Serial Port	- 115200 8n1
USB		- 1x 2.0

Tested with Kernel 5.4. PCIe is inactive on non-wireless MX65.

Note: The QCA8337 switches are connected to ports 4 and 5 of the BCM58625
SRAB, which need be set to SGMII mode.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm958625-mx65.dts   |  15 ++
 arch/arm/boot/dts/bcm958625-mx65w.dts  |  23 ++
 arch/arm/boot/dts/bcm958625-mx65x.dtsi | 321 +++++++++++++++++++++++++
 3 files changed, 359 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65w.dts
 create mode 100644 arch/arm/boot/dts/bcm958625-mx65x.dtsi

diff --git a/arch/arm/boot/dts/bcm958625-mx65.dts b/arch/arm/boot/dts/bcm958625-mx65.dts
new file mode 100644
index 000000000000..af161d268824
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx65.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65.
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-mx65x.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65";
+	compatible = "meraki,mx65", "brcm,bcm58625", "brcm,nsp";
+};
diff --git a/arch/arm/boot/dts/bcm958625-mx65w.dts b/arch/arm/boot/dts/bcm958625-mx65w.dts
new file mode 100644
index 000000000000..67933ca7b598
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx65w.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65W.
+ *
+ * Copyright (C) 2020 Matthew Hagan <mnhagan88@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "bcm958625-mx65x.dtsi"
+
+/ {
+	model = "Cisco Meraki MX65W";
+	compatible = "meraki,mx65w", "brcm,bcm58625", "brcm,nsp";
+};
+
+&pcie0 {
+        status = "okay";
+};
+
+&pcie1 {
+        status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm958625-mx65x.dtsi b/arch/arm/boot/dts/bcm958625-mx65x.dtsi
new file mode 100644
index 000000000000..f69949be501e
--- /dev/null
+++ b/arch/arm/boot/dts/bcm958625-mx65x.dtsi
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Device Tree Bindings for Cisco Meraki MX65 series (Alamo).
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
+	aliases {
+		mdio-mux-mmio = &mdiomux0;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power_orange {
+			label = "power:orange";
+			gpios = <&gpioa 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		lan_leds {
+			label = "lan:leds";
+			gpios = <&gpioa 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		wan1_right {
+			label = "wan1:right";
+			gpios = <&gpioa 24 GPIO_ACTIVE_LOW>;
+		};
+
+		wan1_left {
+			label = "wan1:left";
+			gpios = <&gpioa 25 GPIO_ACTIVE_LOW>;
+		};
+
+		wan2_right {
+			label = "wan2:right";
+			gpios = <&gpioa 26 GPIO_ACTIVE_LOW>;
+		};
+
+		wan2_left {
+			label = "wan2:left";
+			gpios = <&gpioa 27 GPIO_ACTIVE_LOW>;
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
+			gpios = <&gpioa 8 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	mdio: mdio@18032000 {
+                compatible = "brcm,iproc-mdio";
+                reg = <0x18032000 0x8>;
+                #size-cells = <0>;
+                #address-cells = <1>;
+        };
+
+	mdiomux0: mdio-mux {
+		compatible = "mdio-mux-mmioreg";
+		reg = <0x18032000 0x4>;
+		mux-mask = <0x200>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		mdio-parent-bus = <&mdio>;
+
+		mdio_int: mdio@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+	};
+		mdio_ext: mdio@200 {
+			reg = <0x200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	mdio-mii-mux {
+		compatible = "mdio-mux-mmioreg";
+		reg = <0x1803f1c0 0x4>;
+		mux-mask = <0x2000>;
+		mdio-parent-bus = <&mdio_ext>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mdio@0 {
+			reg = <0x0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port6: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port7: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port8: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port9: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port10: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10>;
+				dsa,member = <1 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						label = "cpu";
+						ethernet = <&sgmii1>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan8";
+						phy-handle = <&phy_port6>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan9";
+						phy-handle = <&phy_port7>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan10";
+						phy-handle = <&phy_port8>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan11";
+						phy-handle = <&phy_port9>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan12";
+						phy-handle = <&phy_port10>;
+					};
+				};
+			};
+		};
+
+		mdio-mii@2000 {
+			reg = <0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			phy_port1: phy@0 {
+				reg = <0>;
+			};
+
+			phy_port2: phy@1 {
+				reg = <1>;
+			};
+
+			phy_port3: phy@2 {
+				reg = <2>;
+			};
+
+			phy_port4: phy@3 {
+				reg = <3>;
+			};
+
+			phy_port5: phy@4 {
+				reg = <4>;
+			};
+
+			switch@10 {
+				compatible = "qca,qca8337";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x10>;
+				dsa,member = <2 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						label = "cpu";
+						ethernet = <&sgmii0>;
+						phy-mode = "sgmii";
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan3";
+						phy-handle = <&phy_port1>;
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan4";
+						phy-handle = <&phy_port2>;
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan5";
+						phy-handle = <&phy_port3>;
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan6";
+						phy-handle = <&phy_port4>;
+					};
+
+					port@5 {
+						reg = <5>;
+						label = "lan7";
+						phy-handle = <&phy_port5>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&srab {
+	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
+	status = "okay";
+	dsa,member = <0 0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			label = "wan1";
+			reg = <0>;
+		};
+
+		port@1 {
+			label = "wan2";
+			reg = <1>;
+		};
+
+		sgmii0: port@4 {
+			label = "sw0";
+			reg = <4>;
+			fixed-link {
+			       speed = <1000>;
+			       full-duplex;
+		      };
+		};
+
+		sgmii1: port@5 {
+			label = "sw1";
+			reg = <5>;
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
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
+
+&pinctrl {
+	mdio_sel: mdio {
+		function = "mdio";
+		groups = "mdio_grp";
+	};
+};
-- 
2.25.4

