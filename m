From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] PowerPC: Move Freescale device tree files into fsl
 folder
Date: Thu, 17 Sep 2015 23:48:19 -0500
Message-ID: <1442551699.19102.99.camel@freescale.com>
References: <1442548824-45849-1-git-send-email-hongtao.jia@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442548824-45849-1-git-send-email-hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jia Hongtao <hongtao.jia-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2015-09-18 at 12:00 +0800, Jia Hongtao wrote:
> It makes no sense that some Freescale device tree files are in fsl
> directory while some others not. This patch move Freescale device tree
> files into fsl folder. To do that the following two steps are made:
> - Move Freescale device tree files into fsl folder.
> - Update the include path in these files from "fsl/*.dtsi" to "*.dtsi".
> 
> Please add "fsl/" prefix when you make dtb using Makefile.

The existing arrangement is indeed a bit odd, but the real reason for this is 
the interaction with the preprocessor.  If a dtsi uses preprocessor 
directives, it needs to be included with #include rather than /include/, or 
else the dtsi won't be preprocessed.  However, if a dtsi is included with 
#include, and that dtsi is in fsl/ but the including dts isn't, any 
/include/s within the dtsi will not search that fsl/ because dtc doesn't 
realize that's the directory the content came from.

There was a desire to include <dt-bindings/thermal/thermal.h> from 
fsl/t1040si-post.dtsi.  In order to make everything work, we need to either 
move all relevant files to the same directory, or convert all /include/s in 
affected files to #include.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
