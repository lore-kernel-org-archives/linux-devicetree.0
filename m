From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 1/2] fsl: Add binding for RCPM
Date: Thu, 24 Sep 2015 14:30:09 -0500
Message-ID: <1443123009.32298.29.camel@freescale.com>
References: <1443083354-37369-1-git-send-email-dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443083354-37369-1-git-send-email-dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dongsheng Wang <dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason.jin-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-09-24 at 16:29 +0800, Dongsheng Wang wrote:
> +* Freescale RCPM Wakeup Source Device Tree Bindings
> +-------------------------------------------
> +Required rcpm-wakeup property should be added to a device node if the 
> device
> +can be used as a wakeup source.
> +
> +  - rcpm-wakeup: The value of the property consists of cells, the number of
> +     cells defined in "fsl,#rcpm-wakeup-cells". The first cell is a pointer
> +     to the rcpm node, the second cell is the bit mask that should be set
> +     in IPPDEXPCR0, and the third cell is for IPPDEXPCR1, and so on.

The phandle should not be included in the cell count.

-Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
