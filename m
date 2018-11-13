From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 2/2] regulator: of: add support for parsing
 regulator-state-standby
Date: Tue, 13 Nov 2018 14:47:37 +0000
Message-ID: <1542120469-15450-3-git-send-email-andrei.stefanescu@microchip.com>
References: <1542120469-15450-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542120469-15450-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

Set the according constraints for PM_SUSPEND_STANDBY case.
Previously, only suspend to mem/disk were taken into
consideration.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 drivers/regulator/of_regulator.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regula=
tor.c
index a732f09..c711a0a 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -20,6 +20,7 @@
 #include "internal.h"
=20
 static const char *const regulator_states[PM_SUSPEND_MAX + 1] =3D {
+	[PM_SUSPEND_STANDBY]	=3D "regulator-state-standby",
 	[PM_SUSPEND_MEM]	=3D "regulator-state-mem",
 	[PM_SUSPEND_MAX]	=3D "regulator-state-disk",
 };
@@ -185,9 +186,11 @@ static void of_get_regulation_constraints(struct devic=
e_node *np,
 		case PM_SUSPEND_MAX:
 			suspend_state =3D &constraints->state_disk;
 			break;
+		case PM_SUSPEND_STANDBY:
+			suspend_state =3D &constraints->state_standby;
+			break;
 		case PM_SUSPEND_ON:
 		case PM_SUSPEND_TO_IDLE:
-		case PM_SUSPEND_STANDBY:
 		default:
 			continue;
 		}
--=20
2.7.4
