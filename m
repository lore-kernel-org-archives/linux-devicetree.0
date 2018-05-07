From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 04/14] ARM: dts: sun7i-a20: Use dedicated SRAM controller
 compatible
Date: Mon,  7 May 2018 14:44:50 +0200
Message-ID: <20180507124500.20434-5-paul.kocialkowski@bootlin.com>
References: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180507124500.20434-1-paul.kocialkowski@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Alexandre Courbot <gnurou@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Smitha T Murthy <smitha.t@samsung.com>, Randy Li <ayaka@soulik.info>, Rob Herring <robh+dt@kernel.org>, Hugues Fruchet <hugues.fruchet@st.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "David S . Miller" <davem@da>
List-Id: devicetree@vger.kernel.org

Use the newly-introduced SRAM controller compatible for the A20 instead
of its A10 fashion.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index e529e4ff2174..b179e05408e4 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -240,7 +240,7 @@
 		ranges;
 
 		sram-controller@1c00000 {
-			compatible = "allwinner,sun4i-a10-sram-controller";
+			compatible = "allwinner,sun7i-a20-sram-controller";
 			reg = <0x01c00000 0x30>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.16.3
