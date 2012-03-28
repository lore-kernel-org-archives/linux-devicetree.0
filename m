From: Viresh Kumar <viresh.kumar@st.com>
Subject: [PATCH V2 2/7] SPEAr3xx: Add clock instance of usb hosts - ehci and
 ohci 0 and 1
Date: Wed, 28 Mar 2012 15:00:12 +0530
Message-ID: <9cfb8b3efdf277838f4c3adddf4c24d2c770e00b.1332926608.git.viresh.kumar@st.com>
References: <cover.1332926608.git.viresh.kumar@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1332926608.git.viresh.kumar@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Cc: devicetree-discuss@ozlabs.org, spear-devel@list.st.com, viresh.linux@gmail.com, sr@denx.de, plagnioj@jcrosoft.com
List-Id: devicetree@vger.kernel.org

This patch adds following clocks: "usbh.0_clk" and "usbh.1_clk". They are used
by ehci and ohci drivers for SPEAr3xx usb host devices.

Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
---
 arch/arm/mach-spear3xx/clock.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/mach-spear3xx/clock.c b/arch/arm/mach-spear3xx/clock.c
index 6b2cd9b..47d4535 100644
--- a/arch/arm/mach-spear3xx/clock.c
+++ b/arch/arm/mach-spear3xx/clock.c
@@ -412,6 +412,21 @@ static struct clk usbd_clk = {
 	.recalc = &follow_parent,
 };
 
+/* clock derived from usbh clk */
+/* usbh0 clock */
+static struct clk usbh0_clk = {
+	.flags = ALWAYS_ENABLED,
+	.pclk = &usbh_clk,
+	.recalc = &follow_parent,
+};
+
+/* usbh1 clock */
+static struct clk usbh1_clk = {
+	.flags = ALWAYS_ENABLED,
+	.pclk = &usbh_clk,
+	.recalc = &follow_parent,
+};
+
 /* clock derived from ahb clk */
 /* apb masks structure */
 static struct bus_clk_masks apb_masks = {
@@ -679,6 +694,9 @@ static struct clk_lookup spear_clk_lookups[] = {
 	/* clock derived from pll3 clk */
 	CLKDEV_INIT("designware_udc", NULL, &usbd_clk),
 	CLKDEV_INIT(NULL, "usbh_clk", &usbh_clk),
+	/* clock derived from usbh clk */
+	CLKDEV_INIT(NULL, "usbh.0_clk", &usbh0_clk),
+	CLKDEV_INIT(NULL, "usbh.1_clk", &usbh1_clk),
 	/* clock derived from ahb clk */
 	CLKDEV_INIT(NULL, "apb_clk", &apb_clk),
 	CLKDEV_INIT("i2c_designware.0", NULL, &i2c_clk),
-- 
1.7.10.rc2.10.gb47606
