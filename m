From: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
Subject: [RFC PATCH 2/3] dt: device tree bindings for TI's EMIF sdram
 controller
Date: Sat, 17 Dec 2011 18:50:51 +0530
Message-ID: <1324128052-11220-3-git-send-email-aneesh@ti.com>
References: <1324128052-11220-1-git-send-email-aneesh@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324128052-11220-1-git-send-email-aneesh-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-patch-review-uAqBSO/uNfhBDgjK7y7TUQ@public.gmane.org
Cc: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>, santosh.shilimkar-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

EMIF - External Memory Interface - is an SDRAM controller used in
TI SoCs. EMIF supports, based on the IP revision, one or more of
DDR2/DDR3/LPDDR2 protocols. This binding describes a given instance
of the EMIF IP and memory parts attached to it.

Cc: Rajendra Nayak <rnayak-l0cyMroinI0@public.gmane.org>
Cc: Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>
Signed-off-by: Aneesh V <aneesh-l0cyMroinI0@public.gmane.org>
---
 .../bindings/memory-controllers/ti/emif.txt        |   64 ++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti/emif.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
new file mode 100644
index 0000000..03de3e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ti/emif.txt
@@ -0,0 +1,64 @@
+* EMIF family of TI SDRAM controllers
+
+EMIF - External Memory Interface - is an SDRAM controller used in
+TI SoCs. EMIF supports, based on the IP revision, one or more of
+DDR2/DDR3/LPDDR2 protocols. This binding describes a given instance
+of the EMIF IP and memory parts attached to it.
+
+Required properties:
+- compatible	: One or more of "ti,emif-ddr2", "ti,emif-ddr3", and
+  "ti,emif-lpddr2"
+
+  "ti,emif-ddr2" should be listed of the EMIF controller on this SoC
+  supports DDR2 memories
+
+  "ti,emif-ddr3" should be listed of the EMIF controller on this SoC
+  supports DDR3 memories
+
+  "ti,emif-lpddr2" should be listed of the EMIF controller on this SoC
+  supports LPDDR2 memories
+
+- ti,hwmods	: For TI hwmods processing and omap device creation
+  the value shall be "emif<n>" where <n> is the number of the EMIF
+  instance with base 1.
+
+- phy-type	: string indicating the phy type. Should be one of the
+  following:
+
+  "phy-type-omap4"  : PHY used in OMAP4 family of SoCs
+
+  "phy-type-dm81xx" : PHY used in DM81XX family of SoCs
+
+- ddr-handle	: phandle to a "ddr" node representing the memory part
+  attached to this EMIF instance.
+
+Optional properties:
+- cs1-used		: Have this property if CS1 of this EMIF
+  instance has a memory part attached to it. If there is a memory
+  part attached to CS1, it should be the same type as the one on CS0,
+  so there is no need to give the details of this memory part.
+
+- cal-resistor-per-cs	: Have this property if the board has one
+  calibration resistor per chip-select.
+
+- hw-caps-read-idle-ctrl: Have this property if the controller
+  supports read idle window programming
+
+- hw-caps-ll-interface	: Have this property if the controller
+  has a low latency interface and corresponding interrupt events
+
+- hw-caps-temp-alert	: Have this property if the controller
+  has capability for generating SDRAM temperature alerts
+
+Example:
+
+emif1: emif@0x4c000000 {
+	compatible	= "ti,emif-lpddr2";
+	ti,hwmods	= "emif2";
+	phy-type	= "phy-type-omap4";
+	ddr-handle	= <&elpida_2GS4>;
+	cs1-used;
+	hw-caps-read-idle-ctrl;
+	hw-caps-ll-interface;
+	hw-caps-temp-alert;
+};
-- 
1.7.1
