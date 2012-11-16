From: Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] of/fdt: NULL-terminate the root node path
Date: Fri, 16 Nov 2012 15:14:38 +0000
Message-ID: <1353078878-13566-1-git-send-email-catalin.marinas@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Commit 509b7455 (of/fdt: Don't copy garbage after "/" in root node path)
sets the path length to 0 to ignore any garbage after "/" in the root
node path. This has the side effect of also ignoring '\0' at the end of
the root node path. This patch sets the ignores the garbage by setting
the last character to '\0' and length to 1.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <rob.herring@calxeda.com>
---

The patch is against linux-next, not sure whether mainline will get the
same commit number. Please feel free to fold it into the original patch,
whichever is easier. Without this I can't boot arm64, doesn't populate
the platform devices.

 drivers/of/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 73fb8c0..d9b2207 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -186,7 +186,8 @@ static unsigned long unflatten_dt_node(struct boot_para=
m_header *blob,
 =09=09=09 */
 =09=09=09fpsize =3D 1;
 =09=09=09allocl =3D 2;
-=09=09=09l =3D 0;
+=09=09=09l =3D 1;
+=09=09=09*pathp =3D '\0';
 =09=09} else {
 =09=09=09/* account for '/' and path size minus terminal 0
 =09=09=09 * already in 'l'
