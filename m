From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 15/23] fdt: edid: Enable fdt_add_edid() function when
 CONFIG_LCD defined
Date: Thu, 22 Nov 2012 11:12:59 -0800
Message-ID: <1353611587-18186-16-git-send-email-sjg@chromium.org>
References: <1353611587-18186-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353611587-18186-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Tom Wai-Hong Tam <waihong-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Tom Wai-Hong Tam <waihong-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This function can be used for LCDs as well as monitors.

Signed-off-by: Tom Wai-Hong Tam <waihong-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2: None

 common/fdt_support.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/common/fdt_support.c b/common/fdt_support.c
index 963ea90..6b9fa05 100644
--- a/common/fdt_support.c
+++ b/common/fdt_support.c
@@ -1315,7 +1315,7 @@ int fdt_set_status_by_alias(void *fdt, const char* alias,
 	return fdt_set_node_status(fdt, offset, status, error_code);
 }
 
-#if defined(CONFIG_VIDEO)
+#if defined(CONFIG_VIDEO) || defined(CONFIG_LCD)
 int fdt_add_edid(void *blob, const char *compat, unsigned char *edid_buf)
 {
 	int noff;
-- 
1.7.7.3
