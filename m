From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/3] dtc: Add data_append_literal function
Date: Wed, 21 Sep 2011 13:42:10 -0700
Message-ID: <1316637731-21872-3-git-send-email-robotboy@chromium.org>
References: <1316637731-21872-1-git-send-email-robotboy@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1316637731-21872-1-git-send-email-robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

This function deals with appending literals of various sizes (8, 16
32, and 64 bit currently).  It handles endianess conversions and
verifies that the given literal is not larger than the specified
size.

Signed-off-by: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 data.c |   33 +++++++++++++++++++++++++++++++++
 dtc.h  |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/data.c b/data.c
index b5f3066..37acd6a 100644
--- a/data.c
+++ b/data.c
@@ -175,6 +175,39 @@ struct data data_append_cell(struct data d, cell_t word)
 	return data_append_data(d, &beword, sizeof(beword));
 }
 
+struct data data_append_literal(struct data d, uint64_t value, int len)
+{
+	uint8_t value_8;
+	uint16_t be_value_16;
+	uint32_t be_value_32;
+	uint64_t be_value_64;
+
+	if ((len < 64) && (value >= (1ULL << len)))
+		die("Literal value 0x%x too large to fit in %d-bit cell\n",
+		    value, len);
+
+	switch (len) {
+	case 8:
+		value_8 = value;
+		return data_append_data(d, &value_8, 1);
+
+	case 16:
+		be_value_16 = cpu_to_fdt16(value);
+		return data_append_data(d, &be_value_16, 2);
+
+	case 32:
+		be_value_32 = cpu_to_fdt32(value);
+		return data_append_data(d, &be_value_32, 4);
+
+	case 64:
+		be_value_64 = cpu_to_fdt64(value);
+		return data_append_data(d, &be_value_64, 8);
+
+	default:
+		die("Invalid literal size (%d)\n", len);
+	}
+}
+
 struct data data_append_re(struct data d, const struct fdt_reserve_entry *re)
 {
 	struct fdt_reserve_entry bere;
diff --git a/dtc.h b/dtc.h
index f37c97e..50433f6 100644
--- a/dtc.h
+++ b/dtc.h
@@ -109,6 +109,7 @@ struct data data_insert_at_marker(struct data d, struct marker *m,
 				  const void *p, int len);
 struct data data_merge(struct data d1, struct data d2);
 struct data data_append_cell(struct data d, cell_t word);
+struct data data_append_literal(struct data d, uint64_t word, int len);
 struct data data_append_re(struct data d, const struct fdt_reserve_entry *re);
 struct data data_append_addr(struct data d, uint64_t addr);
 struct data data_append_byte(struct data d, uint8_t byte);
-- 
1.7.3.1
