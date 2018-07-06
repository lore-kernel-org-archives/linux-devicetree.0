From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 4/4] dt-bindings: net: btusb: DT fix
 s/interrupt-name/interrupt-names/
Date: Fri,  6 Jul 2018 10:32:49 +0200
Message-ID: <20180706083249.25399-5-geert+renesas@glider.be>
References: <20180706083249.25399-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180706083249.25399-1-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, "David S . Miller" <davem@davemloft.net>, Chanho Min <chanho.min@lge.com>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fixes: fd913ef7ce619467 ("Bluetooth: btusb: Add out-of-band wakeup support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v4:
  - Add Acked-by,

v3:
  - New.
---
 Documentation/devicetree/bindings/net/btusb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
index 9c5e663fa1afccaf..828a04695e1be517 100644
--- a/Documentation/devicetree/bindings/net/btusb.txt
+++ b/Documentation/devicetree/bindings/net/btusb.txt
@@ -36,7 +36,7 @@ Following example uses irq pin number 3 of gpio0 for out of band wake-on-bt:
 	compatible = "usb1286,204e";
 	reg = <1>;
 	interrupt-parent = <&gpio0>;
-	interrupt-name = "wakeup";
+	interrupt-names = "wakeup";
 	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
     };
 };
-- 
2.17.1
