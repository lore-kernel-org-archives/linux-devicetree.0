From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/3] PCI: rockchip: assert PERST# in S3
Date: Thu, 12 Oct 2017 15:27:16 -0700
Message-ID: <CAD=FV=VyERPq9yGE27Uvj6bs4Mru81gZAiqCOP=yQv3ai6-YDQ@mail.gmail.com>
References: <20171012205220.130048-1-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171012205220.130048-1-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 12, 2017 at 1:52 PM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Hi,
>
> This patch series should mostly be self-descriptive, but it's motivated by the
> fact that I've found differing requirements from PCIe endpoint makers regarding
> the state of PERST# when in system suspend (S3). Additionally, some existing
> boards are not especially well suited for holding PERST# low in S3 (e.g., the
> pin is driven by a non-PMU GPIO, so it's hard or impossible to keep it
> asserted). So the solution is...give it a device tree property!
>
> Brian
>
> Brian Norris (3):
>   Documentation/devicetree: Add pcie-reset-suspend property
>   of/pci: Add of_pci_get_pcie_reset_suspend() to parse
>     pcie-reset-suspend
>   PCI: rockchip: Support configuring PERST# state via DT
>
>  Documentation/devicetree/bindings/pci/pci.txt | 11 +++++++++++
>  drivers/of/of_pci.c                           | 25 +++++++++++++++++++++++++
>  drivers/pci/host/pcie-rockchip.c              |  7 +++++++
>  include/linux/of_pci.h                        |  7 +++++++
>  4 files changed, 50 insertions(+)

I'm nowhere near an expert on PCIe, but overall the series seems sane
to me.  ...and I'd agree that the discussions I've seen from different
vendors seem to have different opinions about what we should do with
this line in S3.  ...so FWIW:

Reviewed-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
