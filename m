From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] bmips: rename BCM63168 to BCM63268
Date: Sun,  3 Apr 2016 14:00:46 +0200
Message-ID: <1459684846-11308-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

BCM63168 and BCM63268 are very similar and Broadcom refers to them as B=
CM63268
in GPL sources (e.g. 63268_map_part.h).
Use alphabetical order for supported bmips quirks.
Add BCM63268 to devicetree documentation.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
 arch/mips/bmips/setup.c                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Docu=
mentation/devicetree/bindings/mips/brcm/soc.txt
index e58a4f6..aae0b92 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -4,7 +4,7 @@ Required properties:
=20
 - compatible: "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
-              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
+              "brcm,bcm63268", "brcm,bcm6328", "brcm,bcm6358", "brcm,b=
cm6368",
               "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bc=
m7360",
               "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
=20
diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
index 38b5bd5..bfee6ea 100644
--- a/arch/mips/bmips/setup.c
+++ b/arch/mips/bmips/setup.c
@@ -112,10 +112,10 @@ static void bcm6368_quirks(void)
 static const struct bmips_quirk bmips_quirk_list[] =3D {
 	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
 	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
+	{ "brcm,bcm63268",		&bcm6368_quirks			},
 	{ "brcm,bcm6328",		&bcm6328_quirks			},
 	{ "brcm,bcm6358",		&bcm6358_quirks			},
 	{ "brcm,bcm6368",		&bcm6368_quirks			},
-	{ "brcm,bcm63168",		&bcm6368_quirks			},
 	{ },
 };
=20
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
