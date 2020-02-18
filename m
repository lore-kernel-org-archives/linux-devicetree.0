Return-Path: <SRS0=1Pza=4G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C257C3404B
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E76F2173E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Feb 2020 21:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgBRVcR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Feb 2020 16:32:17 -0500
Received: from foss.arm.com ([217.140.110.172]:34728 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgBRVcR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Feb 2020 16:32:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13BDBFEC;
        Tue, 18 Feb 2020 13:32:17 -0800 (PST)
Received: from DESKTOP-VLO843J.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C433C3F68F;
        Tue, 18 Feb 2020 13:32:15 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, heiko@sntech.de
Cc:     alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        pgwipeout@gmail.com
Subject: [PATCH v2 1/3] ASoC: dt-bindings: Make RK3328 codec GPIO explicit
Date:   Tue, 18 Feb 2020 21:31:58 +0000
Message-Id: <5f7a399dea8a9dedef57f6f99f0f6ab1c1fdc56a.1581376744.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581376744.git.robin.murphy@arm.com>
References: <cover.1581376744.git.robin.murphy@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Existing RK3328 codec drivers have overloaded the GRF phandle to assume
implicit control of the limited-function GPIO_MUTE pin, which is usually
used to enable an external audio line driver IC. Since this pin has a
proper binding of its own (see gpio/rockchip,rk3328-grf-gpio.txt), make
a GPIO explicit in the codec binding too. This will help avoid ambiguity
on boards that use that pin for some other purpose.

(and while touching the example, enforce the "don't include status" rule)

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: no change

 .../devicetree/bindings/sound/rockchip,rk3328-codec.txt    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
index 2469588c7ccb..1ecd75d2032a 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
@@ -10,6 +10,11 @@ Required properties:
 - clock-names: should be "pclk".
 - spk-depop-time-ms: speak depop time msec.
 
+Optional properties:
+
+- mute-gpios: GPIO specifier for external line driver control (typically the
+              dedicated GPIO_MUTE pin)
+
 Example for rk3328 internal codec:
 
 codec: codec@ff410000 {
@@ -18,6 +23,6 @@ codec: codec@ff410000 {
 	rockchip,grf = <&grf>;
 	clocks = <&cru PCLK_ACODEC>;
 	clock-names = "pclk";
+	mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
 	spk-depop-time-ms = 100;
-	status = "disabled";
 };
-- 
2.17.1

