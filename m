From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for the PIC32 SPI
 peripheral
Date: Mon, 8 Feb 2016 10:36:05 +0530
Message-ID: <56B8223D.2030705@microchip.com>
References: <1454366701-10847-1-git-send-email-joshua.henderson@microchip.com>
 <56B08EEB.3050808@cogentembedded.com> <56B42E4C.8040201@microchip.com>
 <56B4A457.7050807@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B4A457.7050807-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/05/2016 07:02 PM, Sergei Shtylyov wrote:

> Hello.
> On 2/5/2016 8:08 AM, Purna Chandra Mandal wrote:
>>>> From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>> Document the devicetree bindings for the SPI peripheral found
>>>> on Microchip PIC32 class devices.
>>>> Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>> Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>>>> ---
>>>>    .../bindings/spi/microchip,spi-pic32.txt           |   44 ++++++++++++++++++++
>>>>    1 file changed, 44 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt 
>>>> b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> new file mode 100644
>>>> index 0000000..a555618
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/spi/microchip,spi-pic32.txt
>>>> @@ -0,0 +1,44 @@
>>>> +* Microchip PIC32 SPI device
> [...]
>>>> +Example:
>>>> +
>>>> +    spi1:spi@0x1f821000 {
>>> Please insert spaces after colon.
>> ack
>>
> And please drop "0x" from the <unit-address> part of the name.

ack.

> MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
