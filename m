Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF857CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 03:47:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 876A521783
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 03:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571716048;
	bh=ds7psSxIIlIrK3y1oh6ABP6ZlZjg4cASFL3Vo5Wi4xc=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=LG8pCu+qvI34hI4EyJmVOV7Cpc/D0c+ogePZD81eN7zlbSqs/SLRmc2kCCK8x5ffK
	 ZxXi50S7jX3arWehrkTKjqtmydUbRQxQCWDawe8dExG07DFkgcJqNge2EPrlHXnyyo
	 6CYRdObI8HE2UHnux4oTCSlbNSUPc5flm98ip9wo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfJVDr1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 23:47:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:59212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730084AbfJVDr1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 23:47:27 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D148520659;
        Tue, 22 Oct 2019 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571716047;
        bh=ds7psSxIIlIrK3y1oh6ABP6ZlZjg4cASFL3Vo5Wi4xc=;
        h=From:To:Cc:Subject:Date:From;
        b=wh7UpRpqokFpFEAdB7dIJPj6yPt4zP+D155iVyIi3MpJtsA9VDl67Z1O25VwscCqm
         YjC4LjwKLunC/GCee/vLg7WmMa6+g7mJjyQu4N2xprmPQmYGaNr6qc4b0MnPbT3hZM
         BtLr3eCGpmhVZFWoA7Kjo/84OJ5e6ky9DakDCSjw=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH] arm64: agilex: enable USB and LEDs on agilex devkit
Date:   Mon, 21 Oct 2019 22:47:17 -0500
Message-Id: <20191022034717.25351-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable USB on the Agilex devkit. Also the Agilex devkit will use the
same daughter card that is used on Stratix10, thus it map the same
LEDs and GPIOs.

pushbutton PB_SW0 = gpio1.io4
pushbutton PB_SW1 = gpio1.io5
LED HPS_LED0      = gpio1.io20
LED HPS_LED1      = gpio1.io19
LED HPS_LED2      = gpio1.io21

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../boot/dts/intel/socfpga_agilex_socdk.dts   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index 866205ac7d51..e794a12ba7c5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -18,6 +18,24 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+		hps0 {
+			label = "hps_led0";
+			gpios = <&portb 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps1 {
+			label = "hps_led1";
+			gpios = <&portb 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		hps2 {
+			label = "hps_led2";
+			gpios = <&portb 21 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	memory {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
@@ -70,6 +88,11 @@
 	status = "okay";
 };
 
+&usb0 {
+	status = "okay";
+	disable-over-current;
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.20.0

