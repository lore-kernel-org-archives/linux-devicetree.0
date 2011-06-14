From: Grant Likely <grant.likely@secretlab.ca>
Subject: [PATCH] dt: include linux/errno.h in linux/of_address.h
Date: Tue, 14 Jun 2011 11:10:50 -0600
Message-ID: <20110614171046.15445.77945.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_address.h makes reference to some of the error code #defines, so it
needs to include errno.h.  If CONFIG_PCI is not selected, then some files
will fail to compile.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 include/linux/of_address.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 4fbea28..b651028 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -1,6 +1,7 @@
 #ifndef __OF_ADDRESS_H
 #define __OF_ADDRESS_H
 #include <linux/ioport.h>
+#include <linux/errno.h>
 #include <linux/of.h>
 
 extern int of_address_count(struct device_node *np);
