From: Ilya Ledvich <ilya@compulab.co.il>
Subject: Re: [PATCH v3] PCI: imx6: Add PHY reference clock source support
Date: Wed, 10 Jan 2018 15:43:41 +0200
Message-ID: <498e20c0-7b86-0f86-7555-64a012b85b9e@compulab.co.il>
References: <CAOMZO5AFC9dxhsQjmRrDA7Z3KMkEemryKOBmQhXm19NXKxHkKQ@mail.gmail.com>
 <1515073977-10153-1-git-send-email-ilya@compulab.co.il>
 <1515408232.12538.7.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1515408232.12538.7.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On 01/08/2018 12:43 PM, Lucas Stach wrote:
> Am Donnerstag, den 04.01.2018, 15:52 +0200 schrieb Ilya Ledvich:
>> i.MX7D variant of the IP can use either Crystal Oscillator input
>> or internal clock input as a Reference Clock input for PCIe PHY.
>> Add support for an optional property 'fsl,pcie-phy-refclk-internal'.
>> If present then an internal clock input is used as PCIe PHY
>> reference clock source. By default an external oscillator input
>> is still used.
>>
>> Verified on Compulab SBC-iMX7 Single Board Computer.
>=20
> Sorry to get in late here, but I would rather have the external clock
> input modeled as a real clock and only use the internal clock if that
> isn't present.
>=20

I tried to follow the logic described in the iMX7 TRM, where external=20
oscillator is a default option. Additionally, the external clock input=20
model you've suggested, requires additional changes in the iMX7 SabreSD=20
board (and probably other boards which use an external input too)=20
devicetree files.

> Are you even sure that the i.MX7 clock you mention isn't the already
> documented "pcie_bus" clock? This one is also allowed to be sourced
> externally on the i.MX6.

To the best of my understanding it's not the pcie_bus clock, but I'm=20
absolutely sure. Could anybody from the BSP team guys elaborate on this=20
issue? Thanks a lot!
Best regards,
Ilya.

>> ---
>> changes since V2:
>> 	add a vendor prefix 'fsl' to a new property
>>
>>  =C2=A0Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt | 5 ++=
+++
>>  =C2=A0drivers/pci/dwc/pci-imx6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=
 8
>> +++++++-
>>  =C2=A02 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> index 7b1e48b..1591a6a 100644
>> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
>> @@ -50,6 +50,11 @@ Additional required properties for imx7d-pcie:
>>  =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "pciephy"
>>  =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- "apps"
>>  =20
>> +Additional optional properties for imx7d-pcie:
>> +- fsl,pcie-phy-refclk-internal: If present then an internal PLL
>> input is used
>> +=C2=A0=C2=A0as PCIe PHY reference clock source. By default an externa=
l
>> oscillator input
>> +=C2=A0=C2=A0is used.
>> +
>>  =C2=A0Example:
>>  =20
>>  =C2=A0	pcie@0x01000000 {
>> diff --git a/drivers/pci/dwc/pci-imx6.c b/drivers/pci/dwc/pci-imx6.c
>> index b734835..36812d3 100644
>> --- a/drivers/pci/dwc/pci-imx6.c
>> +++ b/drivers/pci/dwc/pci-imx6.c
>> @@ -61,6 +61,7 @@ struct imx6_pcie {
>>  =C2=A0	u32			tx_swing_low;
>>  =C2=A0	int			link_gen;
>>  =C2=A0	struct regulator	*vpcie;
>> +	bool			pciephy_refclk_sel;
>>  =C2=A0};
>>  =20
>>  =C2=A0/* Parameters for the waiting for PCIe PHY PLL to lock on i.MX7=
 */
>> @@ -474,7 +475,9 @@ static void imx6_pcie_init_phy(struct imx6_pcie
>> *imx6_pcie)
>>  =C2=A0	switch (imx6_pcie->variant) {
>>  =C2=A0	case IMX7D:
>>  =C2=A0		regmap_update_bits(imx6_pcie->iomuxc_gpr,
>> IOMUXC_GPR12,
>> -				=C2=A0=C2=A0=C2=A0IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
>> 0);
>> +				=C2=A0=C2=A0=C2=A0IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
>> +				=C2=A0=C2=A0=C2=A0imx6_pcie->pciephy_refclk_sel ?
>> +				=C2=A0=C2=A0=C2=A0IMX7D_GPR12_PCIE_PHY_REFCLK_SEL :
>> 0);
>>  =C2=A0		break;
>>  =C2=A0	case IMX6SX:
>>  =C2=A0		regmap_update_bits(imx6_pcie->iomuxc_gpr,
>> IOMUXC_GPR12,
>> @@ -840,6 +843,9 @@ static int imx6_pcie_probe(struct platform_device
>> *pdev)
>>  =C2=A0		imx6_pcie->vpcie =3D NULL;
>>  =C2=A0	}
>>  =20
>> +	imx6_pcie->pciephy_refclk_sel =3D
>> +		of_property_read_bool(node, "fsl,pcie-phy-refclk-
>> internal");
>> +
>>  =C2=A0	platform_set_drvdata(pdev, imx6_pcie);
>>  =20
>>  =C2=A0	ret =3D imx6_add_pcie_port(imx6_pcie, pdev);
