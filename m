From: Amelie DELAUNAY <amelie.delaunay@st.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add support for STM32 USB PHY
 Controller (USBPHYC)
Date: Fri, 2 Mar 2018 14:42:36 +0000
Message-ID: <6a11cbdc-a7db-31c5-740c-06857f051e38@st.com>
References: <1519918245-17333-1-git-send-email-amelie.delaunay@st.com>
 <1519918245-17333-2-git-send-email-amelie.delaunay@st.com>
 <bac8ba1a-dd66-4df6-1976-c6144e35040c@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bac8ba1a-dd66-4df6-1976-c6144e35040c@ti.com>
Content-Language: en-US
Content-ID: <84EA306B2A90664CBD82979F5E7B325A@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 03/02/2018 07:02 AM, Kishon Vijay Abraham I wrote:
> 
> 
> On Thursday 01 March 2018 09:00 PM, Amelie Delaunay wrote:
>> This patch adds the device tree bindings description for STM32 USBPHYC
>> (USB PHY Controller).
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   .../devicetree/bindings/phy/phy-stm32-usbphyc.txt  | 46 ++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
>> new file mode 100644
>> index 0000000..1ad3893
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
>> @@ -0,0 +1,46 @@
>> +STMicroelectronics STM32 USB HS PHY controller
>> +
>> +The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
>> +switch. It controls PHY configuration and status, and the UTMI+ switch that
>> +selects either OTG or HOST controller for the second PHY port. It also sets
>> +PLL configuration.
>> +
>> +USBPHYC
>> +      |_ PLL
>> +      |
>> +      |_ PHY port#1 _________________ HOST controller
>> +      |                    _                 |
>> +      |                  / 1|________________|
>> +      |_ PHY port#2 ----|   |________________
>> +      |                  \_0|                |
>> +      |_ UTMI switch_______|          OTG controller
>> +
>> +
> 
> This should be modeled as a phy provider node with two separate sub-nodes for
> each of the PHYs.
> 
> Thanks
> Kishon
> 

Thank you for pointing me to the right solution. I send a V3.

Regards,
Amelie

>> +Required properties:
>> +- compatible: must be "st,stm32mp1-usbphyc"
>> +- reg: address and length of the usb phy control register set
>> +- clocks: phandle + clock specifier for the PLL phy clock
>> +- phy-supply: from the generic phy bindings, phandle to the regulator
>> +  providing 3V3 power to the PHY, see phy-bindings.txt
>> +- vdda1v1-supply: phandle to the regulator providing 1V1 power to the PHY
>> +- vdda1v8-supply: phandle to the regulator providing 1V8 power to the PHY
>> +
>> +Optional properties:
>> +- assigned-clocks: phandle + clock specifier for the PLL phy clock
>> +- assigned-clock-parents: the PLL phy clock parent
>> +- resets: phandle + reset specifier
>> +- st,utmi-switch: should be <0> or <1>, to select USB controller for PHY
>> +  port#2. If not specified, 0 is the default selection.
>> +
>> +
>> +Example:
>> +		usbphyc: usb-phy@5a006000 {
>> +			compatible = "st,stm32mp1-usbphyc";
>> +			reg = <0x5a006000 0x1000>;
>> +			clocks = <&rcc_clk USBPHY_K>;
>> +			resets = <&rcc_rst USBPHY_R>;
>> +			st,utmi-switch = <1>;
>> +			phy-supply = <&vdd_usb>;
>> +			vdda1v1-supply = <&reg11>;
>> +			vdda1v8-supply = <&reg18>
>> +		};
>>
