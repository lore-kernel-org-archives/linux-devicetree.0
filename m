Return-Path: <SRS0=EOmc=AX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41D2C433E2
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5B7B207DD
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Jul 2020 10:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="I+r9r045"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgGLKZS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Jul 2020 06:25:18 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:6691 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbgGLKZS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Jul 2020 06:25:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0ae4d50000>; Sun, 12 Jul 2020 03:24:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 12 Jul 2020 03:25:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 12 Jul 2020 03:25:18 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 12 Jul
 2020 10:25:18 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 12 Jul 2020 10:25:18 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.75.246]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0ae50c0013>; Sun, 12 Jul 2020 03:25:17 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Enable DFLL support on Jetson Nano
Date:   Sun, 12 Jul 2020 11:25:05 +0100
Message-ID: <20200712102506.23686-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200712102506.23686-1-jonathanh@nvidia.com>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594549461; bh=TzDiRWzYTOCE1gUE1TfyIWopeKtWIS6gv0hEoYmbnbk=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=I+r9r045vQXKDGp+iU+hvRlkUd+FVQAAxUzDi4Aa4penXsoh1Fkb+TRJLWOuD5CgU
         uBm4bEWtZYq81uyFGWc1tqYST+vk/BZwdruJ6m9PmlcCAlACNOJnHpD3s1YxmW+izg
         aCwxX0uaPpkWGoqAYLnVe5rFroz+HVJOL2KmMBY3Ht7GFzGFq5rNc4snC6jn0C1EH2
         m9DaOfi1nynxMvewqub/MiEm2gCed/4XXlggEBmTYa+GHAniCaS+tH7qf2NZT19i3j
         nkh8sw+fG7lO7d4UwwAu3PByENX+w6AWmL38FzWM/rw0Xj9Fxm6niLp8dKbJgqhTWW
         YJdro0grkL/bw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Populate the DFLL node and corresponding PWM pin nodes in order to
enable CPUFREQ support on the Jetson Nano platform.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9b6346917ea9..2282ea1c6279 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -111,6 +111,22 @@
 		status = "okay";
 	};
 
+	pinmux@700008d4 {
+		dvfs_pwm_active_state: dvfs_pwm_active {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+		};
+
+		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+		};
+	};
+
 	/* debug port */
 	serial@70006000 {
 		status = "okay";
@@ -584,6 +600,27 @@
 		hvdd-usb-supply = <&vdd_1v8>;
 	};
 
+	clock@70110000 {
+		status = "okay";
+
+		nvidia,cf = <6>;
+		nvidia,ci = <0>;
+		nvidia,cg = <2>;
+		nvidia,droop-ctrl = <0x00000f00>;
+		nvidia,force-mode = <1>;
+		nvidia,sample-rate = <25000>;
+
+		nvidia,pwm-min-microvolts = <708000>;
+		nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
+		nvidia,pwm-to-pmic;
+		nvidia,pwm-tristate-microvolts = <1000000>;
+		nvidia,pwm-voltage-step-microvolts = <19200>;
+
+		pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
+		pinctrl-0 = <&dvfs_pwm_active_state>;
+		pinctrl-1 = <&dvfs_pwm_inactive_state>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-- 
2.17.1

