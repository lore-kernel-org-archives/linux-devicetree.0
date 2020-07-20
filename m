Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF529C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C18F2068F
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 10:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="R3xW78P+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgGTK7f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 06:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728348AbgGTK7f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 06:59:35 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9877C0619D2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:59:34 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id l6so8519174plt.7
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2020 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NV2nv0m/i4PWrK4r7Y/F/y8REceyZBWN4KHSSee/EVw=;
        b=R3xW78P+619xgW437IQlUC8v2vkTtoeUwA6HMKwDMcXthJEOLbHGKWBHScwB9ymMRF
         pHJ3Fkq0QWbkPqaGk6ZcI7yblpdUkQk3WFwiB4Yr6UOuN4EPanK3hXNR1I3Wa58FZeEB
         3u+ALj8+OMP0m7hTLIhtKhhjQcS3SO/C0EdIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NV2nv0m/i4PWrK4r7Y/F/y8REceyZBWN4KHSSee/EVw=;
        b=lRiyLEOMkbD9ACrcD74/7VGQyz9sK7hq0jN+SACc3+Yf3jM4Gf2e8OdPt1hdj2IVOk
         qC8ReXDocBFtyrkhVgDTNBAbE7C5JrRI6E2jVPqE010yHxjqepEW4QS8ngB8zseOA21+
         T/UUNEW2GLYB9cimj3Eg0r2hhSjldA9Og+GQU00YIt03zKc49m9+5bJxNE51gDlGigG/
         JkiKLa/zGLQ+GZKTwsiFATamS1U8+6wi6eUPLPtIC1lYpcxfz75489s9Ik3BHImBhWze
         nzIez2XqCehaxXiAuvdJUWpS/zH3YvieOkWEX7k5T6DBsBqWSWvXt5/W3cL3Mbvnkpzn
         QlTQ==
X-Gm-Message-State: AOAM5329uvCZMfShtEcIv264MlCiyyPrkiPjnjq7g/dfPmLm3I4ZXIlW
        m6ALeikibtnqzaAQPeqaPlSmQA==
X-Google-Smtp-Source: ABdhPJzFvPMmvpy2zrXoDgPh7VwnXAfVEjNvw+4sm45X9CkVVdWN+xdzon3EKx0JIi+K87Pj4k16ZA==
X-Received: by 2002:a17:90a:f6d8:: with SMTP id er24mr21704466pjb.203.1595242774120;
        Mon, 20 Jul 2020 03:59:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:8c21:db7b:4558:fba3])
        by smtp.gmail.com with ESMTPSA id b8sm10817049pjd.5.2020.07.20.03.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 03:59:32 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        William Wu <william.wu@rock-chips.com>
Subject: [PATCH v3] ARM: dts: rockchip: Add usb host0 ohci node for rk3288
Date:   Mon, 20 Jul 2020 16:28:46 +0530
Message-Id: <20200720105846.367776-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

rk3288 and rk3288w have a usb host0 ohci controller.

Although rk3288 ohci doesn't actually work on hardware, but
rk3288w ohci can work well.

So add usb host0 ohci node in rk3288 dtsi and the quirk in
ohci platform driver will disable ohci on rk3288.

Cc: William Wu <william.wu@rock-chips.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none

 arch/arm/boot/dts/rk3288.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 0cd88774db95..f0774d9afb67 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -614,7 +614,16 @@ usb_host0_ehci: usb@ff500000 {
 		status = "disabled";
 	};
 
-	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
+	/* NOTE: doesn't work on RK3288, but fixed on RK3288W */
+	usb_host0_ohci: usb@ff520000 {
+		compatible = "generic-ohci";
+		reg = <0x0 0xff520000 0x0 0x100>;
+		interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_USBHOST0>;
+		phys = <&usbphy1>;
+		phy-names = "usb";
+		status = "disabled";
+	};
 
 	usb_host1: usb@ff540000 {
 		compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
-- 
2.25.1

