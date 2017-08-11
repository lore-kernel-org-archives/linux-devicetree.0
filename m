From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2 02/18] dt-bindings: arm: add support for ARM System
 Control and Management Interface(SCMI) protocol
Date: Fri, 11 Aug 2017 10:36:13 +0100
Message-ID: <f41b7ae8-affe-e782-7a4b-bbb3a5146247@arm.com>
References: <1501857104-11279-1-git-send-email-sudeep.holla@arm.com>
 <1501857104-11279-3-git-send-email-sudeep.holla@arm.com>
 <20170810192838.prslgnjvxv3xvyes@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170810192838.prslgnjvxv3xvyes@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, ALKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>, Loc Ho <lho@apm.com>, Alexey Klimov <alexey.klimov@arm.com>, Ryan Harkin <Ryan.Harkin@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org



On 10/08/17 20:28, Rob Herring wrote:
> On Fri, Aug 04, 2017 at 03:31:28PM +0100, Sudeep Holla wrote:
>> This patch adds devicetree binding for System Control and Management
>> Interface (SCMI) Message Protocol used between the Application Cores(AP)
>> and the System Control Processor(SCP). The MHU peripheral provides a
>> mechanism for inter-processor communication between SCP's M3 processor
>> and AP.
>>
>> SCP offers control and management of the core/cluster power states,
>> various power domain DVFS including the core/cluster, certain system
>> clocks configuration, thermal sensors and many others.
>>
>> SCMI protocol is developed as better replacement to the existing SCPI
>> which is not flexible and easily extensible.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>  Documentation/devicetree/bindings/arm/arm,scmi.txt | 174 +++++++++++++++++++++
>>  1 file changed, 174 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/arm,scmi.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
>> new file mode 100644
>> index 000000000000..33c16be58e72
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
>> @@ -0,0 +1,174 @@
>> +System Control and Management Interface (SCMI) Message Protocol
>> +----------------------------------------------------------
>> +
>> +The SCMI is intended to allow agents such as OSPM to manage various functions
>> +that are provided by the hardware platform it is running on, including power
>> +and performance functions.
>> +
>> +This binding is intended to define the interface the firmware implementing
>> +the SCMI as described in ARM document number ARM DUI 0922B ("ARM System Control
>> +and Management Interface Platform Design Document")[0] provide for OSPM in
>> +the device tree.
>> +
>> +Required properties:
> 
> Please define this is a subnode of /firmware node.
> 

Thanks for pointing that out, I wasn't aware of that.

Ideally, should we move PSCI and SCPI also under that ?

Also should we contain all firmware bindings under
Documentation/devicetree/bindings/arm/firmware/ ?

[..]

>> +PM domain consumers
>> +===================
> 
> How consumers work is already defined elsewhere.
> 

Agreed, will drop it.

[..]

>> +
>> +scmi_protocol: scmi@2e000000 {
> 
> The unit address is not valid.
> 

Ah, copy paste, will drop. Need to fix in scpi bindings too.

>> +	compatible = "arm,scmi";
>> +	method = "mailbox-doorbell";
> 
> Is this not implied by the mboxes property? 
> 

Indeed, remnants from v1. I removed in the definition but left in the
example.

-- 
Regards,
Sudeep
