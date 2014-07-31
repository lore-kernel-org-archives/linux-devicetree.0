From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v2 1/2] Documentation: dt-bindings: add dt binding info for dwc2 dr_mode
Date: Wed, 30 Jul 2014 17:29:16 -0700
Message-ID: <1406766558-8156-2-git-send-email-kever.yang@rock-chips.com>
References: <963258>
 <1406766558-8156-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406766558-8156-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>
Cc: dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Porter <mporter@linaro.org>, Paul Zimmerman <Paul.Zimmerman@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Indicate that the generic dr_mode binding should be used for dwc2.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2:
- Split out dr_mode and rk3288 bindings.

 Documentation/devicetree/bindings/usb/dwc2.txt |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 94cdc9b..eb80d7b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -18,6 +18,8 @@ Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
 Refer to phy/phy-bindings.txt for generic phy consumer properties
+- dr_mode: shall be one of "host", "peripheral" and "otg"
+  Refer to usb/generic.txt
 
 Example:
 
-- 
1.7.9.5
