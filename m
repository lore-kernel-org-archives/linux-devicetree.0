From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 1/2] dt-binding: pinctrl: berlin: document AS370 SoC pinctrl
Date: Fri, 13 Jul 2018 17:46:38 +0800
Message-ID: <20180713174638.5e07f882@xhacker.debian>
References: <20180713174436.4842419e@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713174436.4842419e@xhacker.debian>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Add as370 to existing berlin pinctrl device tree binding.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
index f8fa28ce163e..0a2d5516e1f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
@@ -23,7 +23,8 @@ Required properties:
 	"marvell,berlin2q-system-pinctrl",
 	"marvell,berlin4ct-avio-pinctrl",
 	"marvell,berlin4ct-soc-pinctrl",
-	"marvell,berlin4ct-system-pinctrl"
+	"marvell,berlin4ct-system-pinctrl",
+	"syna,as370-soc-pinctrl"
 
 Required subnode-properties:
 - groups: a list of strings describing the group names.
-- 
2.18.0
