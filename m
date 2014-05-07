From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: Re: KConfig and DTS files
Date: Wed, 07 May 2014 12:52:35 -0700
Message-ID: <536A8F03.5070509@boundarydevices.com>
References: <536A697D.3020002@boundarydevices.com> <142702592.Qpp2HrZZke@wuerfel> <536A8456.1040208@boundarydevices.com> <5898724.4EExDycMZy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5898724.4EExDycMZy@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 05/07/2014 12:15 PM, Arnd Bergmann wrote:
> On Wednesday 07 May 2014 12:07:02 Eric Nelson wrote:
>> For me, setting the status to "disabled" required a
>> "resize" first:
>>
>>          U-Boot > fdt set /v4l2_out status disabled
>>          libfdt fdt_setprop(): FDT_ERR_NOSPACE
>>          U-Boot > fdt resize
>>          U-Boot > fdt set /v4l2_out status disabled
>>
>>          U-Boot > fdt print /v4l2_out
>>          v4l2_out {
>>                  compatible = "fsl,mxc_v4l2_output";
>>                  status = "disabled";
>>          };
>>
>
> How about starting out with status="disabled" and then
> removing that if necessary? Leaving out the status property
> should have the same effect as setting it to "ok".
>

For this particular use case, there's no need for the
conditional (the customer will have a custom boot script
anyway), but thanks for the tip about having the
default "disabled".

I still wonder about the choice of not allowing inclusion
of at least include/generated/autoconf.h.

Separate from the case above, we have lots of customers
who re-purpose one or more of our connectors like our
parallel RGB display or parallel camera input and use the
pins for alternate functions.

There is a fine line about when this just becomes a different
"board" though, and DT makes that quite a bit easier.

Regards,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
