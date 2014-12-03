From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] devicetree: of: Add bindings for chosen node,
 stdout-path
Date: Wed, 03 Dec 2014 15:07:49 -0800
Message-ID: <547F97C5.7020202@gmail.com>
References: <1417110967-16284-1-git-send-email-leif.lindholm@linaro.org> <1417110967-16284-2-git-send-email-leif.lindholm@linaro.org> <547E7455.6090009@gmail.com> <CACxGe6vdbURE3=W3Uerwy90piGKhv7-m+-vpUhCiUTKB4AzTsw@mail.gmail.com> <547F6881.20400@gmail.com> <CACxGe6ugLyV50gKCe83wCL0=qy+oHeExf9murW+qFuoVQ_TzsA@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6ugLyV50gKCe83wCL0=qy+oHeExf9murW+qFuoVQ_TzsA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/3/2014 1:45 PM, Grant Likely wrote:
> On Wed, Dec 3, 2014 at 7:46 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 12/3/2014 7:12 AM, Grant Likely wrote:
>>> On Wed, Dec 3, 2014 at 2:24 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>> On 11/27/2014 9:56 AM, Leif Lindholm wrote:
>>>>> Add a global binding for the chosen node.
>>>>> Include a description of the stdout-path, and an explicit statement on
>>>>> its extra options in the context of a UART console.
>>>>>
>>>>> Opening description stolen from www.devicetree.org, and part of the
>>>>> remaining text provided by Mark Rutland.
>>>>>
>>>>> Signed-off-by: Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/chosen.txt |   42 ++++++++++++++++++++++++++
>>>>>  1 file changed, 42 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/chosen.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
>>>>> new file mode 100644
>>>>> index 0000000..9cd74e9
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/chosen.txt
>>>>> @@ -0,0 +1,42 @@
>>>>> +The chosen node
>>>>> +---------------
>>>>> +
>>>>> +The chosen node does not represent a real device, but serves as a place
>>>>> +for passing data between firmware and the operating system, like boot
>>>>> +arguments. Data in the chosen node does not represent the hardware.
>>>>> +
>>>>> +
>>>>> +stdout-path property
>>>>
>>>> The code in patch 3/3 adds the extra options feature to the properties:
>>>>
>>>>   stdout-path
>>>>   linux,stdout-path
>>>>   stdout  [if (IS_ENABLED(CONFIG_PPC) ... ]
>>>
>>> I don't understand what you mean here. Are you suggesting a change to
>>> this patch? Is there something deficient in it?
>>
>> Assuming that the code change in patch 3 is as desired, then the chosen.txt
>> documentation applies to all three properties, not just stdout-path.  So
>> yes, a change is suggested for the documentation.
> 
> how about if this is added:
> 
> Implementation note: Linux will look for the property "linux,stdout-path" or
> on PowerPC "stdout" if "stdout-path" is not found.  However, the
> "linux,stdout-path" and "stdout" properties are deprecated. New platforms
> should only use the "stdout-path" property.
> 
> g.
> 

Yep, perfect.

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
