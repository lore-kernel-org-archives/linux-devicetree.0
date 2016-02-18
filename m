From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] dts/ls2080a: Update PCIe compatible
Date: Thu, 18 Feb 2016 08:36:39 -0600
Message-ID: <20160218143639.GK9654@rob-hp-laptop>
References: <1455674663-9273-1-git-send-email-Mingkai.Hu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455674663-9273-1-git-send-email-Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yang.shi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leoyang.li-3arQi8VN3Tc@public.gmane.org, Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 10:04:23AM +0800, Mingkai Hu wrote:
> From: Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> 
> The patch adds LS2085a to PCIe compatible to fix the compatibility
> issue when using firmware with LS2085a compatible property.
> 
> Signed-off-by: Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>
> ---
> v3:
>  - Make the compatible consistent between layerscape-pci.txt
>    and dts file.
> 
> v2:
>   - Rebased to latest kernel base
> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt |  2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
