From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 4/8] dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue
 Bindings
Date: Fri, 1 Mar 2019 11:25:19 +0100
Message-ID: <402e6364-26f2-b0f3-c7f5-f9b32b076c5c@baylibre.com>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
 <20190212151413.24632-5-narmstrong@baylibre.com>
 <20190228162906.GA2387@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228162906.GA2387@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28/02/2019 17:29, Rob Herring wrote:
> On Tue, Feb 12, 2019 at 04:14:09PM +0100, Neil Armstrong wrote:
>> Adds the bindings for the Amlogic G12A USB Glue HW.
>>
>> The Amlogic G12A SoC Family embeds 2 USB Controllers :
>> - a DWC3 IP configured as Host for USB2 and USB3
>> - a DWC2 IP configured as Peripheral USB2 Only
>>
>> A glue connects these both controllers to 2 USB2 PHYs,
>> and optionnally to an USB3+PCIE Combo PHY shared with the PCIE controller.
>>
>> The Glue configures the UTMI 8bit interfaces for the USB2 PHYs, including
>> routing of the OTG PHY between the DWC3 and DWC2 controllers, and
>> setups the on-chip OTG mode selection for this PHY.
>>
>> The PHYs are children of the Glue node since the Glue controls the interface
>> with the PHY, not the DWC3 controller.
>>
>> The PHY interconnect is handled into ports subnodes, which eases describing
>> which PHY is enabled (like the USB3 shared PHY) and futures layouts on
>> derivatives of the G12A Family.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/usb/amlogic,dwc3.txt  | 109 ++++++++++++++++++
>>  1 file changed, 109 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> index 9a8b631904fd..c7c4726ef10d 100644
>> --- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> @@ -40,3 +40,112 @@ Example device nodes:
>>  				phy-names = "usb2-phy", "usb3-phy";
>>  			};
>>  		};
>> +
>> +Amlogic Meson G12A DWC3 USB SoC Controller Glue
>> +
>> +The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
>> +in host-only mode, and a DWC2 IP Core configured for USB2 peripheral mode
>> +only.
>> +
>> +A glue connects the DWC3 core to USB2 PHYs and optionnaly to an USB3 PHY.
>> +
>> +One of the USB2 PHY can be re-routed in peripheral mode to a DWC2 USB IP.
>> +
>> +The DWC3 Glue controls the PHY routing and power, an interrupt line is
>> +connected to the Glue to serve as OTG ID change detection.
>> +
>> +Required properties:
>> +- compatible:	Should be "amlogic,meson-g12a-usb-ctrl"
>> +- clocks:	a handle for the "USB" clock
>> +- clock-names:	must be "usb"
>> +- resets:	a handle for the shared "USB" reset line
>> +- reset-names:	must be "usb"
> 
> -name for a single entry is pointless.
> 
>> +- reg:		The base address and length of the registers
>> +- interrupts:	the interrupt specifier for the OTG detection
>> +
>> +Required child nodes:
>> +
>> +USB Ports are described as child 'port' nodes grouped under a 'ports' node,
>> +with #address-cells, #size-cells specified.
>> +
>> +Each 'port' sub-node identifies a possible USB Port served by an USB PHY
>> +identified by the 'phy' property as decribed in ../phy/phy-bindings.txt
>> +
>> +Each 'port' is identified by a reg property to number the port.
>> +
>> +The following table lists for each supported model the port number
>> +corresponding to each PHY serving a physical USB Port.
>> +
>> + Family	   Port 0     Port 1    Port 2    Port 3    Port 4
>> +---------------------------------------------------------------
>> + G12A	   USBHOST_A  USBOTG_B  Reserved  Reserved  USB3_0
>> +
>> +A child node must exist to represent the core DWC3 IP block. The name of
>> +the node is not important. The content of the node is defined in dwc3.txt.
>> +
>> +A child node must exist to represent the core DWC2 IP block. The name of
>> +the node is not important. The content of the node is defined in dwc2.txt.
>> +
>> +PHY documentation is provided in the following places:
>> +- Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
>> +- Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
>> +
>> +
>> +Example device nodes:
>> +	usb: usb@ffe09000 {
>> +			compatible = "amlogic,meson-g12a-usb-ctrl";
>> +			reg = <0x0 0xffe09000 0x0 0xa0>;
>> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&clkc CLKID_USB>;
>> +			clock-names = "usb";
>> +			resets = <&reset RESET_USB>;
>> +			reset-names = "usb";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				/* USB2 Port 0 */
>> +				usb20: port@0 {
>> +					reg = <0>;
>> +					phys = <&usb2_phy0>;
> 
> 'ports' and 'port' are reserved for the graph binding. Don't use it for 
> your own thing.
> 
> Can't you just make 'phys' a list using 0 phandle if you need to skip 
> entries.

Yep, finally this would be simpler.

> 
>> +				};
>> +
>> +				/* USB2 Port 1 */
>> +				usb21: port@1 {
>> +					reg = <1>;
>> +					phys = <&usb2_phy1>;
>> +				};
>> +
>> +				/* USB3 Port 0 */
>> +				usb3: port@4 {
>> +					reg = <4>;
>> +					phys = <&usb3_pcie_phy PHY_TYPE_USB3>;
>> +				};
>> +			};
>> +
>> +			dwc2: usb@ff400000 {
>> +				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
>> +				reg = <0x0 0xff400000 0x0 0x40000>;
>> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
>> +				clock-names = "ddr";
>> +				dr_mode = "peripheral";
>> +				g-rx-fifo-size = <192>;
>> +				g-np-tx-fifo-size = <128>;
>> +				g-tx-fifo-size = <128 128 16 16 16>;
>> +			};
>> +
>> +			dwc3: dwc3@ff500000 {
> 
> usb@... or usb3@...

Ok

> 
>> +				compatible = "snps,dwc3";
>> +				reg = <0x0 0xff500000 0x0 0x100000>;
>> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +				dr_mode = "host";
>> +				snps,dis_u2_susphy_quirk;
>> +				snps,quirk-frame-length-adjustment;
>> +			};
>> +	};
>> -- 
>> 2.20.1
>>
