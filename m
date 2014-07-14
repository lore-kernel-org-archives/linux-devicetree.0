From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [REQUEST] DT patch not reviewed for 2 months+
Date: Mon, 14 Jul 2014 16:20:08 +0200
Message-ID: <4473843.TzcaEArWEr@wuerfel>
References: <Pine.LNX.4.64.1407132145230.21736@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.64.1407132145230.21736-0199iw4Nj15frtckUFj5Ag@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 13 July 2014 22:00:11 Guennadi Liakhovetski wrote:
> Hi all,
> 
> On 10th of May I submitted 2 patches
> 
> http://thread.gmane.org/gmane.linux.drivers.devicetree/73577
> 
> of which 1 adds documentation for DT bindings for a dmaengine driver. The 
> driver doesn't add any new bindings, only standard bindings are used and 
> the respective generic document is referenced in the patch. This makes me 
> think, that a review of that patch should really be a matter of a couple 
> of minutes. Unfortunateky this still hasn't happened. If the patch had 
> been reviewed promptly, it still could make it into 3.16. We're at 
> 3.16-rc4 in the meantime. Have I done anything wrong in the patch 
> submission procedure? What do I have to do to get this patch reviewed soon 
> to get it in 3.17?

The fallback for device drivers is that if nobody finds the time to review
the binding, the subsystem maintainer can just take it anyway.

I hadn't seen this driver so far, but looked at it now. The binding looks
good to me, so feel free to resend it with

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The driver also looks good, but there is one part that can now be
done more efficiently:

+	dma_cap_zero(mask);
+	dma_cap_set(DMA_SLAVE, mask);
+
+	dchan = dma_request_channel(mask, nbpf_dma_filter, ofdma->of_node);
+	if (!dchan)
+		return NULL;


Here you can just call dma_get_any_slave_channel() and remove the filter
function. The way you do it is also correct, but we're trying to get
away from that, as it just adds pointless overhead.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
