Return-Path: <SRS0=hvZ9=WK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46432 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbfHNTyy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2019 15:54:54 -0400
Subject: Re: [PATCH v4 1/2] dt-bindings: Add docs for EL15203000
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <ea3d06b2-3689-bcfc-8f5f-6345634cfa2b@ti.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d75d5fea-0a7c-b057-d972-c7747df7f33b@gmail.com>
Date: Wed, 14 Aug 2019 21:54:48 +0200
MIME-Version: 1.0
In-Reply-To: <ea3d06b2-3689-bcfc-8f5f-6345634cfa2b@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Dan,

On 8/13/19 10:31 PM, Dan Murphy wrote:
> Jacek
> 
> Need your input below
> 
> On 8/8/19 3:32 PM, Oleh Kravchenko wrote:
>> Add documentation and example for dt-bindings EL15203000.
>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>
>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>> ---
>>   .../bindings/leds/leds-el15203000.txt         | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> new file mode 100644
>> index 000000000000..4c2245babfdc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>> @@ -0,0 +1,47 @@
>> +Crane Merchandising System - el15203000 LED driver
>> +--------------------------------------------------
>> +
>> +This LED Board (aka RED LEDs board) is widely used in
>> +coffee vending machines produced by Crane Merchandising Systems.
>> +
>> +Required properties:
>> +- compatible : "crane,el15203000"
>> +- reg :
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +- spi-max-frequency : (optional)
>> +    see Documentation/devicetree/bindings/spi/spi-bus.txt
>> +
>> +Optional LED sub-node properties:
>> +- label :
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +- linux,default-trigger :
>> +    see Documentation/devicetree/bindings/leds/common.txt
>> +
>> +Example
>> +-------
>> +
>> +led-controller@0 {
>> +    compatible = "crane,el15203000";
>> +    reg = <0>;
>> +    spi-max-frequency = <50000>;
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    /* water pipe */
>> +    pipe@50 {
>> +        reg = <0x50>;
>> +        label = "red:pipe";
> 
> Should we use the color and function property here?

Yes, label is already deprecated in the common LED bindings
in linux-next. We need separate color and function here.

> Not sure what function would be for pipe, screen or vending but there
> may be
> 
> comparable functions that may fit.

These are functions specific to this board and it is not something
that could have some vast system-wide use. Common LED functions aim
rather to unify the naming for LEDs on standard system devices and
peripherals.

I'd not strive for creating common LED_FUNCTION macros for these.

-- 
Best regards,
Jacek Anaszewski
