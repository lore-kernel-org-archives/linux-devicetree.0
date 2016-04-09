From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH] bmips: add support for BCM63268
Date: Sat,  9 Apr 2016 12:57:19 +0200
Message-ID: <1460199439-18796-1-git-send-email-noltari@gmail.com>
References: <1459757517-14897-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459757517-14897-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This SoC is very similar to BCM63168 and Broadcom usually refers to the=
m as
BCM63268.
Add BCM63268 and missing BCM63168 to device tree documentation.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 v3: use numerical order
 v2: keep support for BCM63168

 Documentation/devicetree/bindings/mips/brcm/soc.txt | 1 +
 arch/mips/bmips/setup.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Docu=
mentation/devicetree/bindings/mips/brcm/soc.txt
index e58a4f6..4a7e030 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible: "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
               "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
+              "brcm,bcm63168", "brcm,bcm63268",
               "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bc=
m7360",
               "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
=20
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 38b5bd5..92d0483 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -116,6 +116,7 @@ static const struct bmips_quirk bmips_quirk_list[] =
=3D {
 	{ "brcm,bcm6358",		&bcm6358_quirks			},
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
 	{ "brcm,bcm63168",		&bcm6368_quirks			},
+	{ "brcm,bcm63268",		&bcm6368_quirks			},
 	{ },
 };
=20
--=20
2.1.4
