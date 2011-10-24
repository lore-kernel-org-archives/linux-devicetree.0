From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: [PATCH] dt: Add empty of_match_node() macro
Date: Mon, 24 Oct 2011 11:53:32 +0200
Message-ID: <1319450012-13033-1-git-send-email-nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robherring2@gmail.com, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add an empty macro for of_match_node() that will save
some '#ifdef CONFIG_OF' for non-dt builds.

I have chosen to use a macro instead of a function to
be able to avoid defining the first parameter.
In fact, this "struct of_device_id *" first parameter
is usualy not defined as well on non-dt builds.

Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 include/linux/of.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 736b747..92c40a1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -303,6 +303,7 @@ static inline struct device_node *of_parse_phandle(struct device_node *np,
 }
 
 #define of_match_ptr(_ptr)	NULL
+#define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
 
 static inline int of_property_read_u32(const struct device_node *np,
-- 
1.7.5.4
