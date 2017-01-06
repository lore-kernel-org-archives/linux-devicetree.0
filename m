From: Wenyou Yang <wenyou.yang@atmel.com>
Subject: [PATCH 2/3] doc: binding: add new compatible for SDRAM/DDR Controller
Date: Fri, 6 Jan 2017 14:59:46 +0800
Message-ID: <20170106065947.30631-3-wenyou.yang@atmel.com>
References: <20170106065947.30631-1-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170106065947.30631-1-wenyou.yang@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Russell King <linux@arm.linux.org.uk>, Nicolas Ferre <nicolas.ferre@atmel.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@microchip.com>, Wenyou Yang <wenyou.yang@atmel.com>
List-Id: devicetree@vger.kernel.org

Add the new compatible "atmel,sama5d4-ddramc" for the SDRAM/DDR
Controller.

Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
---

 Documentation/devicetree/bindings/arm/atmel-at91.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.txt b/Documentation/devicetree/bindings/arm/atmel-at91.txt
index 29737b9b616e..9b5de6397666 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.txt
@@ -111,6 +111,7 @@ RAMC SDRAM/DDR Controller required properties:
 			"atmel,at91sam9260-sdramc",
 			"atmel,at91sam9g45-ddramc",
 			"atmel,sama5d3-ddramc",
+			"atmel,sama5d4-ddramc",
 - reg: Should contain registers location and length
 
 Examples:
-- 
2.11.0
