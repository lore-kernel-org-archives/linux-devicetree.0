From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 4/6] pinctrl: dt-binding: document berlin4ct SoC pinctrl
Date: Mon, 21 Sep 2015 18:04:18 +0800
Message-ID: <1442829860-4647-5-git-send-email-jszhang@marvell.com>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add berlin4ct to existing berlin pinctrl device tree binding.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
index a8bb5e2..0580860 100644
--- a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
@@ -20,7 +20,10 @@ Required properties:
 	"marvell,berlin2cd-soc-pinctrl",
 	"marvell,berlin2cd-system-pinctrl",
 	"marvell,berlin2q-soc-pinctrl",
-	"marvell,berlin2q-system-pinctrl"
+	"marvell,berlin2q-system-pinctrl",
+	"marvell,berlin4ct-avio-pinctrl",
+	"marvell,berlin4ct-sm-pinctrl",
+	"marvell,berlin4ct-soc-pinctrl"
 
 Required subnode-properties:
 - groups: a list of strings describing the group names.
-- 
2.5.3
