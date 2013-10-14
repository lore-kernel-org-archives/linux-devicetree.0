From: Majunath Goudar <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: CCI : Fix implicit declaration of function error
Date: Mon, 14 Oct 2013 15:52:27 +0530
Message-ID: <1381746147-13830-1-git-send-email-manju.goudar@lge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nataraja.km-Hm3cg6mZ9cc@public.gmane.org, Majunath Goudar <manju.goudar-Hm3cg6mZ9cc@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds a inline dummy implementations of_find_matching_node()
in "#ifdef CONFIG_OF" else part. Without this patch,build system can
lead to issues. This was discovered during randconfig testing,in which
ARM_CCI was enabled w/o CONFIG_OF being enabled,leading to the followin=
g error:

CC      drivers/bus/arm-cci.o
drivers/bus/arm-cci.c: In function =E2=80=98cci_probe=E2=80=99:
drivers/bus/arm-cci.c:971:2: error: implicit declaration of function
=E2=80=98of_find_matching_node=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
cc1: some warnings being treated as errors
make[2]: *** [drivers/bus/arm-cci.o] Error 1
make[1]: *** [drivers/bus] Error 2
make: *** [drivers] Error 2

Signed-off-by: Manjunath Goudar <manju.goudar-Hm3cg6mZ9cc@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 include/linux/of.h |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index f95aee3..2c57aa2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -340,6 +340,13 @@ int of_device_is_stdout_path(struct device_node *d=
n);
=20
 #else /* CONFIG_OF */
=20
+static inline struct device_node *of_find_matching_node(
+	struct device_node *from,
+	const struct of_device_id *matches)
+{
+	return NULL;
+}
+
 static inline const char* of_node_full_name(struct device_node *np)
 {
 	return "<no-node>";
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
