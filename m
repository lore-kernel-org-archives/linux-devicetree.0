From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 4/6] Fix off-by-one error in passing initrd end address via
	device tree
Date: Mon, 28 Mar 2011 13:58:55 -0600
Message-ID: <20110328195854.10235.46139.stgit@ponder>
References: <20110328195231.10235.36716.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110328195231.10235.36716.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The initrd_end variable contains the address immediately *after* the
initrd blob, not the last address containing data.  This patch fixes
an inadvertent off-by-one when setting up the initrd reserved map.

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 common/fdt_support.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 6c98e5b..1b5f9c8 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -183,7 +183,7 @@ int fdt_initrd(void *fdt, ulong initrd_start, ulong initrd_end, int force)
 		}
 	}
 
-	err = fdt_add_mem_rsv(fdt, initrd_start, initrd_end - initrd_start + 1);
+	err = fdt_add_mem_rsv(fdt, initrd_start, initrd_end - initrd_start);
 	if (err < 0) {
 		printf("fdt_initrd: %s\n", fdt_strerror(err));
 		return err;
