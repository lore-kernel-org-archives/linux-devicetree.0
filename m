Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D371C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 13:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 322D62070E
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 13:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732700AbgFWNmm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 09:42:42 -0400
Received: from www1102.sakura.ne.jp ([219.94.129.142]:32967 "EHLO
        www1102.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732631AbgFWNmm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 09:42:42 -0400
X-Greylist: delayed 3256 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jun 2020 09:42:41 EDT
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05NClfui068788;
        Tue, 23 Jun 2020 21:47:41 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Tue, 23 Jun 2020 21:47:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from localhost.localdomain (121.252.232.153.ap.dti.ne.jp [153.232.252.121])
        (authenticated bits=0)
        by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05NClbP6068743
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 23 Jun 2020 21:47:41 +0900 (JST)
        (envelope-from katsuhiro@katsuster.net)
From:   Katsuhiro Suzuki <katsuhiro@katsuster.net>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Heiko Stuebner <heiko@sntech.de>, alsa-devel@alsa-project.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: [PATCH 2/2] dt-bindings: sound: add missing clock description of rk3328 DT schema
Date:   Tue, 23 Jun 2020 21:47:34 +0900
Message-Id: <20200623124734.1736470-2-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623124734.1736470-1-katsuhiro@katsuster.net>
References: <20200623124734.1736470-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds description about "mclk" clock and fixes some errors
which are dt_binding_check reported.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 .../bindings/sound/rockchip,rk3328-codec.yaml     | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
index 08a74e28e483..525b48c2f5de 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
@@ -19,10 +19,12 @@ properties:
   clocks:
     items:
       - description: clock for audio codec
+      - description: clock for I2S master clock
 
   clock-names:
     items:
       - const: pclk
+      - const: mclk
 
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -41,21 +43,28 @@ properties:
       GPIO specifier for external line driver control (typically the
       dedicated GPIO_MUTE pin)
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
   - rockchip,grf
+  - "#sound-dai-cells"
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/rk3328-cru.h>
     codec: codec@ff410000 {
       compatible = "rockchip,rk3328-codec";
       reg = <0xff410000 0x1000>;
-      clocks = <&cru PCLK_ACODEC>;
-      clock-names = "pclk";
+      clocks = <&cru PCLK_ACODECPHY>, <&cru SCLK_I2S1>;
+      clock-names = "pclk", "mclk";
       rockchip,grf = <&grf>;
       mute-gpios = <&grf_gpio 0 GPIO_ACTIVE_LOW>;
-      spk-depop-time-ms = 100;
+      spk-depop-time-ms = <100>;
+      #sound-dai-cells = <0>;
     };
-- 
2.27.0

