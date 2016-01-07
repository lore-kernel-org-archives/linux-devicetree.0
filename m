From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dmaengine: xgene-dma: Fix double IRQ issue by setting
 IRQ_DISABLE_UNLAZY flag
Date: Thu, 7 Jan 2016 11:10:05 +0530
Message-ID: <20160107054005.GI11778@localhost>
References: <1450875495-2229-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450875495-2229-1-git-send-email-rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rameshswar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, kgondkar-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 23, 2015 at 06:28:15PM +0530, Rameshswar Prasad Sahu wrote:
> From: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
> 
> For interrupt controller that doesn't support irq_disable and hardware
> with level interrupt, an extra interrupt can be pending. This patch fixes
> the issue by setting IRQ_DISABLE_UNLAZY flag for the interrupt line.
> 
> Reference: http://git.kernel.org/tip/e9849777d0e27cdd2902805be51da73e7c79578c
> 

Applied now

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
