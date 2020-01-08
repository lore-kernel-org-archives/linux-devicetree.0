Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779B2C33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B1472067D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 04:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egCsy8ct"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgAHEUr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 23:20:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35800 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgAHEUr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 23:20:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so918380pgk.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 20:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ieNSOsSOpnj4q/u/rEsAWON6yaOZBpH5DBZCwjMqUes=;
        b=egCsy8ctMqgFUgKw7PbURv7W1BffaIxMGQDselFlo0AxzKV5U0PNX3VwhKyTONsyxS
         9eqE4TpwjAEz9Kk8cKy+rHCwPmeI7iBdTHcVljgzCuCo5ZfzMC6yq/z3IbVEHbkpU3Yq
         DwW0ga6jtWLFHMUQ7wzvbsecqgkPk3njKN6vvkZ/mXduzO+zDv2qvDutrOZLmbRCSIF2
         QzWbVHm8lNNZDiiM4D6cpYnoSEvq48LeuVXibD10jJ9DSdi4yg6clcKgRn3DSIRALHyO
         5GDbPN5WT6Kct/kPMPZSiHmRREYm83tFMC2Pjl1TOWaTtEOOGiby/clTN+TDsqj82sxn
         Ax7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ieNSOsSOpnj4q/u/rEsAWON6yaOZBpH5DBZCwjMqUes=;
        b=QKkD914acKvrTtYGxkBIyBi/4x7UmSHaKScAB+zfbZg/FHYmgYQzFCxjKk9C+/REgw
         Wq2EH0DWaOpgzz5/r/JZSEpoIckiFVAYZEaooad+yug9pdSE6mdXVpnnEzTVE/ApKYeI
         DzB9b9LfZc7f3sVJ32ZW5g4MiW7lL4yif6vD+cWndQKNXjREiOOEjM+qeaSa1yz0d/NS
         /rnz8fFuSMPLpRtfjtGgAjY4gbHQMgVsh9LXV+U8/ASDj95g/lFtjcUgcHC5nfKAzB8L
         KoUcaIemiI+S+qKENg2mX4pbBXSiLfHIW+hmERxoHaF4T7BcobEfO7TCLAPUaZ2VhduV
         nxrw==
X-Gm-Message-State: APjAAAWhlV+OmqJeGGEQYx7flHgUt0Sj1m7SVIOqtkZMIGKMgGMwc0j8
        YOfbXvhALq5clJ8pm1TFR06SXEcG
X-Google-Smtp-Source: APXvYqwX1+AkSJZKhcVWFSRebEkfGF/lWQNJzL44Lhhyk/Wvx/HuJ2QTscsmY6/SwEh0nrmoSRXaDA==
X-Received: by 2002:a63:e17:: with SMTP id d23mr3233679pgl.173.1578457246963;
        Tue, 07 Jan 2020 20:20:46 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id p12sm1133478pjo.5.2020.01.07.20.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 20:20:46 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 1/4] arm64: dts: allwinner: a64: add CPU clock to CPU0-3 nodes
Date:   Tue,  7 Jan 2020 20:20:15 -0800
Message-Id: <20200108042018.571251-2-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108042018.571251-1-anarsoul@gmail.com>
References: <20200108042018.571251-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add CPU clock to the CPU nodes since it is a prerequisite for enabling
DVFS.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 5e3f16c3b706..77b33087866d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -90,6 +90,8 @@ cpu0: cpu@0 {
 			reg = <0>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
 		};
 
 		cpu1: cpu@1 {
@@ -98,6 +100,8 @@ cpu1: cpu@1 {
 			reg = <1>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
 		};
 
 		cpu2: cpu@2 {
@@ -106,6 +110,8 @@ cpu2: cpu@2 {
 			reg = <2>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
 		};
 
 		cpu3: cpu@3 {
@@ -114,6 +120,8 @@ cpu3: cpu@3 {
 			reg = <3>;
 			enable-method = "psci";
 			next-level-cache = <&L2>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
 		};
 
 		L2: l2-cache {
-- 
2.24.1

