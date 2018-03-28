From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 6/8] PCI: dwc: Replace lower into upper case characters
Date: Wed, 28 Mar 2018 09:05:57 -0300
Message-ID: <CAOMZO5AyzTqpVofx6wf4oHsWjwaC=94o8dgbJSs0rhnc8OwPkA@mail.gmail.com>
References: <cover.1522235224.git.gustavo.pimentel@synopsys.com> <e3c679c8bd516602d1f7cf5182cf718414e74089.1522235224.git.gustavo.pimentel@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e3c679c8bd516602d1f7cf5182cf718414e74089.1522235224.git.gustavo.pimentel@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Jingoo Han <jingoohan1@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pci@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Gustavo,

On Wed, Mar 28, 2018 at 8:38 AM, Gustavo Pimentel
<gustavo.pimentel@synopsys.com> wrote:

> diff --git a/drivers/pci/dwc/pcie-designware-host.c b/drivers/pci/dwc/pcie-designware-host.c
> index 550fdbb..03e9b82 100644
> --- a/drivers/pci/dwc/pcie-designware-host.c
> +++ b/drivers/pci/dwc/pcie-designware-host.c
> @@ -248,8 +248,10 @@ static void dw_pcie_irq_domain_free(struct irq_domain *domain,
>         unsigned long flags;
>
>         raw_spin_lock_irqsave(&pp->lock, flags);
> +
>         bitmap_release_region(pp->msi_irq_in_use, data->hwirq,
>                               order_base_2(nr_irqs));
> +
>         raw_spin_unlock_irqrestore(&pp->lock, flags);
>  }

This looks like an unrelated change.
