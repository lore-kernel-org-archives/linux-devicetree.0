From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] PCI: generic: add description of property
 "interrupt-skip-mask"
Date: Thu, 25 Feb 2016 12:20:35 +0000
Message-ID: <20160225122035.GB10593@leverpostej>
References: <1456401208-10136-1-git-send-email-thunder.leizhen@huawei.com>
 <1456401208-10136-2-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456401208-10136-2-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Yijing Wang <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

In future, please send the binding document first in a series, per point
3 of Documentation/devicetree/bindings/submitting-patches.txt. It makes
review easier/faster.

On Thu, Feb 25, 2016 at 07:53:28PM +0800, Zhen Lei wrote:
> Interrupt Pin register is read-only and optional. Some pci devices may use
> msi/msix but leave the value of Interrupt Pin non-zero.

Is that permitted by the spec? Surely 'optional' means it must be zero
if not implemented?

> In this case, the driver will print information as below: pci
> 0000:40:00.0: of_irq_parse_pci() failed with rc=-22
> 
> It's easily lead to misinterpret.

If this is limited to a subset of devices which we know are broken in
this regard, can we not handle these cases explicitly?

> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/pci/host-generic-pci.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/host-generic-pci.txt b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> index 3f1d3fc..0f10978 100644
> --- a/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/host-generic-pci.txt
> @@ -70,6 +70,8 @@ Practice: Interrupt Mapping' and requires the following properties:
> 
>  - interrupt-map-mask : <see aforementioned specification>
> 
> +- interrupt-skip-mask: Explicitly declare which pci devices only use msi/msix
> +but leave the value of Interrupt Pin non-zero.

Unlike the rest of the interrupt mapping properties, this is not
described in  `Open Firmware Recommended Practice: Interrupt Mapping'.

This needs a far more complete description.

This also doesn't strike me as th right approach. The interrupt-map-mask
property describe as relationship between the host-controller-provided
interrupt lines and endpoints, while this seems to be a bug completely
contained within an endpoint.

Thanks,
Mark.

> 
>  Example:
> 
> --
> 2.5.0
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
