From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Add dma-coherent to relevant DT
Date: Mon,  7 Aug 2017 10:28:16 -0700
Message-ID: <20170807172816.5326-1-f.fainelli@gmail.com>
References: <1501020372-19607-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501020372-19607-2-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jul 2017 18:06:10 -0400, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Cache related issues with DMA rings and performance issues related to
> caching are being caused by not properly setting the "dma-coherent" flag
> in the device tree entries. Adding it here to correct the issue.
>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Fixes: 5fa1026a3e4d ("ARM: dts: NSP: Add PL330 support")
> Fixes: 3107fa5bcfb2 ("ARM: dts: NSP: Add SD/MMC support")
> Fixes: 13d04f20935c ("ARM: dts: NSP: Add AMAC entries")
> Fixes: 5aeda7bf8a1e ("ARM: dts: NSP: Add and enable amac2")
> Fixes: 17d517172300 ("ARM: dts: NSP: Add mailbox (PDC) to NSP")
> Fixes: 1d8ece6639e1 ("ARM: dts: NSP: Add EHCI/OHCI USB nodes to device tree")
> Fixes: bf2289bedef4 ("ARM: dts: NSP: Add Switch Register Access Block node")
> Fixes: 0f9f27a36d09 ("ARM: dts: NSP: Add I2C support to the DT")
> Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
> Fixes: 522199029fdc ("ARM: dts: NSP: Fix PCIE DT issue")
> ---

Applied, thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
