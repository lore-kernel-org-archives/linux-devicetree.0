From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/3] dt-bindings: reset: oxnas: Update for OX820
Date: Wed,  5 Oct 2016 17:23:36 +0200
Message-ID: <20161005152336.467-4-narmstrong@baylibre.com>
References: <20161005152336.467-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161005152336.467-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add new compatible string for reset and sys-ctrl for the Oxford
Semiconductor OX820 Support.
Drop the OX810SE indices since they moved in a dedicated include file.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/reset/oxnas,reset.txt      | 39 ++--------------------
 1 file changed, 3 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/oxnas,reset.txt b/Documentation/devicetree/bindings/reset/oxnas,reset.txt
index 6f06db9..df0488e 100644
--- a/Documentation/devicetree/bindings/reset/oxnas,reset.txt
+++ b/Documentation/devicetree/bindings/reset/oxnas,reset.txt
@@ -5,45 +5,12 @@ Please also refer to reset.txt in this directory for common reset
 controller binding usage.
 
 Required properties:
-- compatible: Should be "oxsemi,ox810se-reset"
+- compatible: Should be "oxsemi,ox810se-reset" or "oxsemi,ox820-reset"
 - #reset-cells: 1, see below
 
 Parent node should have the following properties :
-- compatible: Should be "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-
-For OX810SE, the indices are :
- - 0 : ARM
- - 1 : COPRO
- - 2 : Reserved
- - 3 : Reserved
- - 4 : USBHS
- - 5 : USBHSPHY
- - 6 : MAC
- - 7 : PCI
- - 8 : DMA
- - 9 : DPE
- - 10 : DDR
- - 11 : SATA
- - 12 : SATA_LINK
- - 13 : SATA_PHY
- - 14 : Reserved
- - 15 : NAND
- - 16 : GPIO
- - 17 : UART1
- - 18 : UART2
- - 19 : MISC
- - 20 : I2S
- - 21 : AHB_MON
- - 22 : UART3
- - 23 : UART4
- - 24 : SGDMA
- - 25 : Reserved
- - 26 : Reserved
- - 27 : Reserved
- - 28 : Reserved
- - 29 : Reserved
- - 30 : Reserved
- - 31 : BUS
+- compatible: Should be "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd" or
+	"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
 
 example:
 
-- 
2.7.0
