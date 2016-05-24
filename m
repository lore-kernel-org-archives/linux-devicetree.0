From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH 1/2] Documentation: add binding description of Rockchip
 PCIe controller
Date: Tue, 24 May 2016 09:42:09 +0800
Message-ID: <78de1cf5-e23d-d217-2d68-bdd8c6e4b477@rock-chips.com>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <3930626.4a3xBnzHhK@phil>
 <766c3fc9-7e92-6235-76d5-803cc116845a@rock-chips.com>
 <35714508.Tep5CcJBvk@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <35714508.Tep5CcJBvk@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: shawn.lin@rock-chips.com, shawn.lin@kernel-upstream.org, Bjorn Helgaas <bhelgaas@google.com>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2016/5/24 3:53, Heiko Stuebner wrote:
> Am Samstag, 21. Mai 2016, 11:55:35 schrieb Shawn Lin:
>> On 2016/5/20 19:20, Heiko Stuebner wrote:
>>> Hi Shawn,
>>>
>>> Am Freitag, 20. Mai 2016, 18:29:06 schrieb Shawn Lin:
>>>> This patch add some required and optional properties for Rockchip
>>>> PCIe controller. Also we add a example for how to use it.
>>>>
>>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>>>
>>>> ---
>
> [...]
>
>>>> +- msi-parent: Link to the hardware entity that serves as the Mess=
age
>>>> +- pinctrl-names : The pin control state names
>>>> +- pinctrl-0: The "default" pinctrl state
>>>
>>> I'm not sure if pinctrl-properties need to be described when you do=
n't
>>> need special handling in the form of additional pin states. The pci=
e
>>> part does not do any pin-handling of its own.
>>
>> We need it in prevention of any firmwares change the default state
>> of #CLKREQ which is useful for ASPM. Also we have a backup pin for
>> clkreqn called clkreqnb, which should be taken more consideration si=
nce
>> when refering to any one of these two, pinctrl should configure the
>> bit[14] of GRF_SOC_CON7 automatically. But it is unfortunately beyou=
nd
>> the implementation of pinctrl-rk3399.
>>
>> BTW, I don't know if we wanna support this action inside the pinctrl
>> code?
>
> The TRM says for me for that bit only "pcie_clkreq_sel port control" =
and
> that naming really suggests that it is a property of the pcie control=
ler,
> not the generic pinctrl. So if this needs to be touched the pcie cont=
roller
> needs to do it.

I don't agree that pcie controller should do it. As a common driver, it
should not care two much setting related to io selection which is very
likely to be changed in the future Socs. Shuld it always keep a
reference to bit[ABC] of GRF_SOC_CONXYZ, and should it adds some code
to see which IO is selected for #CLKREQ?

Currently I do it in firmware, but it's worth to make some discussion
as there are also some IO backup slelections the GRF of RK3399. Anyway,
let's skip this topic from the $SUBJECT patch.

>
>
>>>> +- interrupt-map-mask and interrupt-map: standard PCI properties
>>>> +- interrupt-controller: identifies the node as an interrupt contr=
oller
>>>> +
>>>> +Optional Property:
>>>> +- ep-gpios: contain the entry for pre-reset gpio
>>>> +- num-lanes: number of lanes to use
>>>> +- assigned-clocks, assigned-clock-parents and assigned-clock-rate=
s:
>>>> standard +		   clock bindings. See ../clock/clock-bindings.txt
>>>
>>> Again that (assigned-clocks handling) is not actual part of the pci=
-
>>> controllers actions, but other parts and also described already
>>> elsewhere.
>> Basically it does. But this is an alternative choice for pcie-phy to
>> generate the ref_clk. When we want 100MHz src clk for PLL inside the
>> pcie-phy=EF=BC=8Cwe should add them, otherwise it's taken from xin 2=
4MHz.
>>
>> This is useful for SI testing or some others special cases. So shoul=
d we
>> add it as an option and leave a sample here?
>
> What I meant was that while clock handling is important when looking =
at the
> whole system, the pcie controller itself does only care that it gets =
a
> clock, but not that much where you get it from.
>
> So while assigned-clocks has its place in the real devicetree, I don'=
t think
> it is an element of the actual pcie-controller binding.

Oh, I see.. So it seems good to keep all the assigned-clocks in on
place. I will remove it from this patch.

>
>
> Heiko
>
>
>


--=20
Best Regards
Shawn Lin
