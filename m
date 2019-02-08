From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: ti: Add dt binding documentation
 for SERDES in AM654x SoC
Date: Fri, 8 Feb 2019 10:35:44 +0530
Message-ID: <2669692f-a57e-9c0a-a0ac-bb6c0497f5ba@ti.com>
References: <20190206110753.28738-1-kishon@ti.com>
 <20190206110753.28738-4-kishon@ti.com> <5C5C15E4.8010601@ti.com>
 <1eb6eee3-da8a-7400-c419-a60929b78904@ti.com> <5C5C3F3D.7080809@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C5C3F3D.7080809@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Roger,

On 07/02/19 7:52 PM, Roger Quadros wrote:
> 
> 
> On 07/02/19 14:19, Kishon Vijay Abraham I wrote:
>> Hi Roger,
>>
>> On 07/02/19 4:56 PM, Roger Quadros wrote:
>>>
>>>
>>> On 06/02/19 13:07, Kishon Vijay Abraham I wrote:
>>>> AM654x has two SERDES instances. Each instance has three input clocks
>>>> (left input, externel reference clock and right input) and two output
>>>> clocks (left output and right output) in addition to a PLL mux clock
>>>> which the SERDES uses for Clock Multiplier Unit (CMU refclock).
>>>> The PLL mux clock can select from one of the three input clocks.
>>>> The right output can select between left input and external reference
>>>> clock while the left output can select between the right input and
>>>> external reference clock.
>>>>
>>>> The left and right input reference clock of SERDES0 and SERDES1
>>>> respectively are connected to the SoC clock. In the case of two lane
>>>> SERDES personality card, the left input of SERDES1 is connected to
>>>> the right output of SERDES0 in a chained fashion.
>>>>
>>>> See section "Reference Clock Distribution" of AM65x Sitara Processors
>>>> TRM (SPRUID7 – April 2018) for more details.
>>>>
>>>> Add dt-binding documentation in order to represent all these different
>>>> configurations in device tree.
>>>>
>>>> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
>>>> ---
>>>>  .../devicetree/bindings/phy/ti-phy.txt        | 77 +++++++++++++++++++
>>>>  include/dt-bindings/phy/phy-am654-serdes.h    | 13 ++++
>>>>  2 files changed, 90 insertions(+)
>>>>  create mode 100644 include/dt-bindings/phy/phy-am654-serdes.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/ti-phy.txt b/Documentation/devicetree/bindings/phy/ti-phy.txt
>>>> index 57dfda8a7a1d..fc2fff6b2c37 100644
>>>> --- a/Documentation/devicetree/bindings/phy/ti-phy.txt
>>>> +++ b/Documentation/devicetree/bindings/phy/ti-phy.txt
>>>> @@ -132,3 +132,80 @@ sata_phy: phy@4a096000 {
>>>>  	syscon-pllreset = <&scm_conf 0x3fc>;
>>>>  	#phy-cells = <0>;
>>>>  };
>>>> +
>>>> +
>>>> +TI AM654 SERDES
>>>> +
>>>> +Required properties:
>>>> + - compatible: Should be "ti,phy-am654-serdes"
>>>> + - reg : Address and length of the register set for the device.
>>>> + - reg-names: Should be "serdes" which corresponds to the register space
>>>> +	populated in "reg".
>>>> + - #phy-cells: determine the number of cells that should be given in the
>>>> +	phandle while referencing this phy. Should be "2". The 1st cell
>>>> +	corresponds to the phy type (should be one of the types specified in
>>>> +	include/dt-bindings/phy/phy.h) and the 2nd cell should be the serdes
>>>> +	lane function.
>>>> +	If SERDES0 is referenced 2nd cell should be:
>>>> +		0 - USB3
>>>> +		1 - PCIe0 Lane0
>>>> +		2 - ICSS2 SGMII Lane0
>>>> +	If SERDES1 is referenced 2nd cell should be:
>>>> +		0 - PCIe1 Lane0
>>>> +		1 - PCIe0 Lane1
>>>> +		2 - ICSS2 SGMII Lane1
>>>
>>> Instead of these magic numbers and expecting a human to decipher this
>>> which is prone to error, is it better to create the following defines and
>>> check for valid configuration in the driver?
>>>
>>> AM654_SERDES_LANE_USB3,
>>> AM654_SERDES_LANE_PCIE_LANE0,
>>> AM654_SERDES_LANE_PCIE_LANE1,
>>> AM654_SERDES_LANE_SGMII,
>>>
>>> So if you pass AM654_SERDES_LANE_PCIE_LANE0 to SERDES1, driver can easily
>>> figure out that it should be 1 if it is serdes0 and 0 if serdes1
>>>
>>> Which means the DT must contain something so that you can identify
>>> if it is serdes0 or serdes1.
>>
>> Generally I'd like to avoid drivers having to know instance numbers. That gets
>> more complicated to handle when the same IP is used in different platforms.
> 
> But this PHY driver is for AM654 platform. Are you saying that variants of this
> platform have different lane configurations?

It can have different lane configurations (we've already seen that in dra72).
Nothing prevents from having the same SERDES IP in a future platform with
different lane configuration.

This is more of a system configuration which might get complicated if we try to
check all the valid configurations in driver.


> 
> You have already specified of the possibilities that can be in 2nd cell in
> the binding document.
> 
> Is it better to create a directory ti/ and put this binding in ti,phy-am654-serdes.txt
> instead of the already so large ti,phy.txt?

sure.

Thanks
Kishon
