From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC/PATCH] of: Mark property::value as const
Date: Tue, 14 Mar 2017 12:23:39 -0700
Message-ID: <148951941955.30407.4217812594792852642@sboyd-linaro>
References: <20170214025040.23955-1-stephen.boyd@linaro.org>
 <58AF6B88.6020709@gmail.com> <58C4EA3C.4070503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58C4EA3C.4070503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Quoting Frank Rowand (2017-03-11 22:27:08)
> Hi Stephen,
> =

> On 02/23/17 15:08, Frank Rowand wrote:
> > On 02/13/17 18:50, Stephen Boyd wrote:
> >> The 'blob' we pass into populate_properties() is marked as const,
> >> but we cast that const away when we assign the result of
> >> fdt_getprop_by_offset() to pp->value. Let's mark value as const
> >> instead, so that code can't mistakenly write to the value of the
> >> property that we've so far advertised as const.
> > =

> > Instead of struct property field value being a pointer into the
> > FDT, I would rather copy the data to newly allocated memory and
> > have value be a pointer to that memory.  This is required if we
> > want to make /sys/firmware/fdt optional, which would allow us to
> > free the memory containing the initial boot FDT.
> > =

> > I also do not want overlay live subtrees to have any pointers
> > into the FDT that was used to populate the overlay, so copying
> > the data solves that problem also.
> > =

> > =

> >> Unfortunately, this exposes a problem with the fdt resolver code,
> >> where we overwrite the value member of properties of phandles to
> >> update them with their final value. Add a comment for now to
> >> indicate where we're potentially writing over const data.
> > =

> > Yes, the resolver code needs to adjust phandle values.
> > =

> > I think I can get rid of the resolver modifying the various phandle
> > values, and instead just modify the phandle value in struct
> > device_node.  At the same time, I think I can also remove all
> > instances of the phandle properties ('linux,phandle', 'ibm,phandle',
> > 'phandle') in the live tree.  These properties should not be
> > accessed directly by any code outside of the device tree framework
> > since the phandle is located in the struct device_node.  A quick
> > grep does not show any such accesses of the phandle properties,
> > but I want to look more closely.
> =

> After reading through a bit of code, I am confident that I can
> modify the resolver code to not modify the various phandle
> property values.  There are a few tentacles reaching out to
> other areas that I will have to fix also.  The biggest task
> for me will be to create some good test code.
> =

> I'll be unavailable this week, so I'll start on it in about
> a week.

Ok. No worries from my side. I'm interested to see how random properties
will be "corrected" without modifying them. I can only assume the plan
is to copy those properties.

The kbuild robot found more cases where marking this as const causes
issues. Please see the updated patch inline.

-----8<-----
From: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] of: Mark property::value as const

The 'blob' we pass into populate_properties() is marked as const,
but we cast that const away when we assign the result of
fdt_getprop_by_offset() to pp->value. Let's mark value as const
instead, so that code can't mistakenly write to the value of the
property that we've so far advertised as const.

Unfortunately, this exposes a problem with the fdt resolver code,
where we overwrite the value member of properties of phandles to
update them with their final value. Add a comment for now to
indicate where we're potentially writing over const data.

You can see such the problem here by loading an overlay dtb into
the kernel via the fw helper method (not direct loading) and
passing that tree to the resolver on an arm64 device. In this
case, the firmware data is vmapped with KERNEL_PAGE_RO and the
resolver code crashes when attempting to write to blob to update
the phandle properties.

Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/base.c     |  2 +-
 drivers/of/fdt.c      | 12 ++++++------
 drivers/of/pdt.c      |  9 +++++----
 drivers/of/resolver.c |  3 +++
 fs/openpromfs/inode.c |  2 +-
 include/linux/of.h    |  2 +-
 6 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index fb6bb855714e..8e5f29b814c9 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1156,7 +1156,7 @@ EXPORT_SYMBOL_GPL(of_property_count_elems_of_size);
  * property data is too small or too large.
  *
  */
-static void *of_find_property_value_of_size(const struct device_node *np,
+static const void *of_find_property_value_of_size(const struct device_node=
 *np,
 			const char *propname, u32 min, u32 max, size_t *len)
 {
 	struct property *prop =3D of_find_property(np, propname, NULL);
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c9b5cac03b36..0635ef5dabf3 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -222,7 +222,7 @@ static void populate_properties(const void *blob,
 =

 		pp->name   =3D (char *)pname;
 		pp->length =3D sz;
-		pp->value  =3D (__be32 *)val;
+		pp->value  =3D val;
 		*pprev     =3D pp;
 		pprev      =3D &pp->next;
 	}
@@ -232,6 +232,7 @@ static void populate_properties(const void *blob,
 	 */
 	if (!has_name) {
 		const char *p =3D nodename, *ps =3D p, *pa =3D NULL;
+		char *b;
 		int len;
 =

 		while (*p) {
@@ -250,13 +251,12 @@ static void populate_properties(const void *blob,
 		if (!dryrun) {
 			pp->name   =3D "name";
 			pp->length =3D len;
-			pp->value  =3D pp + 1;
+			pp->value  =3D b =3D (char *)(pp + 1);
 			*pprev     =3D pp;
 			pprev      =3D &pp->next;
-			memcpy(pp->value, ps, len - 1);
-			((char *)pp->value)[len - 1] =3D 0;
-			pr_debug("fixed up name for %s -> %s\n",
-				 nodename, (char *)pp->value);
+			memcpy(b, ps, len - 1);
+			b[len - 1] =3D 0;
+			pr_debug("fixed up name for %s -> %s\n", nodename, b);
 		}
 	}
 =

diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index d2acae825af9..6984717fcfb7 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -94,6 +94,7 @@ static struct property * __init of_pdt_build_one_prop(pha=
ndle node, char *prev,
 {
 	static struct property *tmp =3D NULL;
 	struct property *p;
+	char *s;
 	int err;
 =

 	if (tmp) {
@@ -109,8 +110,8 @@ static struct property * __init of_pdt_build_one_prop(p=
handle node, char *prev,
 	if (special_name) {
 		strcpy(p->name, special_name);
 		p->length =3D special_len;
-		p->value =3D prom_early_alloc(special_len);
-		memcpy(p->value, special_val, special_len);
+		p->value =3D s =3D prom_early_alloc(special_len);
+		memcpy(s, special_val, special_len);
 	} else {
 		err =3D of_pdt_prom_ops->nextprop(node, prev, p->name);
 		if (err) {
@@ -123,12 +124,12 @@ static struct property * __init of_pdt_build_one_prop=
(phandle node, char *prev,
 		} else {
 			int len;
 =

-			p->value =3D prom_early_alloc(p->length + 1);
+			p->value =3D s =3D prom_early_alloc(p->length + 1);
 			len =3D of_pdt_prom_ops->getproperty(node, p->name,
 					p->value, p->length);
 			if (len <=3D 0)
 				p->length =3D 0;
-			((unsigned char *)p->value)[p->length] =3D '\0';
+			s[p->length] =3D '\0';
 		}
 	}
 	return p;
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 8bf12e904fd2..6d88f8100318 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -93,6 +93,7 @@ static void adjust_overlay_phandles(struct device_node *o=
verlay,
 		if (phandle =3D=3D OF_PHANDLE_ILLEGAL)
 			continue;
 =

+		/* This is bad because we cast away const */
 		*(uint32_t *)prop->value =3D cpu_to_be32(overlay->phandle);
 	}
 =

@@ -154,6 +155,7 @@ static int update_usages_of_a_phandle_reference(struct =
device_node *overlay,
 			goto err_fail;
 		}
 =

+		/* This is bad because we cast away const */
 		*(__be32 *)(prop->value + offset) =3D cpu_to_be32(phandle);
 	}
 =

@@ -222,6 +224,7 @@ static int adjust_local_phandle_references(struct devic=
e_node *local_fixups,
 =

 			phandle =3D be32_to_cpu(*(__be32 *)(prop->value + off));
 			phandle +=3D phandle_delta;
+			/* This is bad because we cast away const */
 			*(__be32 *)(prop->value + off) =3D cpu_to_be32(phandle);
 		}
 	}
diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
index 13215f26e321..68cbb3fddbc2 100644
--- a/fs/openpromfs/inode.c
+++ b/fs/openpromfs/inode.c
@@ -65,7 +65,7 @@ static int is_string(unsigned char *p, int len)
 static int property_show(struct seq_file *f, void *v)
 {
 	struct property *prop =3D f->private;
-	void *pval;
+	const void *pval;
 	int len;
 =

 	len =3D prop->length;
diff --git a/include/linux/of.h b/include/linux/of.h
index f22d4a83ca07..b0253886ef46 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -35,7 +35,7 @@ typedef u32 ihandle;
 struct property {
 	char	*name;
 	int	length;
-	void	*value;
+	const void *value;
 	struct property *next;
 	unsigned long _flags;
 	unsigned int unique_id;
-- =

2.10.0.297.gf6727b0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
