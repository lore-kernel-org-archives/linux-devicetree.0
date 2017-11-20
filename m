From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: fsi: Add OCC documentation
Date: Mon, 20 Nov 2017 16:03:33 -0600
Message-ID: <647df116-c434-ae4e-8a16-54145f57ab5c@linux.vnet.ibm.com>
References: <1511207217-14075-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1511207217-14075-6-git-send-email-eajames@linux.vnet.ibm.com>
 <20171120213913.6j7qgcgobc2ocqey@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171120213913.6j7qgcgobc2ocqey@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, mark.rutland@arm.com, bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com, joel@jms.id.au, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org



On 11/20/2017 03:39 PM, Rob Herring wrote:
> On Mon, Nov 20, 2017 at 01:46:54PM -0600, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Document the bindings for the P9 OCC device. OCC devices are accessed
>> through the SBEFIFO.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>>
>> diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> new file mode 100644
>> index 0000000..79094f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
>> @@ -0,0 +1,18 @@
>> +Device-tree bindings for P9 On-Chip Controller
>> +----------------------------------------------
>> +
>> +The POWER9 On-Chip Controller is accessed through the SBEFIFO. All OCC nodes
>> +must be child nodes of SBEFIFO devices (see ibm,p9-sbefifo.txt).
>> +
>> +Required properties:
>> + - compatible = "ibm,p9-occ";
>> +
>> +Optional properties:
>> + - reg = <processor index>;	: Index for the processor this OCC is on.
> reg should be how the parent (SBEFIFO) addresses this device. Would all
> of these child devices be a unique processor?

Yes. The "processor" here is indicating which P9 processor in the 
system, not whatever processor(s) this kernel is running on. We use this 
device tree on the service processor, which can be talking to multiple 
P9 chips (over SBEFIFO). This could probably be clarified by saying "P9 
chip" or something.

>
> I think a phandle to the cpu node would be more appropriate here.

No phandle available; see above, the processor being referenced is a 
separate entity in the system.

Thanks for the quick feedback.
Eddie

>
>> +
>> +Examples:
>> +
>> +    occ@1 {
>> +        compatible = "ibm,p9-occ";
>> +        reg = <1>;
>> +    };
>> -- 
>> 1.8.3.1
>>
