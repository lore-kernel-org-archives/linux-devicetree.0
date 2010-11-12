From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 3/3] x86: OLPC: speed up device tree creation during boot (v2)
Date: Thu, 11 Nov 2010 21:45:46 -0800
Message-ID: <20101111214546.4e573cad@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Calling alloc_bootmem() for tiny chunks of memory over and over is really
slow; on an XO-1, it caused the time between when the kernel started
booting and when the display came alive (post-lxfb probe) to increase
to 44s.  This patch optimizes the prom_early_alloc function by
calling alloc_bootmem for 4k-sized blocks of memory, and handing out
chunks of that to callers.  With this patch, the time between kernel load
and display initialization decreased to 23s.  If there's a better way to
do this early in the boot process, please let me know.

(Note: increasing the chunk size to 16k didn't noticably affect boot time,
and wasted 9k.)

v2: reorder function as suggested by Grant.

Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
---
 arch/x86/platform/olpc/olpc_dt.c |   27 ++++++++++++++++++++++-----
 1 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index b8c8ff9..0ab824d 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -126,14 +126,31 @@ static unsigned int prom_early_allocated __initdata;
 
 void * __init prom_early_alloc(unsigned long size)
 {
+	static u8 *mem = NULL;
+	static size_t free_mem = 0;
 	void *res;
 
-	res = alloc_bootmem(size);
-	if (res)
-		memset(res, 0, size);
-
-	prom_early_allocated += size;
+	if (free_mem < size) {
+		const size_t chunk_size = max(PAGE_SIZE, size);
+
+		/*
+		 * To mimimize the number of allocations, grab at least 4k of
+		 * memory (that's an arbitrary choice that matches PAGE_SIZE on
+		 * the platforms we care about, and minimizes wasted bootmem)
+		 * and hand off chunks of it to callers.
+		 */
+		res = mem = alloc_bootmem(chunk_size);
+		if (!res)
+			return NULL;
+		prom_early_allocated += chunk_size;
+		memset(res, 0, chunk_size);
+		free_mem = chunk_size;
+	}
 
+	/* allocate from the local cache */
+	free_mem -= size;
+	res = mem;
+	mem += size;
 	return res;
 }
 
-- 
1.7.2.3
