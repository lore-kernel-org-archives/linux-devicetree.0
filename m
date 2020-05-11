Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019F7C54E8F
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D33B0206F9
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbgEKLGj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:06:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49134 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728638AbgEKLGi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 07:06:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 4422F2A0C9B
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     laurent.pinchart@ideasonboard.com
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be,
        robh+dt@kernel.org, xuwei5@hisilicon.com
Subject: [PATCH v2 4/6] arm64: dts: hisilicon: hikey: fixes to comply with adi,adv7533 DT binding
Date:   Mon, 11 May 2020 13:06:09 +0200
Message-Id: <20200511110611.3142-5-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
References: <20200511110611.3142-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

hi3660-hikey960.dts:
  Define a 'ports' node for 'adv7533: adv7533@39' and the
  'adi,dsi-lanes' property to make it compliant with the adi,adv7533 DT
  binding.

  This fills the requirements to meet the binding requirements,
  remote endpoints are not defined.

hi6220-hikey.dts:
  Change property name s/pd-gpio/pd-gpios, gpio properties should be
  plural. This is just a cosmetic change.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 11 +++++++++++
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts    |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
index e035cf195b19..8c4bfbaf3a80 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
@@ -530,6 +530,17 @@
 		status = "ok";
 		compatible = "adi,adv7533";
 		reg = <0x39>;
+		adi,dsi-lanes = <4>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+			};
+			port@1 {
+				reg = <1>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index c14205cd6bf5..3e47150c05ec 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -516,7 +516,7 @@
 		reg = <0x39>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <1 2>;
-		pd-gpio = <&gpio0 4 0>;
+		pd-gpios = <&gpio0 4 0>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.18.0

