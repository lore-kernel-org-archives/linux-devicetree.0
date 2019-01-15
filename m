From: Nishanth Menon <nm@ti.com>
Subject: Re: [RFC PATCH v4 10/13] soc: ti: Add MSI domain support for K3
 Interrupt Aggregator
Date: Tue, 15 Jan 2019 08:41:23 -0600
Message-ID: <20190115144123.3lmt4qqi5y5ssiym@kahuna>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
 <20181227061313.5451-10-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181227061313.5451-10-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: marc.zyngier@arm.com, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

On 11:43-20181227, Lokesh Vutla wrote:
> With the system coprocessor managing the range allocation of the
> inputs to Interrupt Aggregator, it is difficult to represent
> the device IRQs from DT.
> 
> The suggestion is to use MSI in such cases where devices wants
> to allocate and group interrupts dynamically.
> 
> Create a MSI domain bus layer that allocates and frees MSIs for
> a device.
> 
> APIs that are implemented are:
> - inta_msi_create_irq_domain() that creates a MSI domain
> - inta_msi_domain_alloc_group_irqs() that creates MSIs for the
>   specified device and source indexes. All these are expected to
>   be grouped by the parent interrupt controller to MSI domain.
> - inta_msi_domain_free_group_irqs() frees the grouped irqs.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> 
> - May be the same functionaly can be included in platform msi. But I would
>   like to get a feedback on the approach.
> 
>  drivers/soc/ti/Kconfig             |   6 +
>  drivers/soc/ti/Makefile            |   1 +
>  drivers/soc/ti/k3_inta_msi.c       | 193 +++++++++++++++++++++++++++++
>  include/linux/irqdomain.h          |   1 +
>  include/linux/msi.h                |   6 +
>  include/linux/soc/ti/k3_inta_msi.h |  22 ++++
>  6 files changed, 229 insertions(+)
>  create mode 100644 drivers/soc/ti/k3_inta_msi.c
>  create mode 100644 include/linux/soc/ti/k3_inta_msi.h

Did we miss maintainer file?

-- 
Regards,
Nishanth Menon
