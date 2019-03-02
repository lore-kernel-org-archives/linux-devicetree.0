From: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 01/15] clk: sunxi-ng: Mark msgbox clocks as critical
Date: Fri,  1 Mar 2019 22:29:37 -0600
Message-ID: <20190302042951.53671-2-samuel@sholland.org>
References: <20190302042951.53671-1-samuel@sholland.org>
Reply-To: samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDA2PU6QWEARBQ4N5DRQKGQELBT7BVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190302042951.53671-1-samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
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

Signed-off-by: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
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
index 932836d26e2b..22c8de3546e6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -349,8 +349,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
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
index 139e8389615c..02b10ba6f4ce 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -339,8 +339,9 @@ static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 static SUNXI_CCU_GATE(bus_dma_clk, "bus-dma", "psi-ahb1-ahb2",
 		      0x70c, BIT(0), 0);
 
+/* Used for communication between firmware components at runtime */
 static SUNXI_CCU_GATE(bus_msgbox_clk, "bus-msgbox", "psi-ahb1-ahb2",
-		      0x71c, BIT(0), 0);
+		      0x71c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE(bus_spinlock_clk, "bus-spinlock", "psi-ahb1-ahb2",
 		      0x72c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
index a4fa2945f230..d4eeef69de52 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
@@ -262,8 +262,9 @@ static SUNXI_CCU_GATE(bus_de_fe_clk,	"bus-de-fe",	"ahb1",
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
index c7bf814dfd2b..66d958ba86cc 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -274,8 +274,9 @@ static SUNXI_CCU_GATE(bus_de_fe_clk,	"bus-de-fe",	"ahb1",
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
index 2d6555d73170..24166609fd03 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -346,8 +346,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
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
index e71e2451c2e3..66777bff86e0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -280,8 +280,9 @@ static SUNXI_CCU_GATE(bus_de_clk,	"bus-de",	"ahb1",
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
index 8936ef87652c..40b16cdcc98b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -755,8 +755,9 @@ static SUNXI_CCU_GATE(bus_usb_clk,	"bus-usb",	"ahb1",
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
2.19.2
