From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/3] dt: xilinx: zynqmp: Add bindings for PM firmware
Date: Fri, 11 Aug 2017 14:58:03 +0200
Message-ID: <4e5d9f8c-9e87-bdcd-388a-aab3c32415e8@xilinx.com>
References: <cover.1501854302.git.michal.simek@xilinx.com>
 <8c27b7eec6cc00d37dfe9b3998212ce9c9c27a31.1501854302.git.michal.simek@xilinx.com>
 <20170810191056.ur5b3zdrcgmb6sim@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170810191056.ur5b3zdrcgmb6sim@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Soren Brinkmann <soren.brinkmann@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Rob, +Edgar,

On 10.8.2017 21:10, Rob Herring wrote:
> On Fri, Aug 04, 2017 at 03:45:30PM +0200, Michal Simek wrote:
>> From: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>
>> Document the DT bindings for the Zynq UltraScale+ PM Firmware.
>>
>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> ---
>>
>>  .../devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt | 19 +++++++++++++++++++
> 
> bindings/firmware/

will move.

> 
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
>> new file mode 100644
>> index 000000000000..222a18ce07fc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
>> @@ -0,0 +1,19 @@
>> +Xilinx Zynq MPSoC Firmware Device Tree Bindings
>> +
>> +The zynqmp-pm node describes the interface to platform firmware.
> 
> Please define this should be under /firmware node.
> 
>> +Required properties:
>> + - compatible:	Must contain:  "xlnx,zynqmp-pm"
>> + - method:	The method of calling the PM-API firmware layer.
>> +		Permitted values are:
>> +		 - "smc" : To be used in configurations without a hypervisor
>> +		 - "hvc" : To be used when hypervisor is present
> 
> Do you really use both?
> 

SMCs definitely yes.

Interface was designed in that way and I don't know if people are using
it or not.

Not sure if Xen is blocking SMCs. I know we have discussed it but not
sure if this is enabled by default or only for certain configurations.
Also not sure if xen contains handler for hvc.
Edgar: Do you know?

Thanks,
Michal
