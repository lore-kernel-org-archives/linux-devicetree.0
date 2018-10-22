From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH v2 00/10] Add support for TISCI irqchip drivers
Date: Mon, 22 Oct 2018 13:39:02 -0700
Message-ID: <942981b8-7536-2b6b-ad49-dc59671cbda6@oracle.com>
References: <20181018154017.7112-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018154017.7112-1-lokeshvutla@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: Santosh Shilimkar <ssantosh@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

On 10/18/2018 8:40 AM, Lokesh Vutla wrote:
> TISCI abstracts the handling of IRQ routes where interrupt sources
> are not directly connected to host interrupt controller. This series
> adds support for:
> - TISCI commands needed for IRQ configuration
> - Interrupt Router(INTR) and Interrupt Aggregator(INTA) drivers
> 
> More information on TISCI IRQ management can be found here[1].
> Complete TISCI resource management information can be found here[2].
> AM65x SoC related TISCI information can be found here[3].
> INTR and INTA related information can be found in TRM[4].
> 
I didn't read the specs but from what you described in
INTA and INTR bindings, does the flow of IRQs like below ?

Device IRQ(e.g USB) -->INTR-->INTA--->HOST IRQ controller(GIC)

The confusing part is aggregator and can multiplex as well
as grouping but seems like its event grouping or multiplexing
than actual device IRQ grouping or multi-plexsing.

What am I missing ?

Regards,S
antosh
