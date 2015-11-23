From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 1/6] PCI: designware: remove wrong io_base assignment
Date: Mon, 23 Nov 2015 10:59:36 +0100
Message-ID: <6048361.Am0T3g77Bd@wuerfel>
References: <cover.1448270813.git.stanimir.varbanov@linaro.org> <44d133d5ebd4f7b9e8b817aa8bae12f690e70000.1448270813.git.stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <44d133d5ebd4f7b9e8b817aa8bae12f690e70000.1448270813.git.stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 23 November 2015 11:28:58 Stanimir Varbanov wrote:
> The io_base is used to keep the cpu physical address parsed
> from ranges dt property. After issue pci_remap_iospace the
> io_base has been assigned with io->start, which is not correct
> cause io->start is a PCI bus address.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/pci/host/pcie-designware.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
> index 540f077c37ea..02a7452bdf23 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -440,7 +440,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  					 ret, pp->io);
>  				continue;
>  			}
> -			pp->io_base = pp->io->start;
>  			break;
>  		case IORESOURCE_MEM:
>  			pp->mem = win->res;

I was surprised to see such an obvious bug here, as we had spent a lot of
time trying to get it right. However, it broke only recently and it's
worth mentioning what commit did it, so

Fixes: 0021d22b73d6 ("PCI: designware: Use of_pci_get_host_bridge_resources() to parse DT")
Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

The bug is present in 4.4-rc1 and we should get your fix merged into 4.4
as well, while all the other patches in your series are presumably for 4.5.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
