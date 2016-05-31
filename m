From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: add binding description of Rockchip
 PCIe controller
Date: Tue, 31 May 2016 11:09:43 +0100
Message-ID: <574D62E7.50404@arm.com>
References: <1463740105-7061-1-git-send-email-shawn.lin@rock-chips.com>
 <1463740146-7106-1-git-send-email-shawn.lin@rock-chips.com>
 <20160530120836.290f0d16@arm.com>
 <c6fa65a1-58bd-520a-42a1-d6edf576840a@kernel-upstream.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c6fa65a1-58bd-520a-42a1-d6edf576840a-NgiFYW8Wbx6Ta72+1OMJgUB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-NgiFYW8Wbx6Ta72+1OMJgUB+6BGkLq7r@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 31/05/16 10:48, Shawn Lin wrote:
> Hi Marc,
>=20
> =E5=9C=A8 2016/5/30 19:08, Marc Zyngier =E5=86=99=E9=81=93:
>> On Fri, 20 May 2016 18:29:06 +0800
>> Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>
>>> This patch add some required and optional properties for Rockchip
>>> PCIe controller. Also we add a example for how to use it.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>
>>> ---
>>>
>>>  .../devicetree/bindings/pci/rockchip-pcie.txt      | 93 ++++++++++=
++++++++++++
>>>  1 file changed, 93 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/pci/rockchip-=
pcie.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.tx=
t b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
>>> new file mode 100644
>>> index 0000000..69a0804
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
>>> @@ -0,0 +1,93 @@
>>> +* Rockchip AXI PCIe Root Port Bridge DT description
>>> +
>>> +Required properties:
>>> +- #address-cells: Address representation for root ports, set to <3=
>
>>> +- #size-cells: Size representation for root ports, set to <2>
>>> +- #interrupt-cells: specifies the number of cells needed to encode=
 an
>>> +		interrupt source. The value must be 1.
>>> +- compatible: Should contain "rockchip,rk3399-pcie"
>>> +- reg: Two register ranges as listed in the reg-names property
>>> +- reg-names: The first entry must be "axi-base" for the core regis=
ters
>>> +	The second entry must be "apb-base" for the client pcie registers
>>> +- clocks: Must contain an entry for each entry in clock-names.
>>> +		See ../clocks/clock-bindings.txt for details.
>>> +- clock-names: Must include the following entries:
>>> +	- "aclk_pcie"
>>> +	- "aclk_perf_pcie"
>>> +	- "hclk_pcie"
>>> +	- "clk_pciephy_ref"
>>> +- interrupts: Three interrupt entries must be specified.
>>> +- interrupt-names: Must include the following names
>>> +	- "pcie-sys"
>>> +	- "pcie-legacy"
>>> +	- "pcie-client"
>>> +- resets: Must contain five entries for each entry in reset-names.
>>> +	   See ../reset/reset.txt for details.
>>> +- reset-names: Must include the following names
>>> +	- "phy-rst"
>>> +	- "core-rst"
>>> +	- "mgmt-rst"
>>> +	- "mgmt-sticky-rst"
>>> +	- "pipe-rst"
>>> +- rockchip,grf: phandle to the syscon managing the "general regist=
er files"
>>> +- pcie-conf: offset of pcie client block for  configuration
>>> +- pcie-status: offset of pcie client block for status
>>> +- pcie-laneoff: offset of pcie client block for lane
>>> +- msi-parent: Link to the hardware entity that serves as the Messa=
ge
>>> +- pinctrl-names : The pin control state names
>>> +- pinctrl-0: The "default" pinctrl state
>>> +- interrupt-map-mask and interrupt-map: standard PCI properties
>>> +- interrupt-controller: identifies the node as an interrupt contro=
ller
>>> +
>>> +Optional Property:
>>> +- ep-gpios: contain the entry for pre-reset gpio
>>> +- num-lanes: number of lanes to use
>>> +- assigned-clocks, assigned-clock-parents and assigned-clock-rates=
: standard
>>> +		   clock bindings. See ../clock/clock-bindings.txt
>>> +
>>> +Example:
>>> +
>>> +pci_express: axi-pcie@f8000000 {
>>> +	#address-cells =3D <3>;
>>> +	#size-cells =3D <2>;
>>> +	compatible =3D "rockchip,rk3399-pcie";
>>> +	clocks =3D <&cru ACLK_PCIE>, <&cru ACLK_PERF_PCIE>,
>>> +		 <&cru PCLK_PCIE>, <&cru SCLK_PCIEPHY_REF>;
>>> +	clock-names =3D "aclk_pcie", "aclk_perf_pcie",
>>> +		      "hclk_pcie", "clk_pciephy_ref";
>>> +	bus-range =3D <0x0 0x1>;
>>> +	interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 50 IRQ_=
TYPE_LEVEL_HIGH>,
>>> +		     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
>>> +	interrupt-names: "pcie-sys", "pcie-legacy", "pcie-client";
>>> +	assigned-clocks =3D <&cru SCLK_PCIEPHY_REF>;
>>> +	assigned-clock-parents =3D <&cru SCLK_PCIEPHY_REF100M>;
>>> +	assigned-clock-rates =3D <100000000>;
>>> +	ep-gpios =3D <&gpio3 13 GPIO_ACTIVE_HIGH>;
>>> +	ranges =3D < 0x82000000 0 0xfa000000 0x0 0xfa000000 0 0x600000
>>> +		   0x81000000 0 0xfa600000 0x0 0xfa600000 0 0x100000 >;
>>> +	num-lanes =3D <4>;
>>> +	reg =3D < 0x0 0xf8000000 0x0 0x2000000 >, < 0x0 0xfd000000 0x0 0x=
1000000 >;
>>> +	reg-name =3D "axi-base", "apb-base";
>>> +	resets =3D <&cru SRST_PCIEPHY>, <&cru SRST_PCIE_CORE>, <&cru SRST=
_PCIE_MGMT>,
>>> +		 <&cru SRST_PCIE_MGMT_STICKY>, <&cru SRST_PCIE_PIPE>;
>>> +	reset-names =3D "phy-rst", "core-rst", "mgmt-rst", "mgmt-sticky-r=
st", "pipe-rst";
>>> +	rockchip,grf =3D <&grf>;
>>> +	pcie-conf =3D <0xe220>;
>>> +	pcie-status =3D <0xe2a4>;
>>> +	pcie-laneoff =3D <0xe214>;
>>> +	pinctrl-names =3D "default";
>>> +	pinctrl-0 =3D <&pcie_clkreq>;
>>> +	msi-parent =3D <&its>;
>>
>> We've moved away from bare msi-parent for the ITS (notice that the
>> binding mandates #msi-cells =3D <1>). So what you need here is an ms=
i-map
>> (as described in Documentation/devicetree/bindings/pci/pci-msi.txt).
>>
>> Do you have an IOMMU (or some other remapping HW) between the RC and=
 the
>> GIC ITS? If so, yo may have to describe the mappings between the PCI=
e
>> RID and the ITS DevID in this msi-map.
>>
>=20
> yes, we don't need msi-parent here. And we don't need msi-map as well=
,
> since we don't have a IOMMU block between RC and ITS which need to be
> described in msi-map.

Well, if have neither msi-parent nor msi-map, you won't get MSI at all.

Maybe that's good enough for you, but in that case, make sure you drop
all the MSI code from your patches! ;-) More seriously, you do need an
msi-map, even if that's with a single entry.

Thanks,

	M.
--=20
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
