Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CB1C43215
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:58:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F00242073C
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 04:58:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JyHSTtEq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbfLCE6F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 23:58:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44050 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbfLCE6E (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 23:58:04 -0500
Received: by mail-wr1-f68.google.com with SMTP id q10so1918903wrm.11
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 20:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ovwMqTunBsTOC/CqSHDUi6kBW0F5coIGszg1T7U+mmc=;
        b=JyHSTtEqJjBunwy7X6C8u0emC8YOkh//6Huc6rS1+xcedJ3UizEM5ZQ/oF0Z3ZbzoG
         LBMVE4VHnS2u5w9kuBLc9nuYTSq+3/h+m+K1OMNqtstxQaMjMMTjUjWCNSVmwSAjx5TS
         o/Vb5DygLM1Qe07q6f75jMdySlqCy26WdiP2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ovwMqTunBsTOC/CqSHDUi6kBW0F5coIGszg1T7U+mmc=;
        b=cLKlhhi8KAZCY9zyiM3zJkFrlk1kJ/L2cq+Ekkri+ijqVFoT7z0GU+sbliHYD5BVZv
         np4QGsBfhk6w06k3hg4lV1Qgfp3c+CBXRU3bGw7gZhi3FNDclAp0GzR8znAbk8fPcnP9
         K6SCBynpGsPyMgXXKtMKkhBikl48H65PspXPkmlK3sdvEvNadtB0IkTUa/BBm/R8Sw5+
         mhL7+PkgnpDToYQBMyzRisYGTz/B7tWVQFcH/LA10XAnpHatzPbwnIeEBju26S+gDGn2
         iFh9cfKlqObdmb9Zcg4kHxASHcD0HgCiG2tlCXWftTnswzdUCqFr4+MmAOzRFxmejYVn
         YLaw==
X-Gm-Message-State: APjAAAUg9bAtMqiWmbS1xkw3HaLqeu1FiGnY27NT4tSZI5KOIA3ViEM0
        DaVSauzm+BOa38XOAUVk3cSG+g==
X-Google-Smtp-Source: APXvYqz9UG6+uRLARgRC4h9K9ngpNM/yLeVYRm7UAEuQb7CC8hxxsUUj/XOI97lXY4CwxOy7a5RBnw==
X-Received: by 2002:adf:f108:: with SMTP id r8mr2821276wro.390.1575349082332;
        Mon, 02 Dec 2019 20:58:02 -0800 (PST)
Received: from mannams-OptiPlex-7010.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id k4sm1667807wmk.26.2019.12.02.20.57.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Dec 2019 20:58:01 -0800 (PST)
From:   Srinath Mannam <srinath.mannam@broadcom.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>,
        Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v3 6/6] arm64: dts: Change PCIe INTx mapping for NS2
Date:   Tue,  3 Dec 2019 10:27:06 +0530
Message-Id: <1575349026-8743-7-git-send-email-srinath.mannam@broadcom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575349026-8743-1-git-send-email-srinath.mannam@broadcom.com>
References: <1575349026-8743-1-git-send-email-srinath.mannam@broadcom.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ray Jui <ray.jui@broadcom.com>

Change the PCIe INTx mapping to model the 4 INTx interrupts in the
IRQ domain of the iProc PCIe controller itself

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 15f7b0e..489bfd5 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -117,8 +117,11 @@
 		dma-coherent;
 
 		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic 0 GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie0_intc 0>,
+				<0 0 0 2 &pcie0_intc 1>,
+				<0 0 0 3 &pcie0_intc 2>,
+				<0 0 0 4 &pcie0_intc 3>;
 
 		linux,pci-domain = <0>;
 
@@ -140,6 +143,13 @@
 		phy-names = "pcie-phy";
 
 		msi-parent = <&v2m0>;
+		pcie0_intc: interrupt-controller {
+			compatible = "brcm,iproc-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	pcie4: pcie@50020000 {
@@ -148,8 +158,11 @@
 		dma-coherent;
 
 		#interrupt-cells = <1>;
-		interrupt-map-mask = <0 0 0 0>;
-		interrupt-map = <0 0 0 0 &gic 0 GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie4_intc 0>,
+				<0 0 0 2 &pcie4_intc 1>,
+				<0 0 0 3 &pcie4_intc 2>,
+				<0 0 0 4 &pcie4_intc 3>;
 
 		linux,pci-domain = <4>;
 
@@ -171,6 +184,13 @@
 		phy-names = "pcie-phy";
 
 		msi-parent = <&v2m0>;
+		pcie4_intc: interrupt-controller {
+			compatible = "brcm,iproc-intc";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 
 	pcie8: pcie@60c00000 {
-- 
2.7.4

