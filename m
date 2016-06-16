From: Wenrui Li <wenrui.li@rock-chips.com>
Subject: Re: [PATCH v3 1/2] Documentation: bindings: add dt doc for Rockchip
 PCIe controller
Date: Thu, 16 Jun 2016 16:01:12 +0800
Message-ID: <da207bdc-738f-f2b1-7026-e368355936e9@rock-chips.com>
References: <1466041821-1649-1-git-send-email-shawn.lin@rock-chips.com>
 <5811436.gqkV56Lax5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <5811436.gqkV56Lax5@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 2016/6/16 15:00, Arnd Bergmann =E5=86=99=E9=81=93:
> On Thursday, June 16, 2016 9:50:21 AM CEST Shawn Lin wrote:
>
>> +	reset-names =3D "core", "mgmt", "mgmt-sticky", "pipe";
>> +	phys =3D <&pcie_phy>;
>> +	phy-names =3D "pcie-phy";
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pcie_clkreq>;
>> +	#interrupt-cells =3D <1>;
>> +	interrupt-controller;
>> +	interrupt-map-mask =3D <0 0 0 7>;
>> +	interrupt-map =3D <0 0 0 1 &pcie0 1>,
>> +			<0 0 0 2 &pcie0 2>,
>> +			<0 0 0 3 &pcie0 3>,
>> +			<0 0 0 4 &pcie0 4>;
>> +};
>>
>
> One thing that came up in the review of the new Marvell PCIe driver i=
s that it's
> most likely invalid for a device node to have both "interrupt-control=
ler"
> and "interrupt-map" properties. I originally thought this was a nice =
way to
> handle embedded irqchips within the PCIe host, but it only really wor=
ks
> by coincidence with the current kernel, and only as long as the hwirq=
 number
> of the irqchip matches the integer representation of the irq line in =
the root
> bridge (which it does in the example above).
>
> For that driver we concluded that it would be less of a hack to have =
the
> irqchip as a child node of the PCIe host after all (just not with
> device_type=3D"pci" of course), and that makes the translation work a=
s
> expected.
>
> 	Arnd
>

Original driver have an irqchip as child node. But Marc suggested don't=
=20
need an intermediate node here.
Now the conclusion is to retain the child node?

>
>
