From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v4 1/2] Documentation: dt-bindings: add dt binding info for dwc2 dr_mode
Date: Wed,  6 Aug 2014 09:01:49 +0800
Message-ID: <1407286910-30906-2-git-send-email-kever.yang@rock-chips.com>
References: <1407286910-30906-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407286910-30906-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>
Cc: dianders@chromium.org, Heiko Stuebner <heiko@sntech.de>, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, olof@lixom.net, sonnyrao@chromium.org, wulf@rock-chips.com, lyz@rock-chips.com, jg1.han@samsung.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Porter <mporter@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, Paul Zimmerman <Paul.Zimmerman@synopsys.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Indicate that the generic dr_mode binding should be used for dwc2.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
- Split out dr_mode and rk3288 bindings.

 Documentation/devicetree/bindings/usb/dwc2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 467ddd1..3cf92b6 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -15,6 +15,8 @@ Optional properties:
 - phys: phy provider specifier
 - phy-names: shall be "usb2-phy"
 Refer to phy/phy-bindings.txt for generic phy consumer properties
+- dr_mode: shall be one of "host", "peripheral" and "otg"
+  Refer to usb/generic.txt
 
 Example:
 
-- 
1.9.1
