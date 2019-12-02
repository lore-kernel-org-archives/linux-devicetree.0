Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172DBC432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 18:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE10C2073C
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 18:22:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfLBSWa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 13:22:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:35978 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727749AbfLBSWU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Dec 2019 13:22:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F1065AF21;
        Mon,  2 Dec 2019 18:22:18 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        James Tai <james.tai@realtek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH 13/14] arm64: dts: realtek: rtd16xx: Add SB2 and SCPU Wrapper syscon nodes
Date:   Mon,  2 Dec 2019 19:22:03 +0100
Message-Id: <20191202182205.14629-14-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191202182205.14629-1-afaerber@suse.de>
References: <20191202182205.14629-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add syscon mfd nodes for SB2 and SCPU Wrapper to RTD16xx DT.

Cc: James Tai <james.tai@realtek.com>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
index 776efc10bab2..bc88cf749f33 100644
--- a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
@@ -136,6 +136,15 @@
 				ranges = <0x0 0x7000 0x1000>;
 			};
 
+			sb2: syscon@1a000 {
+				compatible = "syscon", "simple-mfd";
+				reg = <0x1a000 0x1000>;
+				reg-io-width = <4>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1a000 0x1000>;
+			};
+
 			misc: syscon@1b000 {
 				compatible = "syscon", "simple-mfd";
 				reg = <0x1b000 0x1000>;
@@ -144,6 +153,15 @@
 				#size-cells = <1>;
 				ranges = <0x0 0x1b000 0x1000>;
 			};
+
+			scpu_wrapper: syscon@1d000 {
+				compatible = "syscon", "simple-mfd";
+				reg = <0x1d000 0x1000>;
+				reg-io-width = <4>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1d000 0x1000>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.16.4

