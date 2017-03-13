From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: Bad DT binding (hisi-pcie-almost-ecam)
Date: Mon, 13 Mar 2017 09:48:51 +0100
Message-ID: <CAMuHMdWcs_X-T=0zSTB5R0s-f8uk3MbKNj4-62XMGDXb-jO1iQ@mail.gmail.com>
References: <20170310174045.GB24571@leverpostej> <EE11001F9E5DDD47B7634E2F8A612F2E2047A8C1@FRAEML521-MBX.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <EE11001F9E5DDD47B7634E2F8A612F2E2047A8C1-WFPaWmAhWqtUuCJht5byYAK1hpo4iccwjNknBlVQO8k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "liudongdong (C)" <liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "Wangzhou (B)" <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 9:14 AM, Gabriele Paoloni
<gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
> About the name to use here from what you suggest we should use
> "hisilicon,hip06-pcie-almost-ecam" and re-use it for hip07 SoC.
> To be honest I would prefer it either as it is now or to modify the
> driver as:
>
> diff --git a/drivers/pci/dwc/pcie-hisi.c b/drivers/pci/dwc/pcie-hisi.c
> index 52f1e3f..7527b4c 100644
> --- a/drivers/pci/dwc/pcie-hisi.c
> +++ b/drivers/pci/dwc/pcie-hisi.c
> @@ -381,7 +381,11 @@ struct pci_ecam_ops hisi_pcie_platform_ops = {
>
>   static const struct of_device_id hisi_pcie_almost_ecam_of_match[] = {
>          {
> -           .compatible = "hisilicon,pcie-almost-ecam",
> +         .compatible = "hisilicon,pcie-almost-ecam-hip06",

Shouldn't that be "hisilicon,hip06-pcie-almost-ecam"?

> +         .data           = (void *) &hisi_pcie_platform_ops,
> + },
> + {
> +         .compatible = "hisilicon,pcie-almost-ecam-hip07",

Shouldn't that be "hisilicon,hip07-pcie-almost-ecam"?

>                  .data       = (void *) &hisi_pcie_platform_ops,
>          },

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
