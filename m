From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] scripts: dtc: libfdt: fdt_rw.c:  Remove some unused functions
Date: Sun, 21 Dec 2014 18:40:32 +0100
Message-ID: <1419183632-10349-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Removes some functions that are not used anywhere:
fdt_delprop() fdt_add_mem_rsv()

This was partially found by using a static code analysis program called cppcheck.

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 scripts/dtc/libfdt/fdt_rw.c |   32 -----------------------------
 scripts/dtc/libfdt/libfdt.h |   48 -------------------------------------------
 2 files changed, 80 deletions(-)

diff --git a/scripts/dtc/libfdt/fdt_rw.c b/scripts/dtc/libfdt/fdt_rw.c
index 24437df..8933c30 100644
--- a/scripts/dtc/libfdt/fdt_rw.c
+++ b/scripts/dtc/libfdt/fdt_rw.c
@@ -169,23 +169,6 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	return (new - strtab);
 }
 
-int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
-{
-	struct fdt_reserve_entry *re;
-	int err;
-
-	FDT_RW_CHECK_HEADER(fdt);
-
-	re = _fdt_mem_rsv_w(fdt, fdt_num_mem_rsv(fdt));
-	err = _fdt_splice_mem_rsv(fdt, re, 0, 1);
-	if (err)
-		return err;
-
-	re->address = cpu_to_fdt64(address);
-	re->size = cpu_to_fdt64(size);
-	return 0;
-}
-
 int fdt_del_mem_rsv(void *fdt, int n)
 {
 	struct fdt_reserve_entry *re = _fdt_mem_rsv_w(fdt, n);
@@ -316,21 +299,6 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
-int fdt_delprop(void *fdt, int nodeoffset, const char *name)
-{
-	struct fdt_property *prop;
-	int len, proplen;
-
-	FDT_RW_CHECK_HEADER(fdt);
-
-	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
-	if (! prop)
-		return len;
-
-	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
-	return _fdt_splice_struct(fdt, prop, proplen, 0);
-}
-
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 			    const char *name, int namelen)
 {
diff --git a/scripts/dtc/libfdt/libfdt.h b/scripts/dtc/libfdt/libfdt.h
index 73f4975..272998a 100644
--- a/scripts/dtc/libfdt/libfdt.h
+++ b/scripts/dtc/libfdt/libfdt.h
@@ -1019,30 +1019,6 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize);
 int fdt_pack(void *fdt);
 
 /**
- * fdt_add_mem_rsv - add one memory reserve map entry
- * @fdt: pointer to the device tree blob
- * @address, @size: 64-bit values (native endian)
- *
- * Adds a reserve map entry to the given blob reserving a region at
- * address address of length size.
- *
- * This function will insert data into the reserve map and will
- * therefore change the indexes of some entries in the table.
- *
- * returns:
- *	0, on success
- *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
- *		contain the new reservation entry
- *	-FDT_ERR_BADMAGIC,
- *	-FDT_ERR_BADVERSION,
- *	-FDT_ERR_BADSTATE,
- *	-FDT_ERR_BADSTRUCTURE,
- *	-FDT_ERR_BADLAYOUT,
- *	-FDT_ERR_TRUNCATED, standard meanings
- */
-int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size);
-
-/**
  * fdt_del_mem_rsv - remove a memory reserve map entry
  * @fdt: pointer to the device tree blob
  * @n: entry to remove
@@ -1377,30 +1353,6 @@ static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
 	fdt_appendprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
 /**
- * fdt_delprop - delete a property
- * @fdt: pointer to the device tree blob
- * @nodeoffset: offset of the node whose property to nop
- * @name: name of the property to nop
- *
- * fdt_del_property() will delete the given property.
- *
- * This function will delete data from the blob, and will therefore
- * change the offsets of some existing nodes.
- *
- * returns:
- *	0, on success
- *	-FDT_ERR_NOTFOUND, node does not have the named property
- *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
- *	-FDT_ERR_BADLAYOUT,
- *	-FDT_ERR_BADMAGIC,
- *	-FDT_ERR_BADVERSION,
- *	-FDT_ERR_BADSTATE,
- *	-FDT_ERR_BADSTRUCTURE,
- *	-FDT_ERR_TRUNCATED, standard meanings
- */
-int fdt_delprop(void *fdt, int nodeoffset, const char *name);
-
-/**
  * fdt_add_subnode_namelen - creates a new node based on substring
  * @fdt: pointer to the device tree blob
  * @parentoffset: structure block offset of a node
-- 
1.7.10.4
