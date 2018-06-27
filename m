From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/4] PCI: mediatek: fixup mtk_pcie_find_port logical
Date: Wed, 27 Jun 2018 19:35:03 +0300
Message-ID: <CAHp75Ve2N_Bt8FvX8xCx3JtQ+ozZE=isfsKp9swY+86Cg-78XQ@mail.gmail.com>
References: <1530091298-28120-1-git-send-email-honghui.zhang@mediatek.com> <1530091298-28120-2-git-send-email-honghui.zhang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530091298-28120-2-git-send-email-honghui.zhang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Honghui Zhang <honghui.zhang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, yingjoe.chen@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>, ryder.lee@mediatek.com, hongkun.cao@mediatek.com, youlin.pei@mediatek.com, yong.wu@mediatek.com, YT Shen <yt.shen@mediatek.com>, sean.wang@mediatek.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 12:21 PM,  <honghui.zhang@mediatek.com> wrote:
> From: Honghui Zhang <honghui.zhang@mediatek.com>
>
> Mediatek's host controller have two slots, each have it's own control
> registers. The host driver need to identify which slot was connected
> in order to access the device's configuration space. There's problem
> for current host driver to find out which slot was connected to for
> a given EP device.
>
> Assuming each slot have connect with one EP device as below:
>
>                 host bridge
>   bus 0 --> __________|_______
>            |                  |
>            |                  |
>          slot 0             slot 1
>   bus 1 -->|        bus 2 --> |
>            |                  |
>          EP 0               EP 1
>
> While PCI emulation, system software will scan all the PCI device
> starting from devfn 0. So it will get the proper port for slot0 and
> slot1 device when using PCI_SLOT(devfn) for match. But it will get
> the wrong slot for EP1: The devfn will be start from 0 when scanning
> EP1 behind slot1, it will get port0 since the PCI_SLOT(EP1) is match
> for port0's slot value. So the host driver should not using EP's devfn
> but the slot's devfn(the slot which EP was connected to) for match.
>
> This patch fix the mtk_pcie_find_port's logical by using the slot's
> devfn for match.


> +       list_for_each_entry(port, &pcie->ports, list) {
> +               if (bus->number == 0 && port->slot == PCI_SLOT(devfn)) {
>                         return port;
> +               } else if (bus->number != 0) {

You can do it like (no need 'else')

if (...)
 return ...;
if (bus->number) {
 ...
}

> +                       pbus = bus;
> +                       do {
> +                               dev = pbus->self;
> +                               if (port->slot == PCI_SLOT(dev->devfn))
> +                                       return port;
> +
> +                               pbus = dev->bus;
> +                       } while (dev->bus->number != 0);

This can be rewritten like

pbus = bus;
while (pbus->number) {
 dev = ...;
 ...
 pbus = dev->bus;
}

and no need for if (bus->number) anymore.

> +               }
> +       }
>
>         return NULL;
>  }
> --
> 2.6.4
>



-- 
With Best Regards,
Andy Shevchenko
