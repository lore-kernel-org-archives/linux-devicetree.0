From: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Subject: [PATCH] arch/powerpc/platforms/83xx/mpc837x_mds.c: Add missing iounmap
Date: Sun, 29 Aug 2010 21:47:18 +0200
Message-ID: <1283111238-3129-1-git-send-email-julia@diku.dk>
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
To: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The function of_iomap returns the result of calling ioremap, so iounmap
should be called on the result in the error handling code, as done in the
normal exit of the function.

The sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E,E1;
identifier l;
statement S;
@@

*x = of_iomap(...);
...  when != iounmap(x)
     when != if (...) { ... iounmap(x); ... }
     when != E = x
     when any
(
if (x == NULL) S
|
if (...) {
  ... when != iounmap(x)
      when != if (...) { ... iounmap(x); ... }
(
  return <+...x...+>;
|
*  return ...;
)
}
)
... when != x = E1
    when any
iounmap(x);
// </smpl>

Signed-off-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>

---
 arch/powerpc/platforms/83xx/mpc837x_mds.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index f9751c8..8306832 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -48,8 +48,10 @@ static int mpc837xmds_usb_cfg(void)
 		return -1;
 
 	np = of_find_node_by_name(NULL, "usb");
-	if (!np)
-		return -ENODEV;
+	if (!np) {
+		ret = -ENODEV;
+		goto out;
+	}
 	phy_type = of_get_property(np, "phy_type", NULL);
 	if (phy_type && !strcmp(phy_type, "ulpi")) {
 		clrbits8(bcsr_regs + 12, BCSR12_USB_SER_PIN);
@@ -65,8 +67,9 @@ static int mpc837xmds_usb_cfg(void)
 	}
 
 	of_node_put(np);
+out:
 	iounmap(bcsr_regs);
-	return 0;
+	return ret;
 }
 
 /* ************************************************************************
