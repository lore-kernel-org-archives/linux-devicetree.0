From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 2/4] of: mtd: prepare helper reading NAND ECC algo from DT
Date: Wed, 23 Mar 2016 11:19:01 +0100
Message-ID: <1458728343-1234-3-git-send-email-zajec5@gmail.com>
References: <1458728343-1234-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458728343-1234-1-git-send-email-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

NAND subsystem is being slightly reworked to store ECC details in
separated fields. In future we'll want to add support for more DT
properties as specifying every possible setup with a single
"nand-ecc-mode" is a pretty bad idea.
To allow this let's add a helper that will support something like
"nand-ecc-algo" in future. Right now we use it for keeping backward
compatibility.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/of_mtd.c    | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/of_mtd.h |  6 ++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed..15d056e 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -50,6 +50,42 @@ int of_get_nand_ecc_mode(struct device_node *np)
 EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
=20
 /**
+ * of_get_nand_ecc_algo - Get nand ecc algorithm for given device_node
+ * @np:	Pointer to the given device_node
+ *
+ * The function gets ecc algorithm and returns its enum value, or errn=
o in error
+ * case.
+ */
+int of_get_nand_ecc_algo(struct device_node *np)
+{
+	const char *pm;
+	int err;
+
+	/*
+	 * TODO: Read ECC algo OF property and map it to enum nand_ecc_algo.
+	 * It's not implemented yet as currently NAND subsystem ignores
+	 * algorithm explicitly set this way. Once it's handled we should
+	 * document & support new property.
+	 */
+
+	/*
+	 * For backward compatibility we also read "nand-ecc-mode" checking
+	 * for some obsoleted values that were specifying ECC algorithm.
+	 */
+	err =3D of_property_read_string(np, "nand-ecc-mode", &pm);
+	if (err < 0)
+		return err;
+
+	if (!strcasecmp(pm, "soft"))
+		return NAND_ECC_HAMMING;
+	else if (!strcasecmp(pm, "soft_bch"))
+		return NAND_ECC_BCH;
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(of_get_nand_ecc_algo);
+
+/**
  * of_get_nand_ecc_step_size - Get ECC step size associated to
  * the required ECC strength (see below).
  * @np:	Pointer to the given device_node
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index e266caa..0f6aca5 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -13,6 +13,7 @@
=20
 #include <linux/of.h>
 int of_get_nand_ecc_mode(struct device_node *np);
+int of_get_nand_ecc_algo(struct device_node *np);
 int of_get_nand_ecc_step_size(struct device_node *np);
 int of_get_nand_ecc_strength(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
@@ -25,6 +26,11 @@ static inline int of_get_nand_ecc_mode(struct device=
_node *np)
 	return -ENOSYS;
 }
=20
+static inline int of_get_nand_ecc_algo(struct device_node *np)
+{
+	return -ENOSYS;
+}
+
 static inline int of_get_nand_ecc_step_size(struct device_node *np)
 {
 	return -ENOSYS;
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
