Return-Path: <SRS0=gys9=SR=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com>
 <20190411200437.GR256045@google.com>
 <5bf9c119-5f1e-5f41-7c41-b4182cbba3c9@nvidia.com>
 <20190412143551.GD141472@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <12a87ca0-4e59-15b5-881a-86e896009fd8@nvidia.com>
Date: Mon, 15 Apr 2019 16:13:06 +0530
MIME-Version: 1.0
In-Reply-To: <20190412143551.GD141472@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 12-Apr-19 8:05 PM, Bjorn Helgaas wrote:
> On Fri, Apr 12, 2019 at 12:14:20PM +0530, Manikanta Maddireddy wrote:
>> On 12-Apr-19 1:34 AM, Bjorn Helgaas wrote:
>>> On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
>>>> Some of the legacy PCIe endpoints doesn't enumerate if root port adver=
tises
>>>> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
>>>> initially advertise only Gen-1 and after link is up, retrain link to G=
en-2
>>>> speed.
>>>>
>>>> Following two cards display this behaviour,
>>>>   - Fusion HDTV 5 Express card
>>>>   - IOGear SIL - PCIE - SATA card
>>> This sounds like a Tegra erratum.  If you think this is an issue with
>>> the endpoints above, not with Tegra, we should see issues with these
>>> cards in non-Tegra systems.
>>>
>>> If that's the case, we might need a more far-reaching solution that
>>> would fix issues with these cards in all systems.
>>>
>>> If it really is a Tegra erratum, that's fine; just own up to it in the
>>> commit log and comment so it's not misleading.
>> Based on PCIe LA traces with x86 platform:
>> =C2=A01) x86 initially advertises Gen1, Gen2 & Gen3 speeds. Link number =
negotiation does not happen
>> =C2=A0as end point does not lock down to the advertised link number from=
 RP.
>> =C2=A02) There are multiple entries to detect<->compliance from the both=
 the sides.
>> =C2=A03) After some time (or some counts of detect entry), x86 only adve=
rtises Gen1 speed in TS1
>> =C2=A04) This time end point responds to the link number in the TS1 and =
link comes up
>>
>> Tegra PCIe IP fails after step-2, it doesn't retry with only Gen1.
>> This is the reason for setting link speed to Gen1 and then start
>> LTSSM.
>>
>> I don't see anything mentioned about advertising lower link speed
>> and retrying link up in "Configuration Substate Machine" figure in
>> PCIe spec. I am not sure if it is mentioned anywhere in
>> implementation notes or left for implementer to decide in PCIe spec.
> There's a note in PCIe r4.0, sec 1.2 that says
>
>   Initialization =E2=80=93 During hardware initialization, each PCI Expre=
ss
>   Link is set up following a negotiation of Lane widths and frequency
>   of operation by the two agents at each end of the Link. No firmware
>   or operating system software is involved.
>
> I interpret that as meaning the hardware at each end of the link
> should be able to initialize the link without any help from software.
>
> I think the hardware pretty much *has* to be able to do that.
> Consider the native PCIe hotplug case: the OS has the generic pciehp
> driver, but no knowledge of any device-specific behavior of the
> Downstream Port leading to a hot-added device.  I don't *think*
> there's anything in the spec about software having to be involved in
> initializing the link in that case (correct me if I'm wrong), so the
> link has to come up correctly without any OS or firmware intervention.
>
> I'd argue that the same applies to this Tegra root port situation.  If
> some issue requires a workaround to bring the link up, you do have the
> opportunity to apply the fixup at probe-time.  But if you ever hope to
> support hotplug for the root port, I think you'll have trouble because
> I don't think there's a hook that lets you apply this fixup at hot-add
> time.

When you said "link initialization should happen without SW/firmware

intervention", it is after LTSSM is started, right? This patch programs

the target link speed before LTSSM is started.

As mentioned above these cards works on x86 because PCIe IP tires

link up with only Gen1 advertisement after "link number" negotiation fails.

Where as Tegra PCIe IP doesn't try with only Gen1 advertisement. i.e

=C2=A01) After LTSSM is initiated by driver, Tegra advertises Gen1 & Gen2
speeds. Link number negotiation does not happen.
=C2=A0as end point does not lock down to the advertised link number from RP=
.
=C2=A02) LTSSM state moves to disabled.

LTSSM sequence with current patch,
=C2=A01) After LTSSM is initiated by driver, Tegra advertises Gen1 speeds.
 2) This time end point responds to the link number in the TS1 and link
comes up

Setting target speed Gen1 is OK because HW autonomous speed change support

is not available in Tegra. After link up driver retrains the link to Gen2 a=
fter setting

Target speed.


Tegra doesn't support hot-plug, so no need to worry about this scenario

in hot-plug case.

>
>> I will update this information in next version of this patch to
>> justify why this is required only for Tegra.
>>>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>>>> ---
>>>>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controll=
er/pci-tegra.c
>>>> index 7dc728cc5f51..7e24eac12668 100644
>>>> --- a/drivers/pci/controller/pci-tegra.c
>>>> +++ b/drivers/pci/controller/pci-tegra.c
>>>> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegr=
a_pcie_port *port)
>>>>  		value |=3D soc->update_fc_val;
>>>>  		writel(value, port->base + RP_VEND_XP);
>>>>  	}
>>>> +
>>>> +	/*
>>>> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
>>>> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
>>>> +	 * Hence, the strategy followed here is to initially advertise
>>>> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
>>>> +	 */
>>>> +	value =3D readl(port->base + RP_LINK_CONTROL_STATUS_2);
>>>> +	value &=3D ~PCI_EXP_LNKSTA_CLS;
>>>> +	value |=3D PCI_EXP_LNKSTA_CLS_2_5GB;
>>>> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
>>>>  }
>>>> =20
>>>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>>>> --=20
>>>> 2.17.1
>>>>
