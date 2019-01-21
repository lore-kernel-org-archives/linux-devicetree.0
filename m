From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/3] dt-bindings: phy: ti: Add dt binding documentation
 for SERDES in AM654x SoC
Date: Mon, 21 Jan 2019 17:19:27 +0530
Message-ID: <7980b15c-0187-32e1-c728-d3d98e4c8c0e@ti.com>
References: <20190121064813.18444-1-kishon@ti.com>
 <20190121064813.18444-3-kishon@ti.com> <5C4596F8.7030009@ti.com>
 <b619ace8-f2be-8eb0-080e-0ae7a43799df@ti.com> <5C45AB63.4010005@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5C45AB63.4010005@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 21/01/19 4:52 PM, Roger Quadros wrote:
> 
> 
> On 21/01/19 12:47, Kishon Vijay Abraham I wrote:
>> Hi Roger,
>>
>> On 21/01/19 3:25 PM, Roger Quadros wrote:
>>> Kishon,
>>>
>>> On 21/01/19 08:48, Kishon Vijay Abraham I wrote:
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
>>> Can we have a way to change default lane at probe time without having any user dependencies.
>>>
>>> e.g. To work in USB2.0 mode I don't want SERDES0 to be in lane 0 (which is SoC default).
>>> But at the same time the application might not be using PCIe or SGMII, so there is no
>>> PHY user to change the lane to 1 or 2.
>>>
>>> A DT property to allow selection of a default lane at probe time would help
>> Ideally we should be disabling the module that is not used ("status" property
>> of SERDES0 dt would be "disabled"). So there is no guarantee SERDES will be probed.
>>
> 
> OK. Is there something that can be done at the serdes_mux?
> As per bindings/mux/mmio-mux.txt
> 
> Optional properties:
> - idle-states : if present, the state the muxes will have when idle. The
>                 special state MUX_IDLE_AS_IS is the default.
> 
> Could that be used?

Looks like that's something we could use.

Thanks
Kishon
