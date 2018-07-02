From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 1/3] dt-bindings: Add vendor prefix for kingdisplay
Date: Mon,  2 Jul 2018 12:32:27 +0200
Message-ID: <20180702103229.3952-2-heiko@sntech.de>
References: <20180702103229.3952-1-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702103229.3952-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, seanpaul@chromium.org, briannorris@chromium.org, hl@rock-chips.com, nickey.yang@rock-chips.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

From: Nickey Yang <nickey.yang@rock-chips.com>

Kingdisplay Technology Co., Ltd, established in
China Shenzhen in 2006, is a national high-tech
enterprise specializing in the R&D, manufacturing
and marketing of TFT-LCM and touch panel.

Signed-off-by: Nickey Yang <nickey.yang@rock-chips.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7cad066191ee..5a379c462e07 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -188,6 +188,7 @@ keymile	Keymile GmbH
 khadas	Khadas
 kiebackpeter    Kieback & Peter GmbH
 kinetic Kinetic Technologies
+kingdisplay	King & Display Technology Co., Ltd.
 kingnovel	Kingnovel Technology Co., Ltd.
 koe	Kaohsiung Opto-Electronics Inc.
 kosagi	Sutajio Ko-Usagi PTE Ltd.
-- 
2.17.0
