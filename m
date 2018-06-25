Return-Path: <SRS0=JYUX=JL=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
References: <20180621202322.11581-1-daniel@zonque.org>
 <20180621202322.11581-2-daniel@zonque.org>
 <20180625155912.GA28653@rob-hp-laptop>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <822f3b48-e322-bba3-f4ca-b9caf0722573@zonque.org>
Date: Mon, 25 Jun 2018 22:21:02 +0200
MIME-Version: 1.0
In-Reply-To: <20180625155912.GA28653@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the review!

On 06/25/2018 05:59 PM, Rob Herring wrote:
> On Thu, Jun 21, 2018 at 10:23:18PM +0200, Daniel Mack wrote:
>> This patch add the bindings document for LT3593 LED drivers.
>> The binding is kept consistent with other LED driver bindings in that it
>> stores all the LED-specific properties in its own subnode. As the hardware
>> only supports one channel, there can consequently only be one sub-node.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>  .../devicetree/bindings/leds/leds-lt3593.txt  | 34 +++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
>> new file mode 100644
>> index 000000000000..b31d427448f8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
>> @@ -0,0 +1,34 @@
>> +Bindings for Linear Technologies LT3593 LED controller
>> +
>> +Required properties:
>> +- compatible:	Should be "lltc,lt3593".
>> +
>> +The hardware supports only one LED. The properties of this LED are
>> +configured in a sub-node in the device node.
>> +
>> +Required sub-node properties:
>> +- gpios:	A handle to the GPIO that is connected to the 'CTRL'
>> +		pin of the chip.
> 
> lltc,ctrl-gpios
> 
> Or "shutdown-gpios" as that is a standard name and seems to be its 
> function.

No, it's a control pin that receives multiple pulses to set the LED
current (and by that, its brightness).

> This also belongs in the parent node because it is a GPIO connection to 
> the controller, not the LEDs.

Okay, not a problem. I'll change that and send a patch.


Thanks!
Daniel
