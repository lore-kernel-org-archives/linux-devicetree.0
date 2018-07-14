From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: amlogic: Add support for the Oranth
 Tanix TX3 Mini
Date: Sat, 14 Jul 2018 21:37:23 +0200
Message-ID: <20180714193725.17837-4-martin.blumenstingl@googlemail.com>
References: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, yixun.lan@amlogic.com, robh+dt@kernel.org, carlo@caione.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

The Tanix TX3 Mini is a TV box based on the Amlogic S905W chipset. It
comes with:
- 1 GiB or 2 GiB of DDR3 memory depending on the model
- 8 GB or 16 GB eMMC flash depending on the model
- 802.11 b/g/n wifi (Silicon Valley Microelectronics SSV6051, does not
  support Bluetooth, not supported by any mailine driver)
- an LED 7 segment display with an FD628 controller (not supported by
  any mainline driver)
- HDMI and AV (CVBS) output
- 2x USB (utilizing both USB ports provided by the SoC)
- micro SD card slot

The board seems to be very similar to the P23x and Q20x reference
boards:
- eMMC reset routed to BOOT_9
- the SDIO wifi chip's reset line is routed to GPIOX_6 and the reference
  clock is 32.768KHz on PWM_E
- SD card detection is routed to CARD_6
- vqmmc of all MMC controllers is hard-wired to 1.8V (VDDIO_BOOT)
- uart_AO can be accessed after opening the case and soldering RX, TX
  and GND lines onto the exposed solder points (marked with RX, TX and
  GND)

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 8178da8742c3..b5c2b5c35766 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -90,6 +90,7 @@ Board compatible values (alphabetically, grouped by SoC):
   - "amlogic,p241" (Meson gxl s805x)
 
   - "amlogic,p281" (Meson gxl s905w)
+  - "oranth,tx3-mini" (Meson gxl s905w)
 
   - "amlogic,q200" (Meson gxm s912)
   - "amlogic,q201" (Meson gxm s912)
-- 
2.18.0
