From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls2080a: Add 'dma-coherent' for ls2080a PCI
 nodes
Date: Fri, 9 Sep 2016 14:05:53 +0800
Message-ID: <20160909060553.GH16911@tiger>
References: <1473301904-27259-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473301904-27259-1-git-send-email-Gang.Liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org, minghuan.lian-3arQi8VN3Tc@public.gmane.org, mingkai.hu-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 08, 2016 at 10:31:44AM +0800, Liu Gang wrote:
> The 'dma-coherent' indicates that the hardware IP block can ensure
> the coherency of the data transferred from/to the IP block. This
> can avoid the software cache flush/invalid actions, and improve
> the performance significantly.
> 
> The PCI IP block of ls2080a has this capability, so adding this
> feature to improve the PCI performance.
> 
> Signed-off-by: Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
