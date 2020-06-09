Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4315DC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 206F520801
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 17:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uwRr61Gz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbgFIRBc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 13:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731388AbgFIRBb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 13:01:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49008C05BD1E
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 10:01:31 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u13so3553966wml.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Cvuk1pzHbG73fVpgq0GIbQHX6L3n9Uv+zTQtj358BA=;
        b=uwRr61GzH4KclzZid9/CXcHwf5eoYtMWZzDY0qkmOR68uaurvPCMsPc+62J1hfQ9Ml
         JPFr+vJDWqDrjyK/KP2giDZ7DcMe6alW76klQ9MBCzAa6z3idL10fzSqXzUZw8p+oPRp
         kRwNxapDbK7Q9Eq3NCzU3UZk+7ZpGTOo+71+ACmA/UJtlB4SD1svTnV2j4pfk+dWoVNE
         3Ox04F449fKhozwb8JYK+5CiQuJ9ALvWHpurtFA4KSIVbpcB5OxaKB8oJhmMsQFBJisz
         35P64bVXWW8k1YXik9sGtMBFYFoQSrkYw9ZGKhEVyeRQMxiyhMSItUOQrKr6zGwSCcSd
         o5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Cvuk1pzHbG73fVpgq0GIbQHX6L3n9Uv+zTQtj358BA=;
        b=cxGZLnQ1ETNYT1po52hrVRcV4ysO28RQT81GmJVGgYza8LQGyrKigbbA7PYJiA1sK+
         y3vGmMBOXfNV+OdRp4XS8SPPHprDbXw44FYfS4LmiQAsnXIebafri/rM0ObiykUNAsnt
         b/O/NEnvch0cZdrVDN/1FqkqUuZAVgvqtubtE0S58zjTEgykqwFlk5spywxpwVnV00t3
         rZHAy7e9mSKZd+mcvEqyOvMT9QEi8Pye5lEDC98ZJXoj/Wy5JYRaPOd65QOCZmGFhCOj
         khM7OAfqgX9YNHWC9JGbO5lBQKYZGEcnXgnEMeGw59/hhux35EgE8vHP+fgJZ9tCPflh
         d2vQ==
X-Gm-Message-State: AOAM532ph6Bs/Ld6KBNAEVrAAPFlAMbfXJOzzPP14uHFN38PxLwKxdA8
        jAfOItxCBGgtKy66o2AG8RY=
X-Google-Smtp-Source: ABdhPJznae/iSDLO0rgV3IEKwGuUJLoEsyMYlY026KsP9G5XR0ZEcKguisUvEa8wR+Y69QU9c/sc8w==
X-Received: by 2002:a7b:cc82:: with SMTP id p2mr4942530wma.101.1591722089455;
        Tue, 09 Jun 2020 10:01:29 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id k26sm3618927wmi.27.2020.06.09.10.01.28
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 09 Jun 2020 10:01:29 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
Cc:     Matthew Hagan <mnhagan88@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: NSP: Disable PL330 by default, add dma-coherent property
Date:   Tue,  9 Jun 2020 17:58:29 +0100
Message-Id: <c19be985a3e7abc8ac05fc30678475aeadb73c50.1591719237.git.mnhagan88@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently the PL330 is enabled by default. However if left in IDM reset, as is
the case with the Meraki and Synology NSP devices, the system will hang when
probing for the PL330's AMBA peripheral ID. We therefore should be able to
disable it in these cases.

The PL330 is also included among of the list of peripherals put into coherent
mode, so "dma-coherent" has been added here as well.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm-nsp.dtsi     | 4 +++-
 arch/arm/boot/dts/bcm958522er.dts  | 4 ++++
 arch/arm/boot/dts/bcm958525er.dts  | 4 ++++
 arch/arm/boot/dts/bcm958525xmc.dts | 4 ++++
 arch/arm/boot/dts/bcm958622hr.dts  | 4 ++++
 arch/arm/boot/dts/bcm958623hr.dts  | 4 ++++
 arch/arm/boot/dts/bcm958625hr.dts  | 4 ++++
 arch/arm/boot/dts/bcm958625k.dts   | 4 ++++
 8 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index da6d70f09ef1..920c0f561e5c 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -200,7 +200,7 @@ uart1: serial@400 {
 			status = "disabled";
 		};
 
-		dma@20000 {
+		dma: dma@20000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x20000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
@@ -215,6 +215,8 @@ dma@20000 {
 			clocks = <&iprocslow>;
 			clock-names = "apb_pclk";
 			#dma-cells = <1>;
+			dma-coherent;
+			status = "disabled";
 		};
 
 		sdio: sdhci@21000 {
diff --git a/arch/arm/boot/dts/bcm958522er.dts b/arch/arm/boot/dts/bcm958522er.dts
index 8c388eb8a08f..7be4c4e628e0 100644
--- a/arch/arm/boot/dts/bcm958522er.dts
+++ b/arch/arm/boot/dts/bcm958522er.dts
@@ -58,6 +58,10 @@ gpio-restart {
 
 /* USB 3 support needed to be complete */
 
+&dma {
+	status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958525er.dts b/arch/arm/boot/dts/bcm958525er.dts
index c339771bb22e..515164dacc4d 100644
--- a/arch/arm/boot/dts/bcm958525er.dts
+++ b/arch/arm/boot/dts/bcm958525er.dts
@@ -58,6 +58,10 @@ gpio-restart {
 
 /* USB 3 support needed to be complete */
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958525xmc.dts b/arch/arm/boot/dts/bcm958525xmc.dts
index 1c72ec8288de..09092bbd7b63 100644
--- a/arch/arm/boot/dts/bcm958525xmc.dts
+++ b/arch/arm/boot/dts/bcm958525xmc.dts
@@ -58,6 +58,10 @@ gpio-restart {
 
 /* XHCI support needed to be complete */
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958622hr.dts b/arch/arm/boot/dts/bcm958622hr.dts
index 96a021cebd97..3c46f5003401 100644
--- a/arch/arm/boot/dts/bcm958622hr.dts
+++ b/arch/arm/boot/dts/bcm958622hr.dts
@@ -58,6 +58,10 @@ gpio-restart {
 
 /* USB 3 and SLIC support needed to be complete */
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958623hr.dts b/arch/arm/boot/dts/bcm958623hr.dts
index b2c7f21d471e..6e5c580defe5 100644
--- a/arch/arm/boot/dts/bcm958623hr.dts
+++ b/arch/arm/boot/dts/bcm958623hr.dts
@@ -58,6 +58,10 @@ gpio-restart {
 
 /* USB 3 and SLIC support needed to be complete */
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
index 536fb24f38bb..0509c57a8366 100644
--- a/arch/arm/boot/dts/bcm958625hr.dts
+++ b/arch/arm/boot/dts/bcm958625hr.dts
@@ -69,6 +69,10 @@ &i2c0 {
 	status = "okay";
 };
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
index 3fcca12d83c2..1557491c1751 100644
--- a/arch/arm/boot/dts/bcm958625k.dts
+++ b/arch/arm/boot/dts/bcm958625k.dts
@@ -48,6 +48,10 @@ memory@60000000 {
 	};
 };
 
+&dma {
+        status = "okay";
+};
+
 &amac0 {
 	status = "okay";
 };
-- 
2.25.4

