From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 2/3] dtc: Add data_append_integer function
Date: Tue, 11 Oct 2011 10:22:28 -0700
Message-ID: <1318353749-24513-3-git-send-email-robotboy@chromium.org>
References: <1318353749-24513-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1318353749-24513-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This function deals with appending integers of various sizes (8, 16
32, and 64 bit currently).  It handles endianess conversions.  If the
integer will not fit in the requested number of bits of storage it
will have it's high bits ignored.

This patch also rewrites data_append_cell and data_append_addr to use
data_append_integer.

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 data.c |   39 ++++++++++++++++++++++++++++++++-------
 dtc.h  |    1 +
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/data.c b/data.c
index b5f3066..4a40c5b 100644
--- a/data.c
+++ b/data.c
@@ -168,11 +168,33 @@ struct data data_merge(struct data d1, struct data d2)
 	return d;
 }
 
-struct data data_append_cell(struct data d, cell_t word)
+struct data data_append_integer(struct data d, uint64_t value, int bits)
 {
-	cell_t beword = cpu_to_fdt32(word);
-
-	return data_append_data(d, &beword, sizeof(beword));
+	uint8_t value_8;
+	uint16_t value_16;
+	uint32_t value_32;
+	uint64_t value_64;
+
+	switch (bits) {
+	case 8:
+		value_8 = value;
+		return data_append_data(d, &value_8, 1);
+
+	case 16:
+		value_16 = cpu_to_fdt16(value);
+		return data_append_data(d, &value_16, 2);
+
+	case 32:
+		value_32 = cpu_to_fdt32(value);
+		return data_append_data(d, &value_32, 4);
+
+	case 64:
+		value_64 = cpu_to_fdt64(value);
+		return data_append_data(d, &value_64, 8);
+
+	default:
+		die("Invalid literal size (%d)\n", bits);
+	}
 }
 
 struct data data_append_re(struct data d, const struct fdt_reserve_entry *re)
@@ -185,11 +207,14 @@ struct data data_append_re(struct data d, const struct fdt_reserve_entry *re)
 	return data_append_data(d, &bere, sizeof(bere));
 }
 
-struct data data_append_addr(struct data d, uint64_t addr)
+struct data data_append_cell(struct data d, cell_t word)
 {
-	uint64_t beaddr = cpu_to_fdt64(addr);
+	return data_append_integer(d, word, sizeof(word) * 8);
+}
 
-	return data_append_data(d, &beaddr, sizeof(beaddr));
+struct data data_append_addr(struct data d, uint64_t addr)
+{
+	return data_append_integer(d, addr, sizeof(addr) * 8);
 }
 
 struct data data_append_byte(struct data d, uint8_t byte)
diff --git a/dtc.h b/dtc.h
index f37c97e..7b4c65b 100644
--- a/dtc.h
+++ b/dtc.h
@@ -109,6 +109,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
 				  const void *p, int len);
 struct data data_merge(struct data d1, struct data d2);
 struct data data_append_cell(struct data d, cell_t word);
+struct data data_append_integer(struct data d, uint64_t word, int bits);
 struct data data_append_re(struct data d, const struct fdt_reserve_entry *re);
 struct data data_append_addr(struct data d, uint64_t addr);
 struct data data_append_byte(struct data d, uint8_t byte);
-- 
1.7.3.1
