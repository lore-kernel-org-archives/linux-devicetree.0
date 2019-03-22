From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] of: use correct function prototype for of_overlay_fdt_apply()
Date: Fri, 22 Mar 2019 13:23:41 +1300
Message-ID: <20190322002342.24831-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: Hamish Martin <hamish.martin@alliedtelesis.co.nz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

When CONFIG_OF_OVERLAY is not enabled the fallback stub for
of_overlay_fdt_apply() does not match the prototype for the case when
CONFIG_OF_OVERLAY is enabled. Update the stub to use the correct
function prototype.

Fixes: commit 39a751a4cb7e ("of: change overlay apply input data from unf=
lattened to FDT")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 include/linux/of.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index e240992e5cb6..28797e1a9982 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1449,7 +1449,8 @@ int of_overlay_notifier_unregister(struct notifier_=
block *nb);
=20
 #else
=20
-static inline int of_overlay_fdt_apply(void *overlay_fdt, int *ovcs_id)
+static inline int of_overlay_fdt_apply(void *overlay_fdt, u32 overlay_fd=
t_size,
+				       int *ovcs_id)
 {
 	return -ENOTSUPP;
 }
--=20
2.21.0
