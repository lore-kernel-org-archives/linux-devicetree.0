From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: al-pos: Amazon's Annapurna Labs
 POS
Date: Wed, 18 Sep 2019 16:44:11 +0300
Message-ID: <6965161b-a51c-9e16-f6b8-6f33b40708ee@amazon.com>
References: <1568142310-17622-1-git-send-email-talel@amazon.com>
 <1568142310-17622-2-git-send-email-talel@amazon.com>
 <20190918133248.GA16653@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918133248.GA16653@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Tnx Rob for the review.

Shall be part of v3.

Waiting for responses from Arnd and James and will publish v3.

On 9/18/2019 4:35 PM, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 10:05:08PM +0300, Talel Shenhar wrote:
>> Document Amazon's Annapurna Labs POS SoC binding.
>>
>> Signed-off-by: Talel Shenhar <talel@amazon.com>
>> ---
>>   .../devicetree/bindings/soc/amazon/amazon,al-pos.txt   | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
> Please convert to DT schema.
>
>> diff --git a/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
>> new file mode 100644
>> index 00000000..035cc571
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/amazon/amazon,al-pos.txt
>> @@ -0,0 +1,18 @@
>> +Amazon's Annapurna Labs POS
>> +
>> +POS node is defined to describe the Point Of Serialization (POS) logger
>> +unit.
>> +
>> +Required properties:
>> +- compatible:	Shall be "amazon,al-pos".
>> +- reg:		POS logger resources.
>> +- interrupts:	should contain the interrupt for pos error event.
>> +
>> +Example:
>> +
>> +al_pos {
> Needs a unit-address.
>
>> +	compatible = "amazon,al-pos";
>> +	reg = <0x0 0xf0070084 0x0 0x00000008>;
>> +	interrupt-parent = <&amazon_system_fabric>;
>> +	interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
>> +};
>> -- 
>> 2.7.4
>>
