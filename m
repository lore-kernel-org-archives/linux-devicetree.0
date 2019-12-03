Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB94FC432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 876802073C
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 15:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575386604;
	bh=VqtlR95SJ1Hwdfg5EZGVF+jnYD3PLNSKnqA9L6FQ4Qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=0UMvZVvxW66bFyIEP4bGJnrDAsQ3d2XrkPR9A3OeP7ieGQCrR7kZ8rITWHzo/dqqh
	 AD/PcPYht+SeEYtRvYqGcfuXjvvzj4OzogTKogTy+7R4R3jvCnwvl+gRDxNIpsvFXN
	 TJTU/KPKmX+VPbK7XJVoguZvjgCcdPlIqyG5lyyo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfLCPXY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 10:23:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:41588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfLCPXX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 10:23:23 -0500
Received: from e123331-lin.cambridge.arm.com (fw-tnat-cam5.arm.com [217.140.106.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF9FB207DD;
        Tue,  3 Dec 2019 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575386603;
        bh=VqtlR95SJ1Hwdfg5EZGVF+jnYD3PLNSKnqA9L6FQ4Qo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1A8JFKN5q7VGHcr+YMeex6YSf4MPpbNfozAWrGIkb/qP2D7I7Ggc2OpLGGdYYKxqk
         mxotvRUW3Ncmacp9Dklwm+zjRLvVuB2A+o8GrRbJcP7nWqigc9TXr+Tzyop+07+Hhm
         9qx8E9Mu1fDofHvDmonQXW0imMWsHsP0lZd5J7f0=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 8/8] dt: amd-seattle: add a description of the CPUs and caches
Date:   Tue,  3 Dec 2019 15:23:06 +0000
Message-Id: <20191203152306.7839-9-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191203152306.7839-1-ardb@kernel.org>
References: <20191203152306.7839-1-ardb@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a DT description of the CPU and cache hierarchy as found on
the AMD Seattle SOC. Given the tight coupling of the PMU with
the CPUs, move the PMU node into the cpu .dtsi file as well, and
add the missing affinity description.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts |   1 +
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts |   1 +
 arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi    | 224 ++++++++++++++++++++
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi     |  12 --
 4 files changed, 226 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index 4997a74aeb67..c290d1ce2b03 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 /include/ "amd-seattle-soc.dtsi"
+/include/ "amd-seattle-cpus.dtsi"
 
 / {
 	model = "AMD Seattle (Rev.B0) Development Board (Overdrive)";
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index 92cef05c6b74..e0926f6bb7c3 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 
 /include/ "amd-seattle-soc.dtsi"
+/include/ "amd-seattle-cpus.dtsi"
 
 / {
 	model = "AMD Seattle (Rev.B1) Development Board (Overdrive)";
diff --git a/arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
new file mode 100644
index 000000000000..93688a0b6820
--- /dev/null
+++ b/arch/arm64/boot/dts/amd/amd-seattle-cpus.dtsi
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	cpus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&CPU0>;
+				};
+				core1 {
+					cpu = <&CPU1>;
+				};
+			};
+			cluster1 {
+				core0 {
+					cpu = <&CPU2>;
+				};
+				core1 {
+					cpu = <&CPU3>;
+				};
+			};
+			cluster2 {
+				core0 {
+					cpu = <&CPU4>;
+				};
+				core1 {
+					cpu = <&CPU5>;
+				};
+			};
+			cluster3 {
+				core0 {
+					cpu = <&CPU6>;
+				};
+				core1 {
+					cpu = <&CPU7>;
+				};
+			};
+		};
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_0>;
+
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x1>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_0>;
+		};
+
+		CPU2: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x100>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_1>;
+		};
+
+		CPU3: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x101>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_1>;
+		};
+
+		CPU4: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x200>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_2>;
+		};
+
+		CPU5: cpu@201 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x201>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_2>;
+		};
+
+		CPU6: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x300>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_3>;
+		};
+
+		CPU7: cpu@301 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x301>;
+			enable-method = "psci";
+
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			l2-cache = <&L2_3>;
+		};
+	};
+
+	L2_0: l2-cache0 {
+		cache-size = <0x100000>;
+		cache-line-size = <64>;
+		cache-sets = <1024>;
+		cache-unified;
+		next-level-cache = <&L3>;
+	};
+
+	L2_1: l2-cache1 {
+		cache-size = <0x100000>;
+		cache-line-size = <64>;
+		cache-sets = <1024>;
+		cache-unified;
+		next-level-cache = <&L3>;
+	};
+
+	L2_2: l2-cache2 {
+		cache-size = <0x100000>;
+		cache-line-size = <64>;
+		cache-sets = <1024>;
+		cache-unified;
+		next-level-cache = <&L3>;
+	};
+
+	L2_3: l2-cache3 {
+		cache-size = <0x100000>;
+		cache-line-size = <64>;
+		cache-sets = <1024>;
+		cache-unified;
+		next-level-cache = <&L3>;
+	};
+
+	L3: l3-cache {
+		cache-level = <3>;
+		cache-size = <0x800000>;
+		cache-line-size = <64>;
+		cache-sets = <8192>;
+		cache-unified;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a57-pmu";
+		interrupts = <0x0 0x7 0x4>,
+			     <0x0 0x8 0x4>,
+			     <0x0 0x9 0x4>,
+			     <0x0 0xa 0x4>,
+			     <0x0 0xb 0x4>,
+			     <0x0 0xc 0x4>,
+			     <0x0 0xd 0x4>,
+			     <0x0 0xe 0x4>;
+		interrupt-affinity = <&CPU0>,
+				     <&CPU1>,
+				     <&CPU2>,
+				     <&CPU3>,
+				     <&CPU4>,
+				     <&CPU5>,
+				     <&CPU6>,
+				     <&CPU7>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 547a6bf10f5e..690020589d41 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -38,18 +38,6 @@
 			     <1 10 0xff04>;
 	};
 
-	pmu {
-		compatible = "arm,armv8-pmuv3";
-		interrupts = <0 7 4>,
-			     <0 8 4>,
-			     <0 9 4>,
-			     <0 10 4>,
-			     <0 11 4>,
-			     <0 12 4>,
-			     <0 13 4>,
-			     <0 14 4>;
-	};
-
 	smb0: smb {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.17.1

