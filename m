From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 5/6] MIPS: BMIPS: Add BCM6362 support
Date: Mon, 13 Jun 2016 09:38:53 +0200
Message-ID: <1465803534-25840-5-git-send-email-noltari@gmail.com>
References: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

BCM6362 is a BMIPS4350 SoC which needs the same fixup as BCM6368 in ord=
er to
enable SMP support.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
 arch/mips/bmips/setup.c                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Docu=
mentation/devicetree/bindings/mips/brcm/soc.txt
index 65bc572..e4e1cd9 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -4,7 +4,7 @@ Required properties:
=20
 - compatible: "brcm,bcm3368", "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
-              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
+              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6362", "brcm,bc=
m6368",
               "brcm,bcm63168", "brcm,bcm63268",
               "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bc=
m7360",
               "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 4fbd2f1..bde62bc 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -115,6 +115,7 @@ static const struct bmips_quirk bmips_quirk_list[] =
=3D {
 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
 	{ "brcm,bcm6328",		&bcm6328_quirks			},
 	{ "brcm,bcm6358",		&bcm6358_quirks			},
+	{ "brcm,bcm6362",		&bcm6368_quirks			},
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
 	{ "brcm,bcm63168",		&bcm6368_quirks			},
 	{ "brcm,bcm63268",		&bcm6368_quirks			},
--=20
2.1.4
