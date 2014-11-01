From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 1/2] regulator: Document binding for regulator suspend voltage
Date: Fri, 31 Oct 2014 20:52:57 -0700
Message-ID: <1414813978-32233-1-git-send-email-dianders@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: javier.martinez@collabora.co.uk, Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>, Andrew Bresticker <abrestic@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Doug Anderson <dianders@chromium.org>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, carlos@cgarcia.org, rdunlap@infradead.org, jkosina@suse.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch builds upon (291d761 regulator: Document binding for
regulator suspend state for PM state) to allow setting the uV in
addition to the state at suspend time.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
index aaad615..4e7ed76 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -28,6 +28,8 @@ Optional properties:
 - regulator-state-[mem/disk] node has following common properties:
 	- regulator-on-in-suspend: regulator should be on in suspend state.
 	- regulator-off-in-suspend: regulator should be off in suspend state.
+	- regulator-suspend-microvolt: regulator should be set to this voltage
+	  in suspend.
 
 Deprecated properties:
 - regulator-compatible: If a regulator chip contains multiple
-- 
2.1.0.rc2.206.gedb03e5
