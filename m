From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: NS2: Add dma-coherent to relevant DT
Date: Wed, 22 Mar 2017 10:14:14 -0700
Message-ID: <20170322171414.26039-1-f.fainelli@gmail.com>
References: <1490129479-19459-1-git-send-email-jon.mason@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490129479-19459-1-git-send-email-jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 21 Mar 2017 16:51:19 -0400, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> Cache related issues with DMA rings and performance issues related to
> caching are being caused by not properly setting the "dma-coherent" flag
> in the device tree entries. Adding it here to correct the issue.
>
> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Fixes: fd5e5dd56 ("arm64: dts: Add PCIe0 and PCIe4 DT nodes for NS2")
> Fixes: dddc3c9d7 ("arm64: dts: NS2: add AMAC ethernet support")
> Fixes: e79249143 ("arm64: dts: Add Broadcom Northstar2 device tree entries for PDC driver")
> Fixes: ac9aae00f ("arm64: dts: Add SATA3 AHCI and SATA3 PHY DT nodes for NS2")
> Fixes: efc877676 ("arm64: dts: Add SDHCI DT node for NS2")
> ---

Applied, thanks!
--
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
