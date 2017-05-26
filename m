From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: keystone-k2l: fix broken Ethernet due to
 disabled OSR
Date: Fri, 26 May 2017 10:12:25 +0200
Message-ID: <CAK8P3a3KQZeZjGQ2OraKP=28X7Sg22SXSCucS2NrwngsJ34-=Q@mail.gmail.com>
References: <59ba5ef37f17ff1c10d9d52ca06ef341b2d476eb.1490782833.git.nsekhar@ti.com>
 <5adb4f5d-78c4-453d-898d-60c588eb1d14@oracle.com> <CAK8P3a2yYK3zO=K__W4jCFYYpFCZLYkm97ADZHunttdUmO_ZOw@mail.gmail.com>
 <1a5730ea-7601-d0bb-15ef-168252f54446@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1a5730ea-7601-d0bb-15ef-168252f54446-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Kristo, Tero" <t-kristo-l0cyMroinI0@public.gmane.org>, "Karicheri, Muralidharan" <m-karicheri2-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 9:44 AM, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> wrote:
> Hi Arnd,
>
> On Friday 31 March 2017 03:43 PM, Arnd Bergmann wrote:
>> On Wed, Mar 29, 2017 at 6:13 PM, santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
>> <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org> wrote:
>>>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>>>> Acked-by: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
>>>> [nsekhar-l0cyMroinI0@public.gmane.org: commit message updates, port to latest mainline]
>>>> Signed-off-by: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
>>>> ---
>>>
>>> Acked-by: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>
>>> Can you please pick this up for rcx fixes ?
>>
>> Applied, thanks!
>
> Looks like this fix never made to to mainline. Do you have the patch
> with you still? It will have to be marked for v4.11 stable and pushed.

Sorry about the mistake, I don't know what happened here but I
found it in my git reflog and applied it to the latest fixes branch
with the stable tag added.

Thanks for checking this and the reminder.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
