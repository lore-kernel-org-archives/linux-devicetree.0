From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v4 08/20] fdt: Add staging area for device tree binding
 documentation
Date: Wed, 11 Jan 2012 20:32:57 -0800
Message-ID: <1326342789-5781-9-git-send-email-sjg@chromium.org>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326342789-5781-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

Add a directory to hold device tree binding files, to permit easy review
of this material in U-Boot patches.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v4:
- Add staging area for device tree bindings used in U-Boot

 doc/device-tree-bindings/README |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/README

diff --git a/doc/device-tree-bindings/README b/doc/device-tree-bindings/README
new file mode 100644
index 0000000..84e8cba
--- /dev/null
+++ b/doc/device-tree-bindings/README
@@ -0,0 +1,19 @@
+Device Tree Bindings Staging Area
+=================================
+
+This directory contains device tree bindings for U-Boot.
+
+These follow along with Linux kernel bindings, with a few additions. By
+adding the files here, U-Boot patches can clearly show thees additions.
+This makes it easier for device tree people to review these additions in
+patches sent to the U-Boot mailing list.
+
+The intent is not to commit these files to U-Boot, or at least only
+temporarily, Rather we hope that the files will be stored in another
+repo (shared with Linux) which is brought in as needed. Failing that,
+changes here will be  commited to the Linux
+Documentation/devicetree/bindings/ directory.
+
+
+sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
+11-Jan-12
-- 
1.7.7.3
