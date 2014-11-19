From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] drivers/core/of: Add symlink to device-tree from devices
 with an OF node
Date: Wed, 19 Nov 2014 16:30:12 +0000
Message-ID: <CACxGe6twb55zSfMhDpmtEFdTZVCVR0VZxNZbRhPwWD949LEuXQ@mail.gmail.com>
References: <1415342031.4925.27.camel@kernel.crashing.org> <3422452.OFUjscQXRB@wuerfel>
 <CAL_JsqKk5UdFEa02wA+3N5BCM7coWAK=4jAr96Pw5eFh2n0ioQ@mail.gmail.com>
 <11269246.iBzpsM0jDI@wuerfel> <CAL_JsqJm9c+GozQssLmjuSLzcsqDiMW8=1P_fM6-Zfdk=N6Lqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJm9c+GozQssLmjuSLzcsqDiMW8=1P_fM6-Zfdk=N6Lqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jeremy.kerr-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 19, 2014 at 3:39 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Nov 19, 2014 at 8:49 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>> On Wednesday 19 November 2014 08:45:58 Rob Herring wrote:
>>> > static inline struct device_node *dev_of_node(struct device *of_node)
>>> > {
>>> >         if (!IS_ENABLED(CONFIG_OF))
>>> >                 return NULL;
>>> >
>>> >         return dev->of_node;
>>> > }
>>> >
>>> > Adding the IS_ENABLED() in a lot of drivers isn't horrible, but we seem
>>> > to be doing it a lot.
>>>
>>> I think you misread things. of_node is always present now, so it
>>> should always be NULL for !CONFIG_OF.
>>>
>>
>> No, I didn't misread it but I should have been clearer with the intention:
>> The idea is to tell the compiler that we know it will be NULL when CONFIG_OF
>> is unset, so it can optimize out all code that does
>>
>>         struct device_node *dn = dev_of_node(dev);
>>
>>         if (dn) {
>>                 ...
>>                 /* complex code */
>>                 ...
>>         }
>>
>> and we can avoid using an #ifdef or if(IS_ENABLED()) in the source to
>> compile out the DT-only sections of a driver.
>
> Oh, right. That would definitely be worthwhile to do.

Agreed.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
