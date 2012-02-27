From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 07/20] fdt: Add staging area for device tree
	binding documentation
Date: Mon, 27 Feb 2012 12:52:40 -0800
Message-ID: <1330375973-10681-8-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
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

Add a directory to hold device tree binding files, to permit easy review
of this material in U-Boot patches.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v4:
- Add staging area for device tree bindings used in U-Boot

Changes in v5:
- Update README to indicate that we will commit fdt documentation to U-Boot

 doc/device-tree-bindings/README |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/README

diff --git a/doc/device-tree-bindings/README b/doc/device-tree-bindings/README
new file mode 100644
index 0000000..2ea3439
--- /dev/null
+++ b/doc/device-tree-bindings/README
@@ -0,0 +1,17 @@
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
+The intent IS to commit these files to U-Boot. Hopefully at some point
+the files will be stored in another repo (shared with Linux) which is
+brought in as needed. Changes here are intended to mirror changes in the
+Linux Documentation/devicetree/bindings/ directory.
+
+sjg@chromium.org
+17-Jan-12
-- 
1.7.7.3
