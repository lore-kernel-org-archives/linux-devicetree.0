From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/3] dt-bindings: net: btusb: add QCA6174A IDs
Date: Fri, 22 Feb 2019 14:53:44 -0800
Message-ID: <20190222225345.69084-2-briannorris@chromium.org>
References: <20190222225345.69084-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222225345.69084-1-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Rajat Jain <rajatja@google.com>, Robin Murphy <robin.murphy@arm.com>, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

There are two USB PID/VID variations I've seen for this chip, and I want
to utilize the 'interrupts' property defined here already.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
v2:
 * drop leading zeroes from VID
---
 Documentation/devicetree/bindings/net/btusb.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index 37d67926dd6d..b1ad6ee68e90 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -9,6 +9,9 @@ Required properties:
 		 (more may be added later) are:
 
 		  "usb1286,204e" (Marvell 8997)
+		  "usbcf3,e300" (Qualcomm QCA6174A)
+		  "usb4ca,301a" (Qualcomm QCA6174A (Lite-On))
+
 
 Also, vendors that use btusb may have device additional properties, e.g:
 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
-- 
2.21.0.rc0.258.g878e2cd30e-goog
