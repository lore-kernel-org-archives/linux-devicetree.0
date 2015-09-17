From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 04/09] ARM: shmobile: r8a7793 boot address update
Date: Thu, 17 Sep 2015 15:33:19 +0900
Message-ID: <20150917063319.26016.37729.sendpatchset@little-apple>
References: <20150917063240.26016.93772.sendpatchset@little-apple>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150917063240.26016.93772.sendpatchset@little-apple>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, keita.kobayashi.ym@renesas.com, horms@verge.net.au, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Extend the R-Car Gen2 PM code to include r8a7793 boot address
configuration information. r8a7793 boots from ICRAM1.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes from V2:
 - New patch

 arch/arm/mach-shmobile/pm-rcar-gen2.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- 0001/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ work/arch/arm/mach-shmobile/pm-rcar-gen2.c	2015-09-16 22:08:12.610513000 +0900
@@ -28,6 +28,7 @@
 /* On-chip RAM */
 #define MERAM		0xe8080000
 #define RAM		0xe6300000
+#define ICRAM1		0xe63c0000
 
 /* SYSC */
 #define SYSCIER 0x0c
@@ -78,10 +79,12 @@ void __init rcar_gen2_pm_init(void)
 	if (of_machine_is_compatible("renesas,r8a7790")) {
 		boot_vector_addr = MERAM;
 		syscier = 0x013111ef;
-
 	} else if (of_machine_is_compatible("renesas,r8a7791")) {
 		boot_vector_addr = RAM;
 		syscier = 0x00111003;
+	} else if (of_machine_is_compatible("renesas,r8a7793")) {
+		boot_vector_addr = ICRAM1;
+		syscier = 0x00111003;
 	}
 
 	/* RAM for jump stub, because BAR requires 256KB aligned address */
