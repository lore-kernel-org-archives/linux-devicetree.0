From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [net-next PATCH 2/5] soc: ti: K2G: provide APIs to support
 driver probe deferral
Date: Tue, 27 Mar 2018 16:03:10 +0200
Message-ID: <20180327140310.GK5862@lunn.ch>
References: <1522095312-23249-1-git-send-email-m-karicheri2@ti.com>
 <1522095312-23249-3-git-send-email-m-karicheri2@ti.com>
 <20180326204802.GC5862@lunn.ch>
 <4aeeda56-c68b-cb64-1314-a669f721ff20@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4aeeda56-c68b-cb64-1314-a669f721ff20@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ssantosh@kernel.org, malat@debian.org, w-kwok2@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davem@davemloft.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Could you please elaborate? These knav dma and qmss drivers are
> introduced to support packet DMA hardware available in Keystone
> NetCP which couldn't be implemented using the DMA APIs available
> at the time this driver was introduced. Another reason was that
> the performance was really bad. We had an internal implementation
> based on DMA API before which couldn't be upstreamed at that time
> due to the reason that we were mis-using the API for this driver.
> So we introduced these knav_dma driver to support NetCP. We don't
> have any plan to re-write the driver at this time.
> 
> If your question is about EPROBE_DEFER being returned from an
> existing knav_dma API and using the return code to achieve probe
> defer instead of introducing these APIs, I can take a look into
> that and respond. So please clarify.
 
Hi Murali

So if i understood you right, at the time these drivers were written,
the linux DMA API did not do what you wanted. You could hack something
together by using the API wrongly, but that could not be mainlined. So
rather than fixing the DMA API to make it work for this hardware, you
ignored it, and made up your own API? This API now has its own
problems, it does not correctly handle ordering? So you are hacking
your own API further.

Does the Linux DMA API correctly handle probing order issues? Has the
Linux DMA API evolved so that it now does do what is needed by your
hardware?

If this was an old hardware which is slowly going away, it would not
be an issue. But it seems like there are new variants of the hardware
being released. So maybe you should go back and re-write the DMA
driver, rather than paper over the cracks?

	Andrew
