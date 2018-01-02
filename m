From: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/4] arm64: defconfig: enable additional led triggers
Date: Tue, 2 Jan 2018 12:49:54 +0530
Message-ID: <CAP245DUnO6qoXXoAOakQ_HYTTbR+CgO-nQ-Jm5nOaPeySm968g@mail.gmail.com>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
 <CAHLCerN4sYpU7PJG7JLhAy644s3jz9KD_myKWfOoOkEResPu-Q@mail.gmail.com> <CAK8P3a0+4ACDucmNQ3OL_0UjJnK6d3JXOb6_z5jtMQ986uZkLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a0+4ACDucmNQ3OL_0UjJnK6d3JXOb6_z5jtMQ986uZkLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lakml <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 8:46 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wed, Dec 6, 2017 at 9:57 AM, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> (Adding Arnd)
>>
>> Now that the merge window rush has abated, can you please apply this
>> trivial series?
>>
>> On Mon, Nov 6, 2017 at 12:38 PM, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> This patchset enables the kernel panic and disk-activity trigger for LEDs
>>> and then enables the panic trigger for three 96Boards - DB410c, Hikey and
>>> Hikey960.
>>>
>>> DB410c and Hikey panic behaviour has been tested by triggering a panic
>>> through /proc/sysrq-trigger, while Hikey960 is only compile-tested.
>
> I applied all four now, but it would have been easier for me if you had either
> sent them to the platform maintainers, or to arm-DgEjT+Ai2yi4UlQgPVntAg@public.gmane.org

The platform maintainers are cc'ed but I guess nobody took them since
the patchset touched 3 different platforms and a common defconfig.

I'll remember to cc arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org in the future but is there any
reason why this email address isn't listed in MAINTAINERS?

Thanks for applying the patches.

Wish you a Happy New Year.

Regards,
Amit
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
