From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 0/3] Support burst request by peripherals
Date: Fri,  5 Aug 2016 10:53:19 +0800
Message-ID: <1470365602-32586-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Huibin Hong <huibin.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Burst request is supported by pl330 but the original code
only support single mode as some Socs didn't implement it.
So this feature has been missing for a long time. But it's
very important for efficiency.

This patchset is gonna support it without the probability of
breaking old(other) platforms, so the new optional property
is introduced.

Also when supporting burst request type, we could be able
to deal with unaligned case internally.

After applying this patchset, we could see significant improvement
when doing mem-2-dev/dev-2-mem/mem-2-mem which I mentioned in the
commit msg.

I would appreciate it if folks could help review and test it.:)

Thanks for any feedback.



Shawn Lin (3):
  dt/bindings: arm-pl330: add description of arm,pl330-periph-burst
  dmaengine: pl330: enable burst mode by parsing dt
  dmaengine: pl330: support transfer unaligned with (burst len * burst
    size)

 .../devicetree/bindings/dma/arm-pl330.txt          |  1 +
 drivers/dma/pl330.c                                | 58 +++++++++++++++-------
 2 files changed, 42 insertions(+), 17 deletions(-)

-- 
2.3.7


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
