From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] dmaengine: xgene-dma: Fix sparse wannings warnings
Date: Mon, 4 May 2015 11:25:03 +0530
Message-ID: <20150504055503.GA3521@localhost>
References: <1429790205-13571-1-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429790205-13571-1-git-send-email-rsahu-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 05:26:45PM +0530, Rameshwar Prasad Sahu wrote:

Suject line should mention the fixes you are doing and not tool!
> v5 changes:
> 	* Re-pull v3 changes that I missed in v4
> 
> v4 changes:
> 	* Re-generate patch on top of latest for-linux git
> 
> v3 changes:
> 	* Minor changes in length setting in DMA descriptor
> 
> v2 changes:
> 	* Code cleanup
> 	* Changed way of setting DMA descriptors for big-endian
This is *not* supposed to be part of changelog!

You can add this after the S-O-B line!!
> 
> This patch fixes compilation sparse warnings like incorrect type in assignment
> (different base types), cast to restricted __le64, symbol
> '__UNIQUE_ID_author__COUNTER__' has multiple initializers etc.
> 
> This patch is based on slave-dma / for-linus branch.
> (commit: 11ebe4c067c7f95adff73594cb5c23f7a5c6d69e
> 	dmaengine: fix platform_no_drv_owner.cocci warnings
this too :(
> 
> Reported-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>

> 
>  MODULE_DESCRIPTION("APM X-Gene SoC DMA driver");
>  MODULE_AUTHOR("Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>");
> -MODULE_AUTHOR("Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>");
Pls drop this

-- 
~Vinod

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
