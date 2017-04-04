From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 8/8] ARM: ux500: Add vendor prefix to tps61052 node
Date: Tue,  4 Apr 2017 11:30:36 -0400
Message-ID: <20170404153036.6651-9-javier@osg.samsung.com>
References: <20170404153036.6651-1-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170404153036.6651-1-javier@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The tps61052 device node doesn't have a vendor prefix
in its compatible string, fix it by adding one.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/ste-hrefprev60.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ste-hrefprev60.dtsi b/arch/arm/boot/dts/ste-hrefprev60.dtsi
index 5882a2606ac3..3f14b4df69b4 100644
--- a/arch/arm/boot/dts/ste-hrefprev60.dtsi
+++ b/arch/arm/boot/dts/ste-hrefprev60.dtsi
@@ -30,7 +30,7 @@
 
 		i2c@80004000 {
 			tps61052@33 {
-				compatible = "tps61052";
+				compatible = "ti,tps61052";
 				reg = <0x33>;
 			};
 
-- 
2.9.3
