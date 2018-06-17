Return-Path: <SRS0=fTn5=JD=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: leds: Add bindings for lltc,lt3593
References: <20180617114929.719-1-daniel@zonque.org>
 <468ab3aa-80cd-3525-3c89-7e5c4e7e8b9e@gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <ca6a8440-0dd2-1690-05a9-735e1381020a@zonque.org>
Date: Sun, 17 Jun 2018 21:52:57 +0200
MIME-Version: 1.0
In-Reply-To: <468ab3aa-80cd-3525-3c89-7e5c4e7e8b9e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jacek,

Thanks for the prompt reply!

On Sunday, June 17, 2018 09:39 PM, Jacek Anaszewski wrote:
> On 06/17/2018 01:49 PM, Daniel Mack wrote:
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>    .../devicetree/bindings/leds/leds-lt3593.txt  | 25 +++++++++++++++++++
>>    1 file changed, 25 insertions(+)
>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-lt3593.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lt3593.txt b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
>> new file mode 100644
>> index 000000000000..0a7035acda8f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lt3593.txt
>> @@ -0,0 +1,25 @@
>> +Bindings for Linear Technologies LT3593 LED controller
>> +
>> +Required properties:
>> +- compatible : should be "lltc,lt3593".
>> +- label: A label for the LED.
>> +
>> +Optional properties:
>> +- linux,default-trigger :  (optional)
>> +  see Documentation/devicetree/bindings/leds/common.txt
>> +- default-state:  (optional) The initial state of the LED.
>> +  see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +The controller only suports one LED, hence the properties are all set
>> +in the root node of the device. If multiple chips of this kind are
>> +found in a design, each one needs to be handled by its own device node.
> 
> Please do not make an excuse for a single LED. Let's keep the bindings
> consistent across all LED class drivers, i.e. each LED should have
> a dedicated child node. Even there is a single output available.

Okay, I can do that. But you do agree with the decision to only support 
one single LED in the driver and the binding? The hardware chip can only 
drive one single LED, but of course, the driver could support multiple 
chips with a single device node and different sub-nodes. In fact the 
driver did support this via pdata before this series.

I believe, however, that this is against the principles of how 
device-trees are supposed to describe the hardware, so I changed it. And 
as I wrote in the commit log, the only mainline user only uses one LED 
anyway, so the change won't cause any regression.


Thanks,
Daniel
