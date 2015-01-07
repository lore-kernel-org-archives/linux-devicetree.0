From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/4] arm64: dts: Add APM X-Gene PCIe DMA device tree nodes
Date: Wed, 07 Jan 2015 09:37:11 +0100
Message-ID: <6884775.IcL8KCPQhi@wuerfel>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com> <1420608537-12296-4-git-send-email-mchitale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420608537-12296-4-git-send-email-mchitale-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mayuresh Chitale <mchitale-qTEPVZfXA3Y@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, ddutile-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 January 2015 10:58:56 Mayuresh Chitale wrote:
> 
> +               xpdma0: dma0@1f2b0154 {
> +                       status = "disabled";
> +                       compatible = "apm,xgene-pciedma";
> +                       reg = < 0x0 0x1f2b0154 0x0 0xc
> +                               0x0 0x1f2b0058 0x0 0x8>;
> +                       interrupts = <0x0 0xc6 0x4>;
> +               };
> +
> +               xpdma1: dma1@1f2c0154 {
> +                       status = "disabled";
> +                       compatible = "apm,xgene-pciedma";
> +                       reg = < 0x0 0x1f2c0154 0x0 0xc
> +                               0x0 0x1f2c0058 0x0 0x8>;
> +                       interrupts = <0x0 0xcc 0x4>;
> +               };
> +
> 

Something's wrong here: you have the same addresses for
all the nodes but use different names. Please change the names
to all say 'dma' and set the correct addresses.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
