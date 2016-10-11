From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH v6, 4/5] usb: Add MediaTek USB3 DRD Driver
Date: Tue, 11 Oct 2016 12:23:55 +0200
Message-ID: <48357a7f-deee-b114-ccd4-914fd5fa400f@gmail.com>
References: <1474437277-27201-1-git-send-email-chunfeng.yun@mediatek.com>
 <1474437277-27201-5-git-send-email-chunfeng.yun@mediatek.com>
 <49293f1b-42b5-f06b-8fdc-f46fe996e237@gmail.com>
 <1476155663.15546.32.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476155663.15546.32.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/11/2016 05:14 AM, Chunfeng Yun wrote:
> On Mon, 2016-10-10 at 13:00 +0200, Matthias Brugger wrote:
>>
>> On 09/21/2016 07:54 AM, Chunfeng Yun wrote:
>>> This patch adds support for the MediaTek USB3 controller
>>> integrated into MT8173. It can be configured as Dual-Role
>>> Device (DRD), Peripheral Only and Host Only (xHCI) modes.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  drivers/usb/Kconfig                |    2 +
>>>  drivers/usb/Makefile               |    1 +
>>>  drivers/usb/mtu3/Kconfig           |   54 +++
>>>  drivers/usb/mtu3/Makefile          |   19 +
>>>  drivers/usb/mtu3/mtu3.h            |  422 +++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_core.c       |  871 +++++++++++++++++++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_dr.c         |  379 ++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_dr.h         |  108 +++++
>>>  drivers/usb/mtu3/mtu3_gadget.c     |  731 +++++++++++++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_gadget_ep0.c |  883 ++++++++++++++++++++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_host.c       |  294 ++++++++++++
>>>  drivers/usb/mtu3/mtu3_hw_regs.h    |  473 +++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_plat.c       |  490 ++++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_qmu.c        |  599 ++++++++++++++++++++++++
>>>  drivers/usb/mtu3/mtu3_qmu.h        |   43 ++
>>>  15 files changed, 5369 insertions(+)
>>>  create mode 100644 drivers/usb/mtu3/Kconfig
>>>  create mode 100644 drivers/usb/mtu3/Makefile
>>>  create mode 100644 drivers/usb/mtu3/mtu3.h
>>>  create mode 100644 drivers/usb/mtu3/mtu3_core.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_dr.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_dr.h
>>>  create mode 100644 drivers/usb/mtu3/mtu3_gadget.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_gadget_ep0.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_host.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_hw_regs.h
>>>  create mode 100644 drivers/usb/mtu3/mtu3_plat.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_qmu.c
>>>  create mode 100644 drivers/usb/mtu3/mtu3_qmu.h
>>>
>>
>> As Oliver already said, this patch is quiet big which makes it difficult
>> to review.
>> I propose to provide a first implementation with minimal functionality
>> and incremental patches on top of this when the first got merged.
>>
>> You could split the patch in three series/parts:
>> 1. Host only
>> 2. Peripheral only
>> 3. Dual mode
>>
>> What do you think?
>
> Ok, I'll split the patch into some small ones as many as possible.

There is no direct policy how to do that and it depends a bit on every 
maintainer what he prefers. As a rule of thumb each commit should 
compile on it's own without errors. This makes bisecting the kernel much 
easier.

Regards,
Matthias

>
> Thanks a lot
>>
>> Regards,
>> Matthias
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
