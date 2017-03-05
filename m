From: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] media: platform: Renesas IMR driver
Date: Sun, 5 Mar 2017 19:43:58 +0900
Message-ID: <CANqRtoQ9kzUgBs2iLVh2WMTbZDzk5vrd0kxgep+Uz4AgPBLkDw@mail.gmail.com>
References: <20170302210104.646782352@cogentembedded.com> <CAMuHMdVg5N82bu8fxRS=3iqF2MQmqoR0idb_x0t2RNn8eoedQg@mail.gmail.com>
 <f8702961-3561-977f-d6dc-16571a64181e@cogentembedded.com> <CAMuHMdUa4n_Gw7bMiSvDzb8TYQMu3WgnR6kTXtsMu_=k1mQrsA@mail.gmail.com>
 <abdfa250-8b13-7471-3e60-2b33b41aa1a5@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <abdfa250-8b13-7471-3e60-2b33b41aa1a5-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

Thanks for your efforts with this driver. Nice to see that V2 is
getting in better shape.

In the future, would it be possible for you to include the patch
version number in the [PATCH] tag somehow?

On Fri, Mar 3, 2017 at 9:03 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 03/03/2017 02:58 PM, Geert Uytterhoeven wrote:
>
>>>>> +  - "renesas,imr-lx4-v3m" for R-Car V3M.
>>>>
>>>>
>>>>
>>>> "renesas,-EPROBE_DEFER-imr-lx4"
>>>
>>>
>>>
>>>    Huh? :-)
>>
>>
>> Do you know the part number of V3M?
>
>
>    No, but using the names from the manual I don't need it.

NAK, like Geert says, please follow the same style as other upstream
drivers. DT compat strings is not a place for random polices.

Thanks,

/ magnus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
