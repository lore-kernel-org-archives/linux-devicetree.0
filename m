From: Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v2 2/2] ARM: dts: da850-lcdk: add unit name for memory node
Date: Wed, 18 Apr 2018 14:54:08 +0530
Message-ID: <20180418092408.2077-3-nsekhar@ti.com>
References: <20180418092408.2077-1-nsekhar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180418092408.2077-1-nsekhar@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>
List-Id: devicetree@vger.kernel.org

Add unit name for memory node to squash the W=1 warning:

arch/arm/boot/dts/da850-lcdk.dtb: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

While at it, drop the device_type property from memory
node since its provided by da850.dtsi already.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
v2: drop device_type property. Add a comment on size of SDRAM.

 arch/arm/boot/dts/da850-lcdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index a1f4d6d5a569..0edf769ea95c 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -21,8 +21,8 @@
 		stdout-path = "serial2:115200n8";
 	};
 
-	memory {
-		device_type = "memory";
+	memory@c0000000 {
+		/* 128 MB DDR2 SDRAM @ 0xc0000000 */
 		reg = <0xc0000000 0x08000000>;
 	};
 
-- 
2.16.2
