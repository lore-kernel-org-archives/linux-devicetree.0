Return-Path: <devicetree-owner@vger.kernel.org>
Received: from [207.46.163.27] ([207.46.163.27]:29910 "EHLO
	co9outboundpool.messaging.microsoft.com" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751699Ab3HUJVr (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Wed, 21 Aug 2013 05:21:47 -0400
Received: from mail61-co9 (localhost [127.0.0.1])	by mail61-co9-R.bigfish.com
 (Postfix) with ESMTP id C73F3A0124	for <devicetree@vger.kernel.org>; Wed, 21
 Aug 2013 09:20:36 +0000 (UTC)
Received: from CO9EHSMHS014.bigfish.com (unknown [10.236.132.249])	by
 mail61-co9.bigfish.com (Postfix) with ESMTP id A867070004F	for
 <devicetree@vger.kernel.org>; Wed, 21 Aug 2013 09:20:35 +0000 (UTC)
From: Poonam Aggrwal <poonam.aggrwal@freescale.com>
Subject: [PATCH] Device Tree bindings for DSP clusters and DSP CPUs
Date: Wed, 21 Aug 2013 14:50:30 +0530
Message-ID: <1377076830-24223-1-git-send-email-poonam.aggrwal@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Poonam Aggrwal <poonam.aggrwal@freescale.com>
List-ID: <devicetree@vger.kernel.org>

Binding for DSP CPU clusters and DSP CPUs for Freescale SOCs which
have DSP CPUs in addition to PowerPC CPUs. For example B4860.

Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
---
 .../devicetree/bindings/powerpc/fsl/dsp-cpus.txt   |   78 ++++++++++++++++++++
 1 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt b/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
new file mode 100644
index 0000000..da7f5d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/powerpc/fsl/dsp-cpus.txt
@@ -0,0 +1,78 @@
+===================================================================
+Binding for DSP CPU clusters and DSP CPUs for Freescale SOCs which
+have DSP CPUs in addition to PowerPC cpus.
+Copyright 2013 Freescale Semiconductor Inc.
+
+Power Architecture CPUs in Freescale SOCs are represented in device trees as
+per the definition in ePAPR.
+
+Required properties for DSP CPU cluster:
+- compatible : should be "fsl,dsp-cluster" or "fsl,sc3900-cluster".
+- reg : should contain the cluster index
+
+Required properties for DSP CPU:
+- compatible : should be "fsl,dsp" or "fsl,sc3900".
+- reg : should contain index of DSP CPU within the DSP clsuter. 
+- next-level-cache : should point to the phandle of the next-level L2 cache.
+
+Example for B4860:
+B4860 SOC of Freescale has 3 DSP clusters. Each DSP cluster has 2 DSP CPUs each.
+The DSP CPUs are SC3900. There is a shared L2 cache per DSP cluster.
+	dsp-clusters {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dsp-cluster0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,sc3900-cluster";
+			reg = <0>;
+
+			dsp0: dsp@0 {
+				compatible = "fsl,sc3900";
+				reg = <0>;
+				next-level-cache = <&L2_2>;
+			};
+			dsp1: dsp@1 {
+				compatible = "fsl,sc3900";
+				reg = <1>;
+				next-level-cache = <&L2_2>;
+			};
+		};
+
+		dsp-cluster1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,sc3900-cluster";
+			reg = <1>;
+
+			dsp2: dsp@2 {
+				compatible = "fsl,sc3900";
+				reg = <2>;
+				next-level-cache = <&L2_3>;
+			};
+			dsp3: dsp@3 {
+				compatible = "fsl,sc3900";
+				reg = <3>;
+				next-level-cache = <&L2_3>;
+			};
+		};
+
+		dsp-cluster2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,sc3900-cluster";
+			reg = <2>;
+
+			dsp4: dsp@4 {
+				compatible = "fsl,sc3900";
+				reg = <4>;
+				next-level-cache = <&L2_4>;
+			};
+			dsp5: dsp@5 {
+				compatible = "fsl,sc3900";
+				reg = <5>;
+				next-level-cache = <&L2_4>;
+			};
+		};
+	};
-- 
1.7.4.1


