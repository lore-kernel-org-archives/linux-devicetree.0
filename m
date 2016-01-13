From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/2] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Wed, 13 Jan 2016 17:29:46 +0530
Message-ID: <56963C32.8070909@ti.com>
References: <1452676943-18931-1-git-send-email-sbhatta@xilinx.com>
 <5696304A.8090508@ti.com>
 <F1B223389110CE49B4CF055ABA2E5D3D78CDD5DB@XAP-PVEXMBX02.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F1B223389110CE49B4CF055ABA2E5D3D78CDD5DB@XAP-PVEXMBX02.xlnx.xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>, "robh@kernel.org" <robh@kernel.org>
Cc: "balbi@ti.com" <balbi@ti.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On Wednesday 13 January 2016 05:19 PM, Subbaraya Sundeep Bhatta wrote:
> Hi Kishon,
> 
>> -----Original Message-----
>> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
>> Sent: Wednesday, January 13, 2016 4:39 PM
>> To: Subbaraya Sundeep Bhatta; robh@kernel.org
>> Cc: balbi@ti.com; gregkh@linuxfoundation.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; Subbaraya Sundeep Bhatta
>> Subject: Re: [PATCH 1/2] phy: zynqmp: Add dt bindings for ZynqMP PHY.
>>
>> Hi,
>>
>> On Wednesday 13 January 2016 02:52 PM, Subbaraya Sundeep Bhatta wrote:
>>> This patch adds the document describing dt bindings for ZynqMP PHY.
>>> ZynqMP SOC has a High Speed Processing System Gigabit Transceiver
>>> which provides PHY capabilties to USB, SATA, PCIE, Display Port and
>>> Ehernet SGMII controllers.
>>>
>>> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
>>> ---
>>>  .../devicetree/bindings/phy/phy-zynqmp.txt         | 104
>> +++++++++++++++++++++
>>>  1 file changed, 104 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/phy/phy-zynqmp.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
>>> b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
>>> new file mode 100644
>>> index 0000000..ec0d3de
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
>>> @@ -0,0 +1,104 @@
>>> +Xilinx ZynqMP PHY binding
>>> +
>>> +This binding describes a ZynqMP PHY device that is used to control
>>> +ZynqMP High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides
>>> +four lanes and are used by USB, SATA, PCIE, Display port and Ethernet
>> SGMMI controllers.
>>> +
>>> +Required properties (controller (parent) node):
>>> +- compatible    : Should be "xlnx,zynqmp-psgtr"
>>> +
>>> +- reg		: Address and length of register sets for each device in
>>> +		  "reg-names"
>>> +- reg-names     : The names of the register addresses corresponding to the
>>> +		  registers filled in "reg":
>>> +			- serdes: SERDES block register set
>>> +			- siou: SIOU block register set
>>> +			- lpd: Low power domain peripherals reset control
>>> +			- fpd: Full power domain peripherals reset control
>>> +
>>> +-xlnx,tx_termination_fix: Include fix for a functional issue in the GT. The TX
>>> +			  termination resistance can be out of spec due to a
>>> +			  bug in the calibration logic. This issue will be fixed
>>> +			  in silicon in future versions.
>>> +
>>> +Required nodes	:  A sub-node is required for each lane the controller
>>> +		   provides. These nodes are translated by the driver's
>>> +		   .xlate() function.
>>
>> driver details need not be in the binding documentation.
> 
> Ok will remove this.
>>> +
>>> +Required properties (port (child) nodes):
>>> +lane0:
>>> +- #phy-cells	: Should be 1
>>> +		  Cell after port phandle is device type from:
>>> +			- XPSGTR_TYPE_PCIE_0
>>> +			- XPSGTR_TYPE_SATA_0
>>> +			- XPSGTR_TYPE_USB0
>>> +			- XPSGTR_TYPE_DP_1
>>> +			- XPSGTR_TYPE_SGMII0
>>
>> Why not use the already existing PHY TYPES?
>> phy-cells can be made as '2' and the last cell can be used as index if that's
>> required.
> 
> PCIE_0 means lane 0 of PCIe controller and USB0 is USB 0 controller
> (there are two USB controllers). To differentiate I named like above.
> phy-cells with 2 sounds good. Shall I add PHY_TYPE_SGMII to
> include/dt-bindings/phy/phy.h and remove the phy-zynqmp.h ?

yes, so that it can be used by others too.

Thanks
Kishon
