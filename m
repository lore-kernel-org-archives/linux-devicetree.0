Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1648ACA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 09:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCC17217D9
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 09:44:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="k6bzO1ly"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfKAJov (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 05:44:51 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:37317 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbfKAJov (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 05:44:51 -0400
X-Greylist: delayed 318 seconds by postgrey-1.27 at vger.kernel.org; Fri, 01 Nov 2019 05:44:49 EDT
Received: from mxback13g.mail.yandex.net (mxback13g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:92])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id BF710B210D9;
        Fri,  1 Nov 2019 12:39:29 +0300 (MSK)
Received: from sas2-69645cccb3fe.qloud-c.yandex.net (sas2-69645cccb3fe.qloud-c.yandex.net [2a02:6b8:c08:bd8e:0:640:6964:5ccc])
        by mxback13g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id p9I8LAmAUH-dS1Wu3Z2;
        Fri, 01 Nov 2019 12:39:29 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1572601169;
        bh=UN0pzwk3CX7uZAugr6Kv7p1iduaIAzWnVboku1O5ZF4=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=k6bzO1lyWLSVVsUY+8GFVW7iekwvDCw+JtIDKEKPIroNpVmEZKqTauxHw7lXsTMTZ
         pvioJxOuiE2xGQM/ZcaiNBYH34R04HdRUtp4MNCBSb7H7pJ2JQ5zaJFP3quaiK9KKn
         WoNr/xypPmVR8nmEex9jANgmSVReVyAHv4ke2l2c=
Authentication-Results: mxback13g.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by sas2-69645cccb3fe.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id GY8u6ZZUqg-dRV0rq7b;
        Fri, 01 Nov 2019 12:39:28 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, robh+dt@kernel.org, wens@csie.org
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH] arm64: dts: allwinner: bluetooth for Emlid Neutis N5
Date:   Fri,  1 Nov 2019 12:39:20 +0300
Message-Id: <1572601160-8200-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Emlid Neutis N5 board has AP6212 BT+WiFi chip. This patch is in
line with 8558c6e2 and other commits that add Bluetooth support for
similar boards.

Signed-off-by: Georgii Staroselskii <georgii.staroselskii@emlid.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
index 82f4b44..5bec574 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-emlid-neutis-n5.dtsi
@@ -23,6 +23,8 @@
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
 		post-power-on-delay-ms = <200>;
+		clocks = <&rtc 1>;
+		clock-names = "ext_clock";
 	};
 };
 
@@ -56,5 +58,16 @@
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&rtc 1>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_vcc3v3>;
+		vddio-supply = <&reg_vcc3v3>;
+		shutdown-gpios = <&pio 2 4 GPIO_ACTIVE_HIGH>; /* PC4 */
+		device-wakeup-gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+	};
 };
-- 
2.7.4

