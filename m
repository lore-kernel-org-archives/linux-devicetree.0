From: megous@megous.com
Subject: [RESEND PATCH 1/5] dt-bindings: net: Add compatible for BCM4345C5
 bluetooth device
Date: Fri, 23 Aug 2019 12:31:35 +0200
Message-ID: <20190823103139.17687-2-megous@megous.com>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ondrej Jirman <megous@megous.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

This is present in the AP6526 WiFi/Bluetooth 5.0 module.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c26f4e11037c..4fa00e2eafcf 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -13,6 +13,7 @@ Required properties:
    * "brcm,bcm20702a1"
    * "brcm,bcm4330-bt"
    * "brcm,bcm43438-bt"
+   * "brcm,bcm4345c5"
 
 Optional properties:
 
-- 
2.23.0
