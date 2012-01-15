From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 03/17] fdt: Correct GPIO name access in fdtdec
Date: Sat, 14 Jan 2012 16:47:15 -0800
Message-ID: <1326588449-1794-4-git-send-email-sjg@chromium.org>
References: <1326588449-1794-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326588449-1794-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This was missing an fdt32_to_cpu() call so got the name pointer wrong.
If the GPIO module looks at it, this would cause a problem.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 lib/fdtdec.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index bcb2343..f7d0c95 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -418,7 +418,7 @@ static int fdtdec_decode_gpios(const void *blob, int node,
 	}
 
 	/* We will use the name to tag the GPIO */
-	name = fdt_string(blob, prop->nameoff);
+	name = fdt_string(blob, fdt32_to_cpu(prop->nameoff));
 	cell = (u32 *)prop->data;
 	len /= sizeof(u32) * 3;		/* 3 cells per GPIO record */
 	if (len > max_count) {
@@ -444,6 +444,7 @@ int fdtdec_decode_gpio(const void *blob, int node, const char *prop_name,
 
 	debug("%s: %s\n", __func__, prop_name);
 	gpio->gpio = FDT_GPIO_NONE;
+	gpio->name = NULL;
 	err = fdtdec_decode_gpios(blob, node, prop_name, gpio, 1);
 	return err == 1 ? 0 : err;
 }
-- 
1.7.7.3
