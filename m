From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v4 4/6] pinctrl: dt-binding: document berlin4ct SoC pinctrl
Date: Fri, 9 Oct 2015 16:17:07 +0800
Message-ID: <1444378629-3057-5-git-send-email-jszhang@marvell.com>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com
Cc: catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Add berlin4ct to existing berlin pinctrl device tree binding.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
index a8bb5e2..f8fa28c 100644
--- a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
@@ -20,7 +20,10 @@ Required properties:
 	"marvell,berlin2cd-soc-pinctrl",
 	"marvell,berlin2cd-system-pinctrl",
 	"marvell,berlin2q-soc-pinctrl",
-	"marvell,berlin2q-system-pinctrl"
+	"marvell,berlin2q-system-pinctrl",
+	"marvell,berlin4ct-avio-pinctrl",
+	"marvell,berlin4ct-soc-pinctrl",
+	"marvell,berlin4ct-system-pinctrl"
 
 Required subnode-properties:
 - groups: a list of strings describing the group names.
-- 
2.6.1
