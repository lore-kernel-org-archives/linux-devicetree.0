Return-Path: <SRS0=VFNs=BZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B390C433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 15 Aug 2020 22:07:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77CA20639
	for <linux-devicetree@archiver.kernel.org>; Sat, 15 Aug 2020 22:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHOWHb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 15 Aug 2020 18:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgHOVun (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 15 Aug 2020 17:50:43 -0400
X-Greylist: delayed 348 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 15 Aug 2020 09:41:39 PDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA45AC0A3BF8
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2020 09:41:39 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4BTQsX1JBpzKmfP;
        Sat, 15 Aug 2020 18:35:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id NKSNmlr3lftj; Sat, 15 Aug 2020 18:35:41 +0200 (CEST)
From:   Hauke Mehrtens <hauke@hauke-m.de>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 3/3] MIPS: DTS: img: marduk: Add NXP SC16IS752IPW
Date:   Sat, 15 Aug 2020 18:35:14 +0200
Message-Id: <20200815163514.11631-3-hauke@hauke-m.de>
In-Reply-To: <20200815163514.11631-1-hauke@hauke-m.de>
References: <20200815163514.11631-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.84 / 15.00 / 15.00
X-Rspamd-Queue-Id: 245BE182B
X-Rspamd-UID: 3afc30
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add NXP SC16IS752IPW SPI-UART controller to device tree.

This controller drives 2 UARTs and 7 LEDs on the board.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 51 +++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index 633a41954cc0..f4965a484b72 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -46,6 +46,46 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
+	/* EXT clock from ca8210 is fed to sc16is752 */
+	ca8210_ext_clk: ca8210-ext-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <16000000>;
+		clock-output-names = "ca8210_ext_clock";
+	};
+
+	gpioleds {
+		compatible = "gpio-leds";
+		user1 {
+			label = "marduk:red:user1";
+			gpios = <&sc16is752 0 GPIO_ACTIVE_LOW>;
+		};
+		user2 {
+			label = "marduk:red:user2";
+			gpios = <&sc16is752 1 GPIO_ACTIVE_LOW>;
+		};
+		user3 {
+			label = "marduk:red:user3";
+			gpios = <&sc16is752 2 GPIO_ACTIVE_LOW>;
+		};
+		user4 {
+			label = "marduk:red:user4";
+			gpios = <&sc16is752 3 GPIO_ACTIVE_LOW>;
+		};
+		user5 {
+			label = "marduk:red:user5";
+			gpios = <&sc16is752 4 GPIO_ACTIVE_LOW>;
+		};
+		user6 {
+			label = "marduk:red:user6";
+			gpios = <&sc16is752 5 GPIO_ACTIVE_LOW>;
+		};
+		user7 {
+			label = "marduk:red:user7";
+			gpios = <&sc16is752 6 GPIO_ACTIVE_LOW>;
+		};
+	};
+
 	leds {
 		compatible = "pwm-leds";
 		heartbeat {
@@ -95,6 +135,17 @@
 		extclock-freq = <16000000>;
 		extclock-gpio = <2>;
 	};
+
+	sc16is752: sc16is752@1 {
+		compatible = "nxp,sc16is752";
+		reg = <1>;
+		clocks = <&ca8210_ext_clk>;
+		spi-max-frequency = <4000000>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
 };
 
 &spfi1 {
-- 
2.20.1

