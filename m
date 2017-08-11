From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] char: xilinx_hwicap: Fix warnings in the driver
Date: Fri, 11 Aug 2017 14:31:36 +0200
Message-ID: <42e6baac-5b3f-5499-782f-9a8d901cac00@xilinx.com>
References: <6da0afe2afd2c7a21d16da9a9c7acab09385ae2c.1501247838.git.michal.simek@xilinx.com>
 <79e2e616a8b7dbf38eb72ba0b620230017dcbc65.1501247838.git.michal.simek@xilinx.com>
 <20170803223218.ilryp5spqztsr3cz@rob-hp-laptop>
 <0e40a687-e11b-b5bb-24f0-465144c98929@xilinx.com>
 <CAL_JsqLy3yV60eoxL0s7vohpcCuh=d3-Z8zVyaEPe=g772yySA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLy3yV60eoxL0s7vohpcCuh=d3-Z8zVyaEPe=g772yySA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10.8.2017 20:16, Rob Herring wrote:
> On Fri, Aug 4, 2017 at 2:49 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> On 4.8.2017 00:32, Rob Herring wrote:
>>> On Fri, Jul 28, 2017 at 03:17:26PM +0200, Michal Simek wrote:
>>>> From: Nava kishore Manne <nava.manne-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>>
>>>> This patch fixes the below warning
>>>>         --> Use #include <linux/io.h> instead of <asm/io.h>
>>>>         --> Use #include <linux/uaccess.h> instead of <asm/uaccess.h>
>>>>         --> please, no space before tabs
>>>>         --> Block comments use a trailing */ on a separate line
>>>>         --> Possible unnecessary 'out of memory' message
>>>>         --> Block comments use * on subsequent lines
>>>>         --> Block comments use a trailing */ on a separate line
>>>>         --> braces {} are not necessary for any arm of this statement
>>>>         --> DT compatible string "xlnx,opb-hwicap-1.00.b"
>>>>          appears un-documented
>>>>         --> DT compatible string "xlnx,xps-hwicap-1.00.a"
>>>>             appears un-documented
>>>>
>>>> Signed-off-by: Nava kishore Manne <navam-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>
>>>>  Documentation/devicetree/bindings/xilinx.txt |  2 ++
>>>
>>> It's preferred to split bindings to separate patches. No need unless you
>>> respin:
>>>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> thanks. Was there any outcome from that discussion to extract binding
>> out of kernel source code?
> 
> Well, the reason to split the patches is so the history of the
> filtered DT repository we generate from the kernel tree[1] looks
> saner.
> 

So many merge commits. It looks weird.

https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/log/

> As far as actually moving things out, no there's not been any
> movement. My biggest concern with moving things out would be the loss
> of kernel subsystem maintainers' review. Once it's a separate tree and
> not merged thru their tree, we'd loose their reviews and I don't have
> confidence that we'd be gaining reviews from other places. Though some
> subsystem maintainers merge bindings and don't look at them already.

ok.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
