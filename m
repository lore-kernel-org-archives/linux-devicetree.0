From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 2/2] mfd: syscon: Add hardware spinlock support
Date: Thu, 11 Jan 2018 15:27:54 +0100
Message-ID: <CAK8P3a1SzecTF4-RbcwFpQ5fgH8t6aLLqD+OC0BizeOVdcLs6Q@mail.gmail.com>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
 <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
 <20180102153620.hhrbov2g5torajim@dell> <CAMz4kuKZjnMZYm59PBa8anfW6pcbgBh-_FDA-3ZKurLXmO6wSA@mail.gmail.com>
 <20180111130833.gtspwn2pv6eozstk@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111130833.gtspwn2pv6eozstk@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 11, 2018 at 2:08 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Thu, 11 Jan 2018, Baolin Wang wrote:
>
>> Hi Arnd,
>>
>> On 2 January 2018 at 23:36, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> > Arnd,
>> >
>> >> Some system control registers need hardware spinlock to synchronize
>> >> between the multiple subsystems, so we should add hardware spinlock
>> >> support for syscon.
>> >>
>> >> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > ... did you sign off on this in the end?
>> >
>>
>> Could you apply this patch if there are no other issue? Thanks.
>
> Arnd is the expert in this area.
>
> Ideally I'd like his Ack before applying the patch.

Reviewed-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Sorry for missing the latest version, this looks good to me.

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
