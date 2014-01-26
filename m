From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] of: Fix uninitialized child warning in for_each_child_of_node() if !OF
Date: Sun, 26 Jan 2014 11:21:08 +0100
Message-ID: <1390731668-904-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

If CONFIG_OF=3Dn:

drivers/i2c/i2c-mux.c: In function =E2=80=98i2c_add_mux_adapter=E2=80=99=
:
drivers/i2c/i2c-mux.c:158: warning: =E2=80=98child=E2=80=99 is used uni=
nitialized in this function
drivers/leds/leds-lp55xx-common.c: In function =E2=80=98lp55xx_of_popul=
ate_pdata=E2=80=99:
drivers/leds/leds-lp55xx-common.c:560: warning: =E2=80=98child=E2=80=99=
 is used uninitialized in this function
drivers/leds/leds-pwm.c: In function =E2=80=98led_pwm_probe=E2=80=99:
drivers/leds/leds-pwm.c:89: warning: =E2=80=98child=E2=80=99 is used un=
initialized in this function
drivers/mfd/stmpe.c: In function =E2=80=98stmpe_of_probe=E2=80=99:
drivers/mfd/stmpe.c:1112: warning: =E2=80=98child=E2=80=99 is used unin=
itialized in this function
drivers/mfd/tc3589x.c: In function =E2=80=98tc3589x_probe=E2=80=99:
drivers/mfd/tc3589x.c:324: warning: =E2=80=98child=E2=80=99 is used uni=
nitialized in this function
drivers/power/charger-manager.c: In function =E2=80=98of_cm_parse_desc=E2=
=80=99:
drivers/power/charger-manager.c:1606: warning: =E2=80=98child=E2=80=99 =
is used uninitialized in this function

Introduced by commit 00b2c76a6abbe082bb5afb89ee49ec325e9cd4d2
("include/linux/of.h: make for_each_child_of_node() reference its args =
when
CONFIG_OF=3Dn").

Instead of dropping the "__of_use_dn(child)" again, explicitly set chil=
d
to NULL, to protect against code using child after the loop (child =3D=3D=
 NULL
is the loop termination condition if CONFIG_OF=3Dy).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/of.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 70c64ba17fa5..0bf44f2fe092 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -383,7 +383,7 @@ static inline void __of_use_dn(const struct device_=
node *np)
 }
=20
 #define for_each_child_of_node(parent, child) \
-	while (__of_use_dn(parent), __of_use_dn(child), 0)
+	while (__of_use_dn(parent), child =3D NULL, 0)
=20
 #define for_each_available_child_of_node(parent, child) \
 	while (0)
--=20
1.7.9.5
