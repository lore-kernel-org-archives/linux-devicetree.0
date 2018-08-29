From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH v1] arm64: dts: dwc3: Add description of 'configure-gfladj'
Date: Wed, 29 Aug 2018 15:33:24 +0800
Message-ID: <20180829073324.36866-1-yinbo.zhu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: yinbo.zhu@nxp.com, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: xiaobo.xie@nxp.com, Ran Wang <ran.wang_1@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, festevam@gmail.com
List-Id: devicetree@vger.kernel.org

This patch is to add description of 'configure-gfladj' to binding
so that configuring devicetree

Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 3e4c38b..40c6568 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -101,6 +101,7 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - configure-gfladj: determine whether frame length adjustment is required or not.
 
  - in addition all properties from usb-xhci.txt from the current directory are
    supported as well
-- 
1.7.1
