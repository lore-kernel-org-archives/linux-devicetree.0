Return-Path: <SRS0=79tX=SO=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH 14/30] PCI: tegra: Set target speed as Gen1 before link up
References: <20190411170355.6882-1-mmaddireddy@nvidia.com>
 <20190411170355.6882-15-mmaddireddy@nvidia.com>
 <20190411200437.GR256045@google.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <5bf9c119-5f1e-5f41-7c41-b4182cbba3c9@nvidia.com>
Date: Fri, 12 Apr 2019 12:14:20 +0530
MIME-Version: 1.0
In-Reply-To: <20190411200437.GR256045@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 12-Apr-19 1:34 AM, Bjorn Helgaas wrote:
> On Thu, Apr 11, 2019 at 10:33:39PM +0530, Manikanta Maddireddy wrote:
>> Some of the legacy PCIe endpoints doesn't enumerate if root port adverti=
ses
>> both Gen-1 and Gen-2 speeds. Hence, the strategy followed here is to
>> initially advertise only Gen-1 and after link is up, retrain link to Gen=
-2
>> speed.
>>
>> Following two cards display this behaviour,
>>   - Fusion HDTV 5 Express card
>>   - IOGear SIL - PCIE - SATA card
> This sounds like a Tegra erratum.  If you think this is an issue with
> the endpoints above, not with Tegra, we should see issues with these
> cards in non-Tegra systems.
>
> If that's the case, we might need a more far-reaching solution that
> would fix issues with these cards in all systems.
>
> If it really is a Tegra erratum, that's fine; just own up to it in the
> commit log and comment so it's not misleading.

Based on PCIe LA traces with x86 platform:
=C2=A01) x86 initially advertises Gen1, Gen2 & Gen3 speeds. Link number neg=
otiation does not happen
=C2=A0as end point does not lock down to the advertised link number from RP=
.
=C2=A02) There are multiple entries to detect<->compliance from the both th=
e sides.
=C2=A03) After some time (or some counts of detect entry), x86 only adverti=
ses Gen1 speed in TS1
=C2=A04) This time end point responds to the link number in the TS1 and lin=
k comes up

Tegra PCIe IP fails after step-2, it doesn't retry with only Gen1. This is =
the reason for

setting link speed to Gen1 and then start LTSSM.

I don't see anything mentioned about advertising lower link speed and retry=
ing

link up in "Configuration Substate Machine" figure in PCIe spec. I am not s=
ure

if it is mentioned anywhere in implementation notes or left for implementer=
 to

decide in PCIe spec.

I will update this information in next version of this patch to justify why=
 this is required

only for Tegra.

>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>>  drivers/pci/controller/pci-tegra.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller=
/pci-tegra.c
>> index 7dc728cc5f51..7e24eac12668 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -670,6 +670,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_=
pcie_port *port)
>>  		value |=3D soc->update_fc_val;
>>  		writel(value, port->base + RP_VEND_XP);
>>  	}
>> +
>> +	/*
>> +	 * PCIe link doesn't come up with few legacy PCIe endpoints
>> +	 * if root port advertises both Gen-1 and Gen-2 speeds.
>> +	 * Hence, the strategy followed here is to initially advertise
>> +	 * only Gen-1 and after link is up, retrain link to Gen-2 speed
>> +	 */
>> +	value =3D readl(port->base + RP_LINK_CONTROL_STATUS_2);
>> +	value &=3D ~PCI_EXP_LNKSTA_CLS;
>> +	value |=3D PCI_EXP_LNKSTA_CLS_2_5GB;
>> +	writel(value, port->base + RP_LINK_CONTROL_STATUS_2);
>>  }
>> =20
>>  static void tegra_pcie_port_enable(struct tegra_pcie_port *port)
>> --=20
>> 2.17.1
>>
