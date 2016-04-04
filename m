From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH v2] bmips: add support for BCM63268
Date: Mon,  4 Apr 2016 10:11:57 +0200
Message-ID: <1459757517-14897-1-git-send-email-noltari@gmail.com>
References: <1459684846-11308-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1459684846-11308-1-git-send-email-noltari@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This SoC is very similar to BCM63168 and Broadcom usually refers to the=
m as
BCM63268.
Use alphabetical order for bmips quirks.
Add BCM63268 and missing BCM63168 to device tree documentation.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: keep support for BCM63168

 Documentation/devicetree/bindings/mips/brcm/soc.txt | 3 ++-
 arch/mips/bmips/setup.c                             | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Docu=
mentation/devicetree/bindings/mips/brcm/soc.txt
index e58a4f6..7a08c3e 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -4,7 +4,8 @@ Required properties:
=20
 - compatible: "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
-              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
+              "brcm,bcm63168", "brcm,bcm63268", "brcm,bcm6328",
+              "brcm,bcm6358", "brcm,bcm6368",
               "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bc=
m7360",
               "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
=20
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 38b5bd5..7cca770 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -112,10 +112,11 @@ static void bcm6368_quirks(void)
 static const struct bmips_quirk bmips_quirk_list[] =3D {
 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
+	{ "brcm,bcm63168",              &bcm6368_quirks                 },
+	{ "brcm,bcm63268",              &bcm6368_quirks                 },
 	{ "brcm,bcm6328",		&bcm6328_quirks			},
 	{ "brcm,bcm6358",		&bcm6358_quirks			},
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
-	{ "brcm,bcm63168",		&bcm6368_quirks			},
 	{ },
 };
=20
--=20
2.1.4
