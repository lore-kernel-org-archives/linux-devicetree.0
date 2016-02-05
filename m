From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 SPI
 peripheral
Date: Fri, 5 Feb 2016 10:38:28 +0530
Message-ID: <56B42E4C.8040201@microchip.com>
References: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
 <56B08EEB.3050808@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B08EEB.3050808-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/02/2016 04:41 PM, Sergei Shtylyov wrote:

> Hello.
> On 2/2/2016 1:44 AM, Joshua Henderson wrote:
>> From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Document the devicetree bindings for the SPI peripheral found
>> on Microchip PIC32 class devices.
>> Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>   .../bindings/spi/microchip,spi-pic32.txt           |   44 ++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>> diff --git a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>> new file mode 100644
>> index 0000000..a555618
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>> @@ -0,0 +1,44 @@
>> +* Microchip PIC32 SPI device
>> +
>> +Required properties:
>> +- compatible: Should be "microchip,pic32mzda-spi".
>> +- reg: Address and length of the register set for the device
>> +- interrupts: Should contain all three spi interrupts in sequence
>> +              of <fault-irq>, <receive-irq>, <transmit-irq>.
>> +- interrupt-names: Should be "fault","rx","tx" in order.
>>
> Please insert spaces after commas.

ack.

>> +- clocks: phandles of baud generation clocks. Maximum two possible clocks
>>
> Baud in the SPI context?

Yes, clock for generating spi clock (SCK). Will update the comment.

>> +      can be provided (&PBCLK2, &REFCLKO1).
>>
> Please align.

ack.

>> +          See: Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +- clock-names: Should be "mck0","mck1".
>>
> Please insert space after comma.

ack.

> [...]
>> +Example:
>> +
>> +    spi1:spi@0x1f821000 {
> Please insert spaces after colon.

ack

> [...]
> MBR, Sergei
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
