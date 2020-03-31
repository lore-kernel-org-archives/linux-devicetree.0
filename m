Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2A4C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 18:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2E7620784
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 18:37:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaBW4VKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCaShn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 14:37:43 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40253 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgCaShn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 14:37:43 -0400
Received: by mail-qk1-f196.google.com with SMTP id l25so24199555qki.7
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 11:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6bo50showiDDZymkVwcrzZUnNVACXf2piseIaZpnpDc=;
        b=SaBW4VKJMe0E2qjcW8tep8L7AtKIbKOI3PwHv7sEu73TfC+gycMQ/geVK1jDDIi1DP
         rih4oMkWd1qZ2gQmHh7IuvGqQj2Rme6a624fSZlalypsTMkFojle70D1Oi5ewYc7tzhy
         Wk3FekAZMG7wV9yT/+MhupkLufJPJONC4DD1afgcZ99n/3mVZAMmZygSd7E+93sPzmMT
         cU0pbdQEuCAA+/+zPfb8BlhVdY2L9uXSWCSWa11bJjQsL1dRIn2Yg4PaA75aXCCmfl5T
         gnQuHLJqr8WnDEoCa+8evXtGEyHP08u8aD06dOE/egDtG56/igxneLy7MvrgpLfhcns/
         ExJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6bo50showiDDZymkVwcrzZUnNVACXf2piseIaZpnpDc=;
        b=ONgHVMD2RgFNNZKSy2/0vSlsZSRT1SSTmhmoFtsenl3IBB1HSjKl0eVyuRkSTUiolj
         GrnzRmEFVJsytBKAeIBWnRWmGyrG/XaxCWcrfHckSRuMM9njw8A0tSZ2KZNj6ReS0dOW
         xSe92C09VDUjt2gFQZf1+mTP+rHNZvG36oVtwzCC4Ynz9AVgTBdDe7EADPzciWGx6/8v
         Mep0aIaiabZasAigDAT/d52Aqri5fD6wpUPdXoLMnHFJ0jasWypTgZ9iu5BE8jxlhVYp
         pvZZ3t6/IjXc0TWf0alPYWJmRvrJxfLK4WWVBWaoK2+9PCfvrCe5jOajIzzRScQsZoHi
         iSdw==
X-Gm-Message-State: ANhLgQ1YpsHnd2r3tMg6yPmOnciXX7oqFuJdkyPwwFf7rdACk4RjyAD2
        atFKiWBiNKs7U63earFNvyk=
X-Google-Smtp-Source: ADFU+vvEVPUXk9miWqKlR4xK/YHvMHFYmYN1HBOSW37JSD9DBLvt5Xv8gwqOQU2qHc8Y8b4En9YOuA==
X-Received: by 2002:a37:9d4a:: with SMTP id g71mr5471980qke.54.1585679861295;
        Tue, 31 Mar 2020 11:37:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
        by smtp.gmail.com with ESMTPSA id f21sm14285243qtc.97.2020.03.31.11.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 11:37:40 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     peng.fan@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: imx8m: Fix AIPS reg properties
Date:   Tue, 31 Mar 2020 15:37:25 -0300
Message-Id: <20200331183725.25255-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node") caused several
dtc warnings like these when building with W=1:

arch/arm64/boot/dts/freescale/imx8mm.dtsi:265.23-542.5: Warning (simple_bus_reg): /soc@0/bus@30000000: simple-bus unit address format error, expected "301f0000"
arch/arm64/boot/dts/freescale/imx8mm.dtsi:544.23-602.5: Warning (simple_bus_reg): /soc@0/bus@30400000: simple-bus unit address format error, expected "305f0000"
arch/arm64/boot/dts/freescale/imx8mm.dtsi:604.23-862.5: Warning (simple_bus_reg): /soc@0/bus@30800000: simple-bus unit address format error, expected "309f0000"
arch/arm64/boot/dts/freescale/imx8mm.dtsi:864.23-909.5: Warning (simple_bus_reg): /soc@0/bus@32c00000: simple-bus unit address format error, expected "32df0000"

Fix them by using the correct address base and size in the AIPS reg
properties.

Fixes: dc3efc6ff0d5 ("arm64: dts: imx8m: fix aips dts node")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 8 ++++----
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++----
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cc7152ecedd9..8829628f757a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -264,7 +264,7 @@
 
 		aips1: bus@30000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x301f0000 0x10000>;
+			reg = <0x30000000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30000000 0x30000000 0x400000>;
@@ -543,7 +543,7 @@
 
 		aips2: bus@30400000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x305f0000 0x10000>;
+			reg = <0x30400000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30400000 0x30400000 0x400000>;
@@ -603,7 +603,7 @@
 
 		aips3: bus@30800000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x309f0000 0x10000>;
+			reg = <0x30800000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30800000 0x30800000 0x400000>,
@@ -863,7 +863,7 @@
 
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x32df0000 0x10000>;
+			reg = <0x32c00000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index fa78f0163270..e62d4146cebc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -241,7 +241,7 @@
 
 		aips1: bus@30000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x301f0000 0x10000>;
+			reg = <0x30000000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -448,7 +448,7 @@
 
 		aips2: bus@30400000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x305f0000 0x10000>;
+			reg = <0x30400000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -508,7 +508,7 @@
 
 		aips3: bus@30800000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x309f0000 0x10000>;
+			reg = <0x30800000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -754,7 +754,7 @@
 
 		aips4: bus@32c00000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x32df0000 0x10000>;
+			reg = <0x32c00000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b1616e59d58..9f6ba763238d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -145,7 +145,7 @@
 
 		aips1: bus@30000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x301f0000 0x10000>;
+			reg = <0x30000000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -318,7 +318,7 @@
 
 		aips2: bus@30400000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x305f0000 0x400000>;
+			reg = <0x30400000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -378,7 +378,7 @@
 
 		aips3: bus@30800000 {
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x309f0000 0x400000>;
+			reg = <0x30800000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 75b384217a23..bab88369be1b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -291,7 +291,7 @@
 
 		bus@30000000 { /* AIPS1 */
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x301f0000 0x10000>;
+			reg = <0x30000000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30000000 0x30000000 0x400000>;
@@ -696,7 +696,7 @@
 
 		bus@30400000 { /* AIPS2 */
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x305f0000 0x10000>;
+			reg = <0x30400000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30400000 0x30400000 0x400000>;
@@ -756,7 +756,7 @@
 
 		bus@30800000 { /* AIPS3 */
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x309f0000 0x10000>;
+			reg = <0x30800000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x30800000 0x30800000 0x400000>,
@@ -1029,7 +1029,7 @@
 
 		bus@32c00000 { /* AIPS4 */
 			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x32df0000 0x10000>;
+			reg = <0x32c00000 0x400000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
-- 
2.17.1

