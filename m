Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB40EC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8429206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="LcoXrwKE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGJJqt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgGJJq1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC163C08C5CE
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so2305990pgm.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sQh8fTW1CMwiKZg7U1ALPZLqSKSdfYrTnjzy3+XbYyY=;
        b=LcoXrwKET3Q2WuGFBbKAzDgHF0GVkFzb4suOWPmeOEvM0ZZxEJpqGiN5Rp1pt3X0jA
         HvZFNzpmm1aSYSGer4VKiJHDFdrOTJT5GT4WfOXNOiW4XCAGp2rbVAZJep/WUaILDQmI
         iMoh++zpKkKPvYn2RmncPInN4t1rJl6TvR3lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sQh8fTW1CMwiKZg7U1ALPZLqSKSdfYrTnjzy3+XbYyY=;
        b=EzIOr7x6iU3tEXkWhdCZuDpzcRYjgCzi2eIJZO9pLrSVX8hL0Hgej11vV9MkcpnPzh
         MNMKOVF5msouqg1Eadu9bZrD9yvWTp6LHBJJNmB/+aT0W3GM20GBw4Z37jtuzN1q2RV5
         I1LlL0FMiF3gAU7K2dQ+zpmk4vTKrD57GRVwRsyLKnkyZLFxCNQ6J6X6g8EqmdX2tS9w
         xg4M0gTbChsc5X5ay3RczKreouVb36dhx8Mw+WvMvCYwvof6a6F/G/UkNwrgC7b40dQl
         6jqA5VvTY8MdQojuRivOaaoQs1OC+plHKw/SHwd2N2yUlL9/I47kaioiUE7IU4e45gCh
         ItqQ==
X-Gm-Message-State: AOAM5316kYHmhZY5dFF1B5xuq56Q+LZnTGaXAwCNkfq2BiNIH4c937zo
        ksjC26Sx+7AVdUOZd0K42CFqLg==
X-Google-Smtp-Source: ABdhPJxJvP8y+uMOFKQ59YdfhLwpFRBXsd9tQD64sVWb3uxUMdE43DsIk48cayJ7FJAH99/EokQNNA==
X-Received: by 2002:a63:7c42:: with SMTP id l2mr57210802pgn.35.1594374386342;
        Fri, 10 Jul 2020 02:46:26 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:25 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v5 08/12] ARM: mstar: Add Armv7 base dtsi
Date:   Fri, 10 Jul 2020 18:45:40 +0900
Message-Id: <20200710094544.430258-9-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds initial dtsi for the base MStar/Sigmastar Armv7 SoCs.

These SoCs have very similar memory maps and this will avoid
duplicating nodes across multiple dtsis.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                     |  1 +
 arch/arm/boot/dts/mstar-v7.dtsi | 83 +++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-v7.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index e433847a7446..2c277fa629fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2123,6 +2123,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
+F:	arch/arm/boot/dts/mstar-v7.dtsi
 F:	arch/arm/mach-mstar/
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
new file mode 100644
index 000000000000..3b99bb435bb5
--- /dev/null
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+	};
+
+	arch_timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>;
+		/*
+		 * we shouldn't need this but the vendor
+		 * u-boot is broken
+		 */
+		clock-frequency = <6000000>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x16001000 0x16001000 0x00007000>,
+			 <0x1f000000 0x1f000000 0x00400000>;
+
+		gic: interrupt-controller@16001000 {
+			compatible = "arm,cortex-a7-gic";
+			reg = <0x16001000 0x1000>,
+			      <0x16002000 0x2000>,
+			      <0x16004000 0x2000>,
+			      <0x16006000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2)
+					| IRQ_TYPE_LEVEL_LOW)>;
+		};
+
+		riu: bus@1f000000 {
+			compatible = "simple-bus";
+			reg = <0x1f000000 0x00400000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x1f000000 0x00400000>;
+
+			l3bridge: l3bridge@204400 {
+				compatible = "mstar,l3bridge";
+				reg = <0x204400 0x200>;
+			};
+
+			pm_uart: uart@221000 {
+				compatible = "ns16550a";
+				reg = <0x221000 0x100>;
+				reg-shift = <3>;
+				clock-frequency = <172000000>;
+				status = "disabled";
+			};
+		};
+	};
+};
-- 
2.27.0

