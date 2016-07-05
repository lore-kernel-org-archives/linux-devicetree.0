From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v4 2/2] PCI: Rockchip: Add Rockchip PCIe controller
 support
Date: Tue, 5 Jul 2016 10:08:08 +0800
Message-ID: <dcb37af0-89c5-ec37-5ace-7e4df61724a5@rock-chips.com>
References: <1467336290-11282-1-git-send-email-shawn.lin@rock-chips.com>
 <1467336290-11282-2-git-send-email-shawn.lin@rock-chips.com>
 <577646D3.7040207@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <577646D3.7040207@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2016/7/1 18:32, Marc Zyngier =E5=86=99=E9=81=93:
> On 01/07/16 02:24, Shawn Lin wrote:
>> This patch adds Rockchip PCIe controller support found
>> on RK3399 Soc platform.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>
>> ---
>
> [...]
>
>> +static void rockchip_pcie_legacy_int_handler(struct irq_desc *desc)
>> +{
>> +	struct irq_chip *chip =3D irq_desc_get_chip(desc);
>> +	struct rockchip_pcie_port *port;
>> +	u32 reg;
>> +
>> +	chained_irq_enter(chip, desc);
>> +	port =3D irq_desc_get_handler_data(desc);
>> +
>> +	reg =3D pcie_read(port, PCIE_CLIENT_INT_STATUS);
>> +	reg =3D (reg & ROCKCHIP_PCIE_RPIFR1_INTR_MASK) >>
>> +	       ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT;
>> +	if (reg)
>> +		generic_handle_irq(irq_find_mapping(port->irq_domain,
>> +						    ffs(reg)));
>
> Can't you get multiple pending interrupts at the same time? Here, you
> seem to only process one interrupt at a time, which is going to be
> pretty inefficient.
>

Yup, will fix it, thanks.

> How about something like:
>
> 	while (reg) {
> 		int hwirq =3D ffs(reg);
> 		int irq;
> 	=09
> 		reg &=3D ~BIT(hwirq);
> 		irq =3D irq_find_mapping(port->irq_domain, hwirq);
> 		if (irq)
> 			generic_handle_irq(irq);
> 	}
>
>> +	chained_irq_exit(chip, desc);
>> +}
>> +
>
> Thanks,
>
> 	M.
>


--=20
Best Regards
Shawn Lin
