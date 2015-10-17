From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: PowerPC: Move Freescale device tree files into fsl folder
Date: Sat, 17 Oct 2015 00:35:12 -0500
Message-ID: <20151017053512.GA24971@home.buserror.net>
References: <1442548824-45849-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442548824-45849-1-git-send-email-hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hongtao Jia <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 18, 2015 at 12:00:24PM +0800, Hongtao Jia wrote:
> It makes no sense that some Freescale device tree files are in fsl
> directory while some others not. This patch move Freescale device tree
> files into fsl folder. To do that the following two steps are made:
> - Move Freescale device tree files into fsl folder.
> - Update the include path in these files from "fsl/*.dtsi" to "*.dtsi".
> 
> Please add "fsl/" prefix when you make dtb using Makefile.
> 
> Signed-off-by: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

This broke cuImage -- I made this change when applying:

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4eec430..99e4487 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -364,6 +364,9 @@ $(obj)/cuImage.initrd.%: vmlinux $(obj)/%.dtb $(wrapperbits)
 $(obj)/cuImage.%: vmlinux $(obj)/%.dtb $(wrapperbits)
 	$(call if_changed,wrap,cuboot-$*,,$(obj)/$*.dtb)
 
+$(obj)/cuImage.%: vmlinux $(obj)/fsl/%.dtb $(wrapperbits)
+	$(call if_changed,wrap,cuboot-$*,,$(obj)/fsl/$*.dtb)
+
 $(obj)/simpleImage.initrd.%: vmlinux $(obj)/%.dtb $(wrapperbits)
 	$(call if_changed,wrap,simpleboot-$*,,$(obj)/$*.dtb,$(obj)/ramdisk.image.gz)

-Scott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
