Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CD3C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C3982076B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 06:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgFAGdx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 02:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFAGdx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 02:33:53 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0D2C061A0E
        for <devicetree@vger.kernel.org>; Sun, 31 May 2020 23:33:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 69FB12A18CC
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
        xuwei5@hisilicon.com, michal.simek@xilinx.com,
        mcoquelin.stm32@gmail.com, marex@denx.de
Subject: [PATCH v3 1/4] ARM: dts: zynq: add port definitions to hdmi-tx@39
Date:   Mon,  1 Jun 2020 08:33:05 +0200
Message-Id: <20200601063308.13045-2-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
References: <20200601063308.13045-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define a 'ports' node for 'adv7511: hdmi-tx@39' to make it compliant with
the adi,adv7511 DT binding.

This fills the minimum requirements to meet the binding requirements,
remote endpoints are not defined.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Michal Simek <michal.simek@xilinx.com>
---
 arch/arm/boot/dts/zynq-zc702.dts | 10 ++++++++++
 arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
index 27cd6cb52f1b..79fd236edded 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -135,6 +135,16 @@
 				adi,input-clock = "1x";
 				adi,input-style = <3>;
 				adi,input-justification = "right";
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+					};
+					port@1 {
+						reg = <1>;
+					};
+				};
 			};
 		};
 
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
index 77943c16d33f..99fa51ba6e93 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -93,6 +93,16 @@
 				adi,input-clock = "1x";
 				adi,input-style = <3>;
 				adi,input-justification = "evenly";
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+					};
+					port@1 {
+						reg = <1>;
+					};
+				};
 			};
 		};
 
-- 
2.18.0

