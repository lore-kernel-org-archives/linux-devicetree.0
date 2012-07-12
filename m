From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 02/18] fdt: Add header guard to fdtdec.h
Date: Thu, 12 Jul 2012 08:25:02 -0700
Message-ID: <1342106718-3058-3-git-send-email-sjg@chromium.org>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1342106718-3058-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

This makes it easier to include this header from other headers.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 include/fdtdec.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index fab577e..c30947a 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -19,6 +19,8 @@
  * MA 02111-1307 USA
  */
 
+#ifndef __fdtdec_h
+#define __fdtdec_h
 
 /*
  * This file contains convenience functions for decoding useful and
@@ -382,3 +384,4 @@ int fdtdec_get_byte_array(const void *blob, int node, const char *prop_name,
  */
 const u8 *fdtdec_locate_byte_array(const void *blob, int node,
 			     const char *prop_name, int count);
+#endif
-- 
1.7.7.3
