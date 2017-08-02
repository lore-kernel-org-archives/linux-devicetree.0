From: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH 2/3] dt-bindings: usb: keystone-usb: Update bindings pm and
 clocks properties
Date: Wed, 2 Aug 2017 15:17:23 -0500
Message-ID: <20170802201724.11439-3-fcooper@ti.com>
References: <20170802201724.11439-1-fcooper@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170802201724.11439-1-fcooper@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, ssantosh@kernel.org, linux@armlinux.org.uk, balbi@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
List-Id: devicetree@vger.kernel.org

Update varous properties to properly indicate their requirement depending
on the SoC.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 Documentation/devicetree/bindings/usb/keystone-usb.txt | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/keystone-usb.txt b/Documentation/devicetree/bindings/usb/keystone-usb.txt
index 60527d3..307531b 100644
--- a/Documentation/devicetree/bindings/usb/keystone-usb.txt
+++ b/Documentation/devicetree/bindings/usb/keystone-usb.txt
@@ -12,8 +12,22 @@ Required properties:
    MPU.
  - ranges: allows valid 1:1 translation between child's address space and
    parent's address space.
- - clocks: Clock IDs array as required by the controller.
- - clock-names: names of clocks correseponding to IDs in the clock property.
+
+SoC-specific Required Properties:
+The following are mandatory properties for Keystone 2 66AK2HK, 66AK2L and 66AK2E
+SoCs only:
+
+- clocks:		Clock IDs array as required by the controller.
+- clock-names:		names of clocks correseponding to IDs in the clock
+			property.
+
+
+The following are mandatory properties for Keystone 2 66AK2G SoCs only:
+
+- power-domains:	Should contain a phandle to a PM domain provider node
+			and an args specifier containing the USB device id
+			value. This property is as per the binding,
+			Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
 
 Sub-nodes:
 The dwc3 core should be added as subnode to Keystone DWC3 glue.
-- 
2.9.4.dirty
