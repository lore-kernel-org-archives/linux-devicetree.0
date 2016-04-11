From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 02/16] mfd: da8xx-cfgchip: New header file for CFGCHIP
 registers.
Date: Mon, 11 Apr 2016 13:53:57 +0530
Message-ID: <570B5F1D.7030609@ti.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-3-git-send-email-david@lechnology.com>
 <56F573F3.90500@cogentembedded.com> <56F94772.7070009@lechnology.com>
 <56F95EE6.1010403@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F95EE6.1010403-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 28 March 2016 10:12 PM, Sergei Shtylyov wrote:
> Hello.
> 
> On 03/28/2016 06:02 PM, David Lechner wrote:
> 
>>>> +/* register offsets */
>>>> +#define CFGCHIP_REG(n)                (n * 4)
>>>> +#define CFGCHIP0_REG                CFGCHIP_REG(0)
>>>> +#define CFGCHIP1_REG                CFGCHIP_REG(1)
>>>> +#define CFGCHIP2_REG                CFGCHIP_REG(2)
>>>> +#define CFGCHIP3_REG                CFGCHIP_REG(3)
>>>> +#define CFGCHIP4_REG                CFGCHIP_REG(4)
>>>
>>>     Why not just use CFGCHIP_REG(n) directly?
>>
>> I considered that, but I went this way because A) the TRM uses, for
>> example,
>> "CFGCHIP2", so I wanted to keep "CFGCHIP" and "2" together

IMO, this is not that big of an issue. Anyone reading should be able to
make out that CFGCHIP_REG(0) is same as CFGCHIP0 referred to in the TRM.

> 
>    I'd just drop the _REG suffix.
> 
>> and B) this tells
>> you how many CFGCHIP registers there are, i.e. there is no CFGCHIP5_REG.
> 
>    You can tell that in a comment. Having a parametrized macro and using
> it to just #define more macros doesn't appeal to me at all...

Agree with Sergei, I don't prefer the additional #defines as well.

Regards,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
