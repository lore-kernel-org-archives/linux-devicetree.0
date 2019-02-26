From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 0/4] mwifiex PCI/wake-up interrupt fixes
Date: Tue, 26 Feb 2019 17:14:00 +0000
Message-ID: <0c433a70-27f6-76ad-c46c-6015de1ffaa4@arm.com>
References: <20190224140426.3267-1-marc.zyngier@arm.com>
 <CAKv+Gu9OOzOxx0rTAZqM8r4q_hRmOp3b=KP7fwgNeiu67FCApA@mail.gmail.com>
 <5310b73b-4821-6dff-b9c0-34c59fb7fd72@arm.com>
 <CAKv+Gu_=bQyVZqgUnJm9moCcaCcpDrag6NWGEpaR65=pMiTFJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu_=bQyVZqgUnJm9moCcaCcpDrag6NWGEpaR65=pMiTFJQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Ganapathi Bhat <gbhat@marvell.com>, Heiko Stuebner <heiko@sntech.de>, Kalle Valo <kvalo@codeaurora.org>, Nishant Sarmukadam <nishants@marvell.com>, Rob Herring <robh+dt@kernel.org>, Xinming Hu <huxinming820@gmail.com>, Devicetree List <devicetree@vger.kernel.org>, "<netdev@vger.kernel.org>" <netdev@vger.kernel.org>, "<linux-wireless@vger.kernel.org>" <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 26/02/2019 16:21, Ard Biesheuvel wrote:
> On Mon, 25 Feb 2019 at 15:53, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>
>> Hi Ard,
>>
>> On 25/02/2019 12:45, Ard Biesheuvel wrote:
>>> On Sun, 24 Feb 2019 at 15:08, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>>>
>>>> For quite some time, I wondered why the PCI mwifiex device built in my
>>>> Chromebook was unable to use the good old legacy interrupts. But as MSIs
>>>> were working fine, I never really bothered investigating. I finally had a
>>>> look, and the result isn't very pretty.
>>>>
>>>> On this machine (rk3399-based kevin), the wake-up interrupt is described as
>>>> such:
>>>>
>>>> &pci_rootport {
>>>>         mvl_wifi: wifi@0,0 {
>>>>                 compatible = "pci1b4b,2b42";
>>>>                 reg = <0x83010000 0x0 0x00000000 0x0 0x00100000
>>>>                        0x83010000 0x0 0x00100000 0x0 0x00100000>;
>>>>                 interrupt-parent = <&gpio0>;
>>>>                 interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
>>>>                 pinctrl-names = "default";
>>>>                 pinctrl-0 = <&wlan_host_wake_l>;
>>>>                 wakeup-source;
>>>>         };
>>>> };
>>>>
>>>> Note how the interrupt is part of the properties directly attached to the
>>>> PCI node. And yet, this interrupt has nothing to do with a PCI legacy
>>>> interrupt, as it is attached to the wake-up widget that bypasses the PCIe RC
>>>> altogether (Yay for the broken design!). This is in total violation of the
>>>> IEEE Std 1275-1994 spec[1], which clearly documents that such interrupt
>>>> specifiers describe the PCI device interrupts, and must obey the
>>>> INT-{A,B,C,D} mapping. Oops!
>>>>
>>>
>>> The mapping of legacy PCIe INTx interrupts onto wired system
>>> interrupts is a property of the PCIe host controller, not of a
>>> particular PCIe device. So I would argue that the code is broken here
>>> as well: it should never attempt to interpret 'interrupt' properties
>>> at the PCI device level as having any bearing on how legacy interrupts
>>> are routed.
>>
>> OpenFirmware says that this node contains the interrupt number of the
>> device (4.1.1. Open Firmware-defined Properties for Child Nodes). The
>> trick is that this property is generated *from* the device, and not set
>> in stone.
>>
>> DT, on the other hand, takes whatever is described there and uses it as
>> the gospel to configure the OS, no matter how the PCI device is actually
>> configured. If the two don't match (like in this case), things break.
>> This is the "DT describes the HW" mantra, for (sometimes) better or
>> (more generally) worse.
>>
>> What the DT code does is to interpret the whole interrupt specifier,
>> *including the interrupt-parent*. And that feels wrong. It should always
>> be in the context of the host controller. But on the other side, the DT
>> code is not in the business of validating the DT either...
>>
>> It outlines one thing: If you have to interpret per-device PCI
>> properties from DT, you're in for serious trouble. I should get some
>> better HW.
>>
> 
> Yeah, it obviously makes no sense at all for the interrupt parent of a
> PCI device to deviate from the host bridge's interrupt parent, and
> it's quite unfortunate that we can't simply ban it now that the cat is
> out of the bag already.
> 
> Arguably, the wake up widget is not part of the PCI device, but I have
> no opinion as to whether it is better modeling it as a sub device as
> you are proposing or as an entirely separate device referenced via a
> phandle.

It is not that clear. The widget seems to be an integral part of the
device, as it is the same basic IP that is used for SDIO and USB.

It looks like the good old pre-PCI-2.2 days, where you had to have a
separate cable between your network card and the base-board for the
wake-up interrupt to be delivered. Starting with PCI-2.2, the bus can
carry the signal just fine. With PCIe, it should just be an interrupt
TLP sent to the RC, but that's obviously not within the capabilities of
the HW.

Anyway, it'd be good if the Marvell people could chime in and let us
know how they'd prefer to handle this.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
