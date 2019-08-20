From: Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 01/10] clk: sunxi-ng: Mark msgbox clocks as critical
Date: Mon, 19 Aug 2019 22:23:02 -0500
Message-ID: <20190820032311.6506-2-samuel@sholland.org>
References: <20190820032311.6506-1-samuel@sholland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820032311.6506-1-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jassi Brar <jassisinghbrar@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Corentin Labbe <clabbe.montjoie@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org

The msgbox clock is critical because the hardware it controls is shared
between Linux and system firmware. The message box may be used by the
EL3 secure monitor's PSCI implementation. On 64-bit sunxi SoCs, this is
provided by ARM TF-A; 32-bit SoCs use a different implementation. The
secure monitor uses the message box to forward requests to power
management firmware running on a separate CPU.

It is not enough for the secure monitor to enable the clock each time
Linux performs a SMC into EL3, as both the firmware and Linux can run
concurrently on separate CPUs. So it is never safe for Linux to turn
this clock off, and it should be marked as critical.

At this time, such power management firmware only exists for the A64 and
H5 SoCs.  However, it makes sense to take care of all CCU drivers now
for consistency, and to ease the transition in the future once firmware
is ported to the other SoCs.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c  | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c  | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c  | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c   | 3 ++-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c  | 3 ++-
 7 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index 49bd7a4c015c..045121b50da3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -342,8 +342,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
 		      0x064, BIT(12), 0);
 static SUNXI_CCU_GATE(bus_gpu_clk,	"bus-gpu",	"ahb1",
 		      0x064, BIT(20), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x064, BIT(21), 0);
+		      0x064, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x064, BIT(22), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index aebef4af9861..14f39bc4180f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -340,8 +340,9 @@ static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 static SUNXI_CCU_GATE(bus_dma_clk, "bus-dma", "psi-ahb1-ahb2",
 		      0x70c, BIT(0), 0);
 
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk, "bus-msgbox", "psi-ahb1-ahb2",
-		      0x71c, BIT(0), 0);
+		      0x71c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_spinlock_clk, "bus-spinlock", "psi-ahb1-ahb2",
 		      0x72c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
index 103aa504f6c8..5a28583f57e2 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
@@ -255,8 +255,9 @@ static SUNXI_CCU_GATE(bus_de_fe_clk,	"bus-de-fe",	"ahb1",
 		      0x064, BIT(14), 0);
 static SUNXI_CCU_GATE(bus_gpu_clk,	"bus-gpu",	"ahb1",
 		      0x064, BIT(20), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x064, BIT(21), 0);
+		      0x064, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x064, BIT(22), 0);
 static SUNXI_CCU_GATE(bus_drc_clk,	"bus-drc",	"ahb1",
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 91838cd11037..50cf3726ef30 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -267,8 +267,9 @@ static SUNXI_CCU_GATE(bus_de_fe_clk,	"bus-de-fe",	"ahb1",
 		      0x064, BIT(14), 0);
 static SUNXI_CCU_GATE(bus_gpu_clk,	"bus-gpu",	"ahb1",
 		      0x064, BIT(20), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x064, BIT(21), 0);
+		      0x064, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x064, BIT(22), 0);
 static SUNXI_CCU_GATE(bus_drc_clk,	"bus-drc",	"ahb1",
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index 2b434521c5cc..4ab3a76f4ffa 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -339,8 +339,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
 		      0x064, BIT(12), 0);
 static SUNXI_CCU_GATE(bus_gpu_clk,	"bus-gpu",	"ahb1",
 		      0x064, BIT(20), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x064, BIT(21), 0);
+		      0x064, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x064, BIT(22), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 6b636362379e..7429d3fe8fb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -273,8 +273,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
 		      0x064, BIT(12), 0);
 static SUNXI_CCU_GATE(bus_gpu_clk,	"bus-gpu",	"ahb1",
 		      0x064, BIT(20), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x064, BIT(21), 0);
+		      0x064, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x064, BIT(22), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index dcac1391767f..47d1d18b6f38 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -748,8 +748,9 @@ static SUNXI_CCU_GATE(bus_usb_clk,	"bus-usb",	"ahb1",
 		      0x584, BIT(1), 0);
 static SUNXI_CCU_GATE(bus_gmac_clk,	"bus-gmac",	"ahb1",
 		      0x584, BIT(17), 0);
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk,	"bus-msgbox",	"ahb1",
-		      0x584, BIT(21), 0);
+		      0x584, BIT(21), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE(bus_spinlock_clk,	"bus-spinlock",	"ahb1",
 		      0x584, BIT(22), 0);
 static SUNXI_CCU_GATE(bus_hstimer_clk,	"bus-hstimer",	"ahb1",
-- 
2.21.0
