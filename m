From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 3/3 pci/next] PCI: rcar: Add gen3 fallback
 compatibility string for pcie-rcar
Date: Sat, 3 Dec 2016 12:19:39 +0100
Message-ID: <CAMuHMdVhiz971JTU3T3GZehfmPqFOX6XPRjG01=NZrGONSi55g@mail.gmail.com>
References: <1480675020-26346-1-git-send-email-horms+renesas@verge.net.au>
 <1480675020-26346-4-git-send-email-horms+renesas@verge.net.au> <20161202215016.GA21497@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202215016.GA21497-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Phil Edworthy <phil.edworthy-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 2, 2016 at 10:50 PM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Fri, Dec 02, 2016 at 11:37:00AM +0100, Simon Horman wrote:
>> --- a/drivers/pci/host/pcie-rcar.c
>> +++ b/drivers/pci/host/pcie-rcar.c
>> @@ -1078,6 +1078,8 @@ static const struct of_device_id rcar_pcie_of_match[] = {
>>       { .compatible = "renesas,pcie-rcar-gen2",
>>         .data = rcar_pcie_hw_init_gen2 },
>>       { .compatible = "renesas,pcie-r8a7795", .data = rcar_pcie_hw_init },
>> +     { .compatible = "renesas,pcie-rcar-gen3",
>> +             .data = rcar_pcie_hw_init_hw_init },
>
> It looks like I failed to compile-test this.
>
> s/rcar_pcie_hw_init_hw_init/rcar_pcie_hw_init/

Bummer, and my tired eyes didn't notice...

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
