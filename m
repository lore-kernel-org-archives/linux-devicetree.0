From: Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Document the POWER system power
 supply device
Date: Mon, 21 Aug 2017 13:35:18 -0500
Message-ID: <81d68d38-af6d-be62-ad54-928b20b29d63@linux.vnet.ibm.com>
References: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502403586-20549-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20170817151116.4vc4jlna4gc7xzb2@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-hwmon-owner@vger.kernel.org>
In-Reply-To: <20170817151116.4vc4jlna4gc7xzb2@rob-hp-laptop>
Content-Language: en-US
Sender: linux-hwmon-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, jdelvare@suse.com, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au, mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
List-Id: devicetree@vger.kernel.org



On 08/17/2017 10:11 AM, Rob Herring wrote:
> On Thu, Aug 10, 2017 at 05:19:44PM -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   .../devicetree/bindings/i2c/ibm,power-ps.txt        | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>> new file mode 100644
>> index 0000000..2ea8ea2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>> @@ -0,0 +1,21 @@
>> +Device-tree bindings for IBM POWER system power supplies
>> +--------------------------------------------------------
>> +
>> +Required properties:
>> + - compatible = "ibm,power-ps";
>> + - reg = < I2C bus address >;		: Address of the power supply on the
>> +					  I2C bus.
>> +
>> +Example:
>> +
>> +    i2c-bus@100 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        #interrupt-cells = <1>;
>> +        < more properties >
>> +
>> +        power_ps@68 {
> Don't use '_' in node names. Should be a generic name too if possible.
> Perhaps "power-supply".

Yes, the latest patch set switched this to power-supply. The driver name 
changed in v3, sorry for the confusion.

Thanks,
Eddie

>
>> +            compatible = "ibm,power-ps";
>> +            reg = <0x68>;
>> +        };
>> +    };
>> -- 
>> 1.8.3.1
>>

