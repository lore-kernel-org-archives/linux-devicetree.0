From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/5] dmaengine: zynqmp_ps_pcie: Adding PS PCIe
 platform DMA driver
Date: Tue, 26 Sep 2017 23:04:35 +0530
Message-ID: <20170926173435.GS30097@localhost>
References: <1504873388-29195-1-git-send-email-vjonnal@xilinx.com>
 <1504873388-29195-6-git-send-email-vjonnal@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504873388-29195-6-git-send-email-vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ravi Shankar Jonnalagadda <venkata.ravi.jonnalagadda-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 08, 2017 at 05:53:07PM +0530, Ravi Shankar Jonnalagadda wrote:
> Platform driver handles transactions for PCIe EP DMA and Root DMA
> 
> Signed-off-by: Ravi Shankar Jonnalagadda <vjonnal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: RaviKiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/xilinx/ps_pcie_platform.c | 3055 +++++++++++++++++++++++++++++++++

I dont want to loose my sanity trying to review a 3k patch. If you don't put
an effort to make your code easier to review, I dont want to see this...

Nacked-by: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
