From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] DT: video: atmel_lcdc: Add example of fixed framebuffer
 memory
Date: Tue, 15 Apr 2014 17:19:16 +0200
Message-ID: <534D4DF4.7060301@atmel.com>
References: <1396333730-10592-1-git-send-email-alexander.stein@systec-electronic.com> <2216878.FzI300VPNh@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2216878.FzI300VPNh@ws-stein>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/04/2014 16:57, Alexander Stein :
> Any feedback in this?

Actually I didn't notice it previously: thanks for the heads up.

> Regards,
> Alexander
> 
> On Tuesday 01 April 2014 08:28:50, Alexander Stein wrote:
>> This drivers allows a fixed framebuffer memory to be set by an additional
>> IORESOURCE_MEM resource. Thus add an example to the DT documentation.
>>
>> Signed-off-by: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>

Indeed, it can be useful:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>


>> ---
>> Actually I stumbled myself over this wondering how can I use this specific
>> feature. In the end I found it myself my coincidence. So it's best to add
>> this as an example for other people maybe not that experienced on
>> device-tree.
>>
>>  Documentation/devicetree/bindings/video/atmel,lcdc.txt | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/video/atmel,lcdc.txt b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
>> index 1ec175e..92492b7 100644
>> --- a/Documentation/devicetree/bindings/video/atmel,lcdc.txt
>> +++ b/Documentation/devicetree/bindings/video/atmel,lcdc.txt
>> @@ -10,7 +10,9 @@ Required properties:
>>  	"atmel,at91sam9g45es-lcdc" ,
>>  	"atmel,at91sam9rl-lcdc" ,
>>  	"atmel,at32ap-lcdc"
>> -- reg : Should contain 1 register ranges(address and length)
>> +- reg : Should contain 1 register ranges(address and length).
>> +	Can contain an additional register range(address and length)
>> +	for fixed framebuffer memory.Usefull for dedicated memories.
>>  - interrupts : framebuffer controller interrupt
>>  - display: a phandle pointing to the display node
>>  
>> @@ -35,6 +37,14 @@ Example:
>>  
>>  	};
>>  
>> +Example for fixed framebuffer memory:
>> +
>> +	fb0: fb@0x00500000 {
>> +		compatible = "atmel,at91sam9263-lcdc";
>> +		reg = <0x00700000 0x1000 0x70000000 0x200000>;
>> +		[...]
>> +	};
>> +
>>  Atmel LCDC Display
>>  -----------------------------------------------------
>>  Required properties (as per of_videomode_helper):
>>
> 


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
