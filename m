From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH 2/8] ARM: dts: artpec: use 1 GiB RAM
Date: Tue, 20 Feb 2018 18:00:43 +0100
Message-ID: <20180220170049.22809-3-niklas.cassel@axis.com>
References: <20180220170049.22809-1-niklas.cassel@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220170049.22809-1-niklas.cassel@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-kernel@axis.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There has never been an artpec6 devboard produced
with less than 1 GiB RAM.

Increase the default value to 1 GiB RAM, so that we
can netboot with large initramfs without going OOM.

Signed-off-by: Niklas Cassel <niklas.cassel@axis.com>
---
 arch/arm/boot/dts/artpec6-devboard.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/artpec6-devboard.dts b/arch/arm/boot/dts/artpec6-devboard.dts
index 9dfe845694cf..502f3de6dc5b 100644
--- a/arch/arm/boot/dts/artpec6-devboard.dts
+++ b/arch/arm/boot/dts/artpec6-devboard.dts
@@ -26,7 +26,7 @@
 
 	memory {
 		device_type = "memory";
-		reg = <0x0 0x10000000>;
+		reg = <0x0 0x40000000>;
 	};
 };
 
-- 
2.14.2
