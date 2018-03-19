From: Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Update documentation for
 Qualcomm DWC3 driver
Date: Mon, 19 Mar 2018 09:50:10 +0530
Message-ID: <835029bb-08a9-16dc-e107-870615f57124@codeaurora.org>
References: <1520937362-28777-1-git-send-email-mgautam@codeaurora.org>
 <20180318124922.kxa5q2vmhvydfp25@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180318124922.kxa5q2vmhvydfp25@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,


On 3/18/2018 6:19 PM, Rob Herring wrote:
> On Tue, Mar 13, 2018 at 04:06:00PM +0530, Manu Gautam wrote:
>> Existing documentation has lot of incorrect information as it
>> was originally added for a driver that no longer exists.
>>
>> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
>> ---
>>  .../devicetree/bindings/usb/qcom,dwc3.txt          | 87 +++++++++++++++-------
>>  1 file changed, 59 insertions(+), 28 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>> index bc8a2fa..df312f7 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
>> @@ -1,54 +1,85 @@
>>  Qualcomm SuperSpeed DWC3 USB SoC controller
>>  
>>  Required properties:
>> -- compatible:	should contain "qcom,dwc3"
>> -- clocks:		A list of phandle + clock-specifier pairs for the
>> -				clocks listed in clock-names
>> -- clock-names:	Should contain the following:
>> -  "core"		Master/Core clock, have to be >= 125 MHz for SS
>> -				operation and >= 60MHz for HS operation
>> -
>> -Optional clocks:
>> -  "iface"		System bus AXI clock.  Not present on all platforms
>> -  "sleep"		Sleep clock, used when USB3 core goes into low
>> -				power mode (U3).
>> +- compatible:		should contain "qcom,dwc3"
>> +- reg:			offset and length of register set for QSCRATCH wrapper
>> +- reg-names:		should be "qscratch"
> reg-names is pointless for a single range.
Ok. Will change this.

>
>> +- power-domains:	specifies a phandle to PM domain provider node
>> +- clocks:		list of phandle + clock-specifier pairs
> How many clocks and what are they?
I will add description of the clocks in next version of patchset.


>
>> +- assigned-clocks:	should be:
>> +				MOCK_UTMI_CLK
>> +				MASTER_CLK
>> +- assigned-clock-rates: should be:
>> +                                19.2Mhz (192000000) for MOCK_UTMI_CLK
>> +                                >=125Mhz (125000000) for MASTER_CLK in SS mode
>> +                                >=60Mhz (60000000) for MASTER_CLK in HS mode
>> +
>> +Optional properties:
>> +- resets:		list of phandle and reset specifier pairs
>> +- interrupts:		specifies interrupts from controller wrapper used
>> +			to wakeup from low power/susepnd state.	Must contain
>> +			one or more entry for interrupt-names property
>> +- interrupt-names:	Must include the following entries:
>> +			- "hs_phy_irq": The interrupt that is asserted when a
>> +			   wakeup event is received on USB2 bus
>> +			- "ss_phy_irq": The interrupt that is asserted when a
>> +			   wakeup event is received on USB3 bus
>> +			- "dm_hs_phy_irq" and "dp_hs_phy_irq": Separate
>> +			   interrupts for any wakeup event on DM and DP lines
>> +- qcom,select-utmi-as-pipe-clk: if present, disable USB3 pipe_clk requirement.
>> +				Used when dwc3 operates without SSPHY and only
>> +				HS/FS/LS modes are supported.
>>  
>>  Required child node:
>>  A child node must exist to represent the core DWC3 IP block. The name of
>>  the node is not important. The content of the node is defined in dwc3.txt.
>>  
>>  Phy documentation is provided in the following places:
>> -Documentation/devicetree/bindings/phy/qcom-dwc3-usb-phy.txt
>> +Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt   - USB3 QMP PHY
>> +Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt - USB2 QUSB2 PHY

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
