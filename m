From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2 4/7] MIPS: BMIPS: Add BCM3368 support
Date: Wed,  3 Aug 2016 11:58:27 +0200
Message-ID: <1470218310-2978-4-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu, john@phrozen.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

BCM3368 has a shared TLB which conflicts with current SMP support, so it must
be disabled for now.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
 arch/mips/bmips/setup.c                             | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
index 4a7e030..65bc572 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -2,7 +2,7 @@
 
 Required properties:
 
-- compatible: "brcm,bcm3384", "brcm,bcm33843"
+- compatible: "brcm,bcm3368", "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
               "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
               "brcm,bcm63168", "brcm,bcm63268",
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index f146d12..4fbd2f1 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -98,7 +98,7 @@ static void bcm6328_quirks(void)
 static void bcm6358_quirks(void)
 {
 	/*
-	 * BCM6358 needs special handling for its shared TLB, so
+	 * BCM3368/BCM6358 need special handling for their shared TLB, so
 	 * disable SMP for now
 	 */
 	bmips_smp_enabled = 0;
@@ -110,6 +110,7 @@ static void bcm6368_quirks(void)
 }
 
 static const struct bmips_quirk bmips_quirk_list[] = {
+	{ "brcm,bcm3368",		&bcm6358_quirks			},
 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
 	{ "brcm,bcm6328",		&bcm6328_quirks			},
-- 
2.1.4
