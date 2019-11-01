Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FD2CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 09:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A21821734
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 09:49:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=emlid.com header.i=@emlid.com header.b="WdGBQFDo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbfKAJtS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 05:49:18 -0400
Received: from forward100j.mail.yandex.net ([5.45.198.240]:51843 "EHLO
        forward100j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbfKAJtS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 05:49:18 -0400
Received: from mxback1j.mail.yandex.net (mxback1j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10a])
        by forward100j.mail.yandex.net (Yandex) with ESMTP id 8504E50E1839;
        Fri,  1 Nov 2019 12:43:45 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id ueOKE66uVU-hiH0HCV1;
        Fri, 01 Nov 2019 12:43:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlid.com; s=mail; t=1572601425;
        bh=6STKUVn3hs66m/B2u/OEo0OqpFI5/3aIr59jZz5/T2E=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=WdGBQFDof5hH+PCdpBaEYo7mLVeAis2GxYnJgnc1WVRRKoKkm3mGgLaHLGZjnmslp
         s/BglP7lcYRpqnFIPOahraENV8kw+bgRePHmb920IQ4SreCpDMwt6z+S1oYn3ppfbR
         VnoruJLEnHy9EXPSuu6vFGxX2iNsiWvJwWj6pseM=
Authentication-Results: mxback1j.mail.yandex.net; dkim=pass header.i=@emlid.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id 8sDgF13QBw-hhUu6OCQ;
        Fri, 01 Nov 2019 12:43:44 +0300
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (Client certificate not present)
From:   Georgii Staroselskii <georgii.staroselskii@emlid.com>
To:     mripard@kernel.org, robh+dt@kernel.org, wens@csie.org
Cc:     linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Georgii Staroselskii <georgii.staroselskii@emlid.com>
Subject: [PATCH v2] arm64: dts: allwinner: bluetooth for Emlid Neutis N5
Date:   Fri,  1 Nov 2019 12:43:33 +0300
Message-Id: <1572601413-10353-1-git-send-email-georgii.staroselskii@emlid.com>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Emlid Neutis N5 board has AP6212 BT+WiFi chip. This patch is in
line with 8558c6e21ceb ("ARM: dts: sun8i: h3: bluetooth for Banana Pi
M2 Zero board") and other commits that add Bluetooth support for
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

