Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B97FC33C9E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F188C21D7D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579302529;
	bh=8xlvhCCUA/nss3N6EkWl3St9eTCymATgYm4WBGdmKxA=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=ZU4YNerdt1JgozssQ91j+1N30IbldKSsOH+sQl5aBHvkVVeM0ydOSW6FS8rY1r4uG
	 lRQn4E/Ga3uYklgCZ4b1MjrcDastSRkJs1mCPbURCjmkBBLc+kt1ChninlbnRaotyc
	 ptjSIpoIx4fS6zEEgFX7PwfzNChySgPbQPV8oM3Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgAQXIs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 18:08:48 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41009 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgAQXIs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 18:08:48 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so23971055otc.8
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 15:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N8hdqMaq/doeD5Jkd2oGwg+Pp4eYPs3dtRKwLCY0trE=;
        b=kQtygkFHeC9qf5Womv+EGo0DCgLZ6eiEDL8exAWIv25UdOKtLHVwrE0If7BaMqfIhn
         Il4ST/yUj/hQ8CAWnNZhHOD0ya9zlXrQKxvaOGGe1yd1m0Ch78AUeiL285Vg8t+HdZhB
         i+HgnXxfTiz7Sibfa2soJhsRz9ELQ2yAskWjtgb19yPPsXG+WTKvNIe1Nj28LzK+kJUX
         Sqxm4yGeyqWIVmL7mFdI6Q/+NzJQ7N6O8e16wUuk9pZjsNOzAxppYY+/GMkIy+hDLith
         sOHY3E3VIjDl+cWBegq/TUWmgUgHwmR9YA+xKoOl91bEYPwW9Ar+Rp8Pop8c2YIzdfoQ
         6Bvw==
X-Gm-Message-State: APjAAAUGqo1xxP9BdpD06zaekajfoeQiQx5DMosxNqvKIlb2AJw3BaAE
        XfJCk+RnDJV6rtkR+OKBFQ8fNMk=
X-Google-Smtp-Source: APXvYqy5FudxbtjStY+FSbTxvAWAunOp3IIrdLrcs3cvXtAk51klBz+Xzr/0v1q7xhXtqafaDKqvwQ==
X-Received: by 2002:a05:6830:1f13:: with SMTP id u19mr7694105otg.237.1579302526924;
        Fri, 17 Jan 2020 15:08:46 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id i13sm8260533oik.7.2020.01.17.15.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 15:08:46 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH] arm: at91: dts: Kill off "simple-panel" compatibles
Date:   Fri, 17 Jan 2020 17:08:45 -0600
Message-Id: <20200117230845.25190-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"simple-panel" is a Linux driver and has never been an accepted upstream
compatible string, so remove it.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi | 2 +-
 arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts   | 2 +-
 arch/arm/boot/dts/at91sam9n12ek.dts           | 2 +-
 arch/arm/boot/dts/at91sam9x5dm.dtsi           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
index df0f0cc575c1..bea920b192b6 100644
--- a/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
+++ b/arch/arm/boot/dts/at91-dvk_su60_somc_lcm.dtsi
@@ -17,7 +17,7 @@
 	};
 
 	panel: panel {
-		compatible = "winstar,wf70gtiagdng0", "innolux,at070tn92", "simple-panel";
+		compatible = "winstar,wf70gtiagdng0", "innolux,at070tn92";
 		backlight = <&backlight>;
 		power-supply = <&vcc_lcd_reg>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
index af4969485c88..4d7cee569ff2 100644
--- a/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
+++ b/arch/arm/boot/dts/at91-sama5d4_ma5d4evk.dts
@@ -136,7 +136,7 @@
 
 	panel: panel {
 		/* Actually Ampire 800480R2 */
-		compatible = "foxlink,fl500wvr00-a0t", "simple-panel";
+		compatible = "foxlink,fl500wvr00-a0t";
 		backlight = <&backlight>;
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/at91sam9n12ek.dts b/arch/arm/boot/dts/at91sam9n12ek.dts
index ea5cef0b0974..d36e162a8817 100644
--- a/arch/arm/boot/dts/at91sam9n12ek.dts
+++ b/arch/arm/boot/dts/at91sam9n12ek.dts
@@ -238,7 +238,7 @@
 	};
 
 	panel: panel {
-		compatible = "qiaodian,qd43003c0-40", "simple-panel";
+		compatible = "qiaodian,qd43003c0-40";
 		backlight = <&backlight>;
 		power-supply = <&panel_reg>;
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/at91sam9x5dm.dtsi b/arch/arm/boot/dts/at91sam9x5dm.dtsi
index 7f00c1f57b90..a9278038af3b 100644
--- a/arch/arm/boot/dts/at91sam9x5dm.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5dm.dtsi
@@ -27,7 +27,7 @@
 	};
 
 	panel: panel {
-		compatible = "foxlink,fl500wvr00-a0t", "simple-panel";
+		compatible = "foxlink,fl500wvr00-a0t";
 		backlight = <&backlight>;
 		power-supply = <&panel_reg>;
 		#address-cells = <1>;
-- 
2.20.1

