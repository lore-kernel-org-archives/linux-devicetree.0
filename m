From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] Broadcom SBA-RAID driver improvements
Date: Wed, 26 Jul 2017 22:33:01 +0530
Message-ID: <20170726170259.GH3053@localhost>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501047404-14456-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 26, 2017 at 11:06:38AM +0530, Anup Patel wrote:
> This patchset does various improvments to Broadcom SBA-RAID
> driver and also adds SBA-RAID DT nodes for Stingray SOC.
> 
> The patches are based on "[PATCH v2 0/7] FlexRM driver improvements"
> and can also be found at sba-raid-imp-v1 branch of
> https://github.com/Broadcom/arm64-linux.git

and i cant apply this series without these?

> 
> Anup Patel (6):
>   dma: bcm-sba-raid: Improve memory allocation in SBA RAID driver
>   dma: bcm-sba-raid: Peek mbox when we are left with no free requests
>   dma: bcm-sba-raid: pre-ack async tx descriptor
>   dma: bcm-sba-raid: Break sba_process_deferred_requests() into two
>     parts
>   dma: bcm-sba-raid: Add debugfs support

why are these tagged dma, I have told you explcitly to fix this!!

>   arm64: dts: Add SBA-RAID DT nodes for Stingray SoC
> 
>  .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   |  64 +++
>  drivers/dma/bcm-sba-raid.c                         | 527 ++++++++++++---------
>  2 files changed, 364 insertions(+), 227 deletions(-)
> 
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
