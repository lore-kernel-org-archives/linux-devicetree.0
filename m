From: Yunzhi Li <lyz@rock-chips.com>
Subject: [PATCH v1 2/3] Documentation: dt-bindings: add dt binding info for dwc2 reset control
Date: Tue, 11 Aug 2015 15:56:26 +0800
Message-ID: <1439279787-26674-2-git-send-email-lyz@rock-chips.com>
References: <1439279787-26674-1-git-send-email-lyz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439279787-26674-1-git-send-email-lyz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jwerner@chromium.org, dianders@chromium.org
Cc: huangtao@rock-chips.com, cf@rock-chips.com, hl@rock-chips.com, wulf@rock-chips.com, gregory.herrero@intel.com, linux-rockchip@lists.infradead.org, Yunzhi Li <lyz@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, Paul Zimmerman <paulz@synopsys.com>, Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yunzhi Li <lyz@rock-chips.com>
---

 Documentation/devicetree/bindings/usb/dwc2.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index fd132cb..6a84099 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -24,6 +24,12 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+- resets: A list of phandle + reset-specifier pairs for the resets listed in
+  reset-names
+- reset-names: Should contain the following:
+  "ahb": AHB interface reset
+  "phy": PHY reset
+  "con": controller reset
 
 Example:
 
-- 
2.0.0
