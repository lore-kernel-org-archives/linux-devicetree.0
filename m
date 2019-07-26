From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 02/17] ARM: dts: aspeed-g5: Use recommended generic node name
 for SDMC
Date: Fri, 26 Jul 2019 15:09:44 +0930
Message-ID: <20190726053959.2003-3-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-aspeed@lists.ozlabs.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, Stefan M Schaeckeler <sschaeck@cisco.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The EDAC is a sub-function of the SDRAM Memory Controller. Rename the
node to the appropriate generic node name.

Cc: Stefan M Schaeckeler <sschaeck@cisco.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7723afc7c249..6e5b0c493f16 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -199,7 +199,7 @@
 			#size-cells = <1>;
 			ranges;
 
-			edac: sdram@1e6e0000 {
+			edac: memory-controller@1e6e0000 {
 				compatible = "aspeed,ast2500-sdram-edac";
 				reg = <0x1e6e0000 0x174>;
 				interrupts = <0>;
-- 
2.20.1
