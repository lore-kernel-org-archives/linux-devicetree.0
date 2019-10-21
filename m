Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D4ACA9EAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 19:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD00820B7C
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 19:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b="giqPn43u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbfJUTtc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 15:49:32 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:22042 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730065AbfJUTtc (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 15:49:32 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9LJnMTr020288
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 12:49:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=facebook; bh=bZZBgfxZmiuMICrLj5dloSW3YcH6/5xKkjiVrQLsRvw=;
 b=giqPn43uzjIo2JcLIYm0TXYKEzsBuT6JQRHjm19+GqAcOCwiTrmEnZVvy0a1Sc4eE3Xf
 ZnV76uyRmz2EFcq0t2aEnPtVNXAoCVL5MUtwAX0068Mp3oyKtd1ukeOO57r9vsqZc4ga
 CV/WLRyb+cX/GNgAbMTUuMbg9nWTjDTdQzM= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
        by m0089730.ppops.net with ESMTP id 2vqwyygnhc-6
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 12:49:30 -0700
Received: from 2401:db00:30:600c:face:0:1f:0 (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 21 Oct 2019 12:49:20 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
        id 01AF564C3CB6; Mon, 21 Oct 2019 12:49:20 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From:   Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm1794.vll1.facebook.com
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC:     Tao Ren <taoren@fb.com>
Smtp-Origin-Cluster: vll1c12
Subject: [PATCH 2/4] ARM: dts: aspeed: cmm: include dtsi for common network BMC devices
Date:   Mon, 21 Oct 2019 12:48:18 -0700
Message-ID: <20191021194820.293556-3-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021194820.293556-1-taoren@fb.com>
References: <20191021194820.293556-1-taoren@fb.com>
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_05:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210190
X-FB-Internal: deliver
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patch simplifies CMM device tree by including dtsi to define devices
which are common to Facebook AST2500 Network BMC platforms.

Below is the summary of changes comparing with previous dts version:
  - enabling the second firmware flash.
  - enabling the emmc device in slot #0.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts | 66 +++++--------------
 1 file changed, 16 insertions(+), 50 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
index d519d307aa2a..0a031132594a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
@@ -2,7 +2,7 @@
 // Copyright (c) 2018 Facebook Inc.
 /dts-v1/;
 
-#include "aspeed-g5.dtsi"
+#include "facebook-netbmc-ast2500-common.dtsi"
 
 / {
 	model = "Facebook Backpack CMM BMC";
@@ -53,10 +53,6 @@
 		bootargs = "console=ttyS1,9600n8 root=/dev/ram rw earlyprintk";
 	};
 
-	memory@80000000 {
-		reg = <0x80000000 0x20000000>;
-	};
-
 	ast-adc-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>,
@@ -64,39 +60,7 @@
 	};
 };
 
-&pinctrl {
-	aspeed,external-nodes = <&gfx &lhc>;
-};
-
-/*
- * Update reset type to "system" (full chip) to fix warm reboot hang issue
- * when reset type is set to default ("soc", gated by reset mask registers).
- */
-&wdt1 {
-	status = "okay";
-	aspeed,reset-type = "system";
-};
-
-/*
- * wdt2 is not used by Backpack CMM.
- */
-&wdt2 {
-	status = "disabled";
-};
-
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "bmc";
-#include "facebook-bmc-flash-layout.dtsi"
-	};
-};
-
 &uart1 {
-	status = "okay";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd1_default
 		     &pinctrl_rxd1_default
 		     &pinctrl_ncts1_default
@@ -107,8 +71,6 @@
 };
 
 &uart3 {
-	status = "okay";
-	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_txd3_default
 		     &pinctrl_rxd3_default
 		     &pinctrl_ncts3_default
@@ -123,17 +85,6 @@
 		     &pinctrl_rxd4_default>;
 };
 
-&uart5 {
-	status = "okay";
-};
-
-&mac1 {
-	status = "okay";
-	no-hw-checksum;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
-};
-
 /*
  * I2C bus reserved for communication with COM-E.
  */
@@ -380,3 +331,18 @@
 &ehci1 {
 	status = "okay";
 };
+
+&vhub {
+	status = "disabled";
+};
+
+&sdhci0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sd1_default>;
+};
+
+&sdhci1 {
+	status = "disabled";
+};
-- 
2.17.1

