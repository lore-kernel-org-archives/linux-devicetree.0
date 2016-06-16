From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: layerscape: Add 'dma-coherent' property
Date: Thu, 16 Jun 2016 08:43:41 +0800
Message-ID: <20160616004341.GK20243@tiger>
References: <1465282546-28256-1-git-send-email-Gang.Liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465282546-28256-1-git-send-email-Gang.Liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, minghuan.lian-3arQi8VN3Tc@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, mingkai.hu-3arQi8VN3Tc@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 07, 2016 at 02:55:45PM +0800, Liu Gang wrote:
> Add 'dma-coherent' description for PCI nodes.
> 
> The 'dma-coherent' indicates that the hardware IP block can ensure
> the coherency of the data transferred from/to the IP block. This
> can avoid the software cache flush/invalid actions, and improve
> the performance significantly.
> 
> The PCI IP block of ls1043a has this capability, so adding
> this feature to improve the PCI performance.
> 
> Signed-off-by: Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>

Applied both, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
