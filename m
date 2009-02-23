From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH] Fix a possible overflow case detected by gcc 4.3.2
Date: Mon, 23 Feb 2009 10:43:36 -0600
Message-ID: <1235407416-10005-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: jdl-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

.../dtc/libfdt/fdt_sw.c: In function 'fdt_end_node':
.../dtc/libfdt/fdt_sw.c:81: error: assuming signed overflow does not occur when assuming that (X + c) < X is always false

Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
---
 libfdt/fdt_sw.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/libfdt/fdt_sw.c b/libfdt/fdt_sw.c
index 2380b27..55ebebf 100644
--- a/libfdt/fdt_sw.c
+++ b/libfdt/fdt_sw.c
@@ -70,7 +70,7 @@ static int _fdt_sw_check_header(void *fdt)
 			return err; \
 	}
 
-static void *_fdt_grab_space(void *fdt, int len)
+static void *_fdt_grab_space(void *fdt, size_t len)
 {
 	int offset = fdt_size_dt_struct(fdt);
 	int spaceleft;
-- 
1.6.1.3
