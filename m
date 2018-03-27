From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  07/12] ARM: shmobile: r8a77470: basic SoC support
Date: Tue, 27 Mar 2018 15:37:18 +0100
Message-ID: <1522161443-54428-8-git-send-email-biju.das@bp.renesas.com>
References: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522161443-54428-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add minimal support for the RZ/G1C (R8A77470) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 arch/arm/mach-shmobile/Kconfig                     | 4 ++++
 arch/arm/mach-shmobile/setup-rcar-gen2.c           | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index d3d1df9..86ac320 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -21,6 +21,8 @@ SoCs:
     compatible = "renesas,r8a7744"
   - RZ/G1E (R8A77450)
     compatible = "renesas,r8a7745"
+  - RZ/G1C (R8A77470)
+    compatible = "renesas,r8a77470"
   - R-Car M1A (R8A77781)
     compatible = "renesas,r8a7778"
   - R-Car H1 (R8A77790)
diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index 280e731..6b91114 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -75,6 +75,10 @@ config ARCH_R8A7745
 	bool "RZ/G1E (R8A77450)"
 	select ARCH_RCAR_GEN2
 
+config ARCH_R8A77470
+	bool "RZ/G1C (R8A77470)"
+	select ARCH_RCAR_GEN2
+
 config ARCH_R8A7778
 	bool "R-Car M1A (R8A77781)"
 	select ARCH_RCAR_GEN1
diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 5561dbe..80de6be 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -73,6 +73,7 @@ void __init rcar_gen2_timer_init(void)
 	shmobile_init_cntvoff();
 
 	if (of_machine_is_compatible("renesas,r8a7745") ||
+	    of_machine_is_compatible("renesas,r8a77470") ||
 	    of_machine_is_compatible("renesas,r8a7792") ||
 	    of_machine_is_compatible("renesas,r8a7794")) {
 		freq = 260000000 / 8;	/* ZS / 8 */
@@ -205,6 +206,7 @@ MACHINE_END
 static const char * const rz_g1_boards_compat_dt[] __initconst = {
 	"renesas,r8a7743",
 	"renesas,r8a7745",
+	"renesas,r8a77470",
 	NULL,
 };
 
-- 
2.7.4
