From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] dt: add of_alias_scan and of_alias_get_id
Date: Mon, 15 Aug 2011 14:36:44 +0800
Message-ID: <20110815063643.GI7244@S2100-06.ap.freescale.net>
References: <1313371817-5135-1-git-send-email-shawn.guo@linaro.org>
	<20110814.224341.2228974983062837890.davem@davemloft.net>
	<20110815060708.GH7244@S2100-06.ap.freescale.net>
	<20110814.230529.611834234177280886.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110814.230529.611834234177280886.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 14, 2011 at 11:05:29PM -0700, David Miller wrote:
> From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Date: Mon, 15 Aug 2011 14:07:09 +0800
> 
> > Can you please help me a little bit more with the "other places"?
> 
> arch/sparc/kernel/prom*.c
> 
How about the following changes?  I do not even have a compiler to do
build test for sparc.  Is it possible for me to get one from somewhere?

---8<-----
diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
index 4d87b5d..124280a 100644
--- a/drivers/of/pdt.c
+++ b/drivers/of/pdt.c
@@ -245,4 +245,11 @@ void __init of_pdt_build_devicetree(phandle root_node, struct of_pdt_ops *ops)
        nextp = &allnodes->allnext;
        allnodes->child = of_pdt_build_tree(allnodes,
                        of_pdt_prom_ops->getchild(allnodes->phandle), &nextp);
+
+       /* Get pointer to "/chosen" and "/aliasas" nodes for use everywhere */
+       of_chosen = of_find_node_by_path("/chosen");
+       if (of_chosen == NULL)
+               of_chosen = of_find_node_by_path("/chosen@0");
+       of_aliases = of_find_node_by_path("/aliases");
+       of_alias_scan(dt_alloc);
 }

-- 
Regards,
Shawn
