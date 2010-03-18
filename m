From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of: Fix comparison of "compatible" properties
Date: Wed, 17 Mar 2010 19:01:00 -0600
Message-ID: <20100318010001.6814.88310.stgit@angua>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 7c7b60cb87547b1664a4385c187f029bf514a737
"of: put default string compare and #a/s-cell values into common header"

Breaks various things on powerpc due to using strncasecmp instead of
strcasecmp for comparing against "compatible" strings.

This causes things like the 4xx PCI code to fail miserably due to the
partial matches in code like this:

       for_each_compatible_node(np, NULL, "ibm,plb-pcix")
               ppc4xx_probe_pcix_bridge(np);
       for_each_compatible_node(np, NULL, "ibm,plb-pci")
               ppc4xx_probe_pci_bridge(np);

This reverts us to use strcasecmp. I do wonder why microblase and sparc
want the partial matches though. For sparc it could be historical, but
microblaze is probably doing the wrong thing so this patch also changes
the microblaze behaviour to use not allow partial matches.  Michal will
surely beat me over the head with a cluestick if I'm wrong, in which
case I'll fix this patch.

It's not quite right to do partial name match. Entries in a compatible
list are meant to be matched whole. If a device is compatible with both
"foo" and "foo1", then the device should have both strings in its
"compatible" property.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
      (for patch description)
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
CC: Michal Simek <michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
---

 include/linux/of.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index f6d9cbc..a367e19 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -127,7 +127,7 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 
 /* Default string compare functions, Allow arch asm/prom.h to override */
 #if !defined(of_compat_cmp)
-#define of_compat_cmp(s1, s2, l)	strncasecmp((s1), (s2), (l))
+#define of_compat_cmp(s1, s2, l)	strcasecmp((s1), (s2))
 #define of_prop_cmp(s1, s2)		strcmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcasecmp((s1), (s2))
 #endif
