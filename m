From: fugang.duan@nxp.com
Subject: [PATCH RESEND 1/1] dt-bindings: serial: lpuart: add the clock requirement for imx8qxp
Date: Thu,  4 Jul 2019 21:43:55 +0800
Message-ID: <20190704134355.2402-1-fugang.duan@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: gregkh@linuxfoundation.org, festevam@gmail.com, daniel.baluta@gmail.com, fugang.duan@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Add the baud clock requirement for imx8qxp.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
index 21483ba..3495eee 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.txt
@@ -13,7 +13,10 @@ Required properties:
 - reg : Address and length of the register set for the device
 - interrupts : Should contain uart interrupt
 - clocks : phandle + clock specifier pairs, one for each entry in clock-names
-- clock-names : should contain: "ipg" - the uart clock
+- clock-names : For vf610/ls1021a/imx7ulp, "ipg" clock is for uart bus/baud
+  clock. For imx8qxp lpuart, "ipg" clock is bus clock that is used to access
+  lpuart controller registers, it also requires "baud" clock for module to
+  receive/transmit data.
 
 Optional properties:
 - dmas: A list of two dma specifiers, one for each entry in dma-names.
-- 
2.7.4
