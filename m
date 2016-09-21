From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/4] drivers: irqchip: Add STM32 external interrupts support
Date: Wed, 21 Sep 2016 09:54:52 +0200
Message-ID: <CALszF6Bp2p=fJ+qQE5q_MJC3R5td_YQzrUFH+wgsNjZMuxdrpw@mail.gmail.com>
References: <1474387259-18926-1-git-send-email-alexandre.torgue@st.com>
 <1474387259-18926-3-git-send-email-alexandre.torgue@st.com>
 <alpine.DEB.2.20.1609202214460.5476@nanos> <f7875786-9b5e-075a-59c8-cd32fb1c4583@st.com>
 <alpine.DEB.2.20.1609210949150.5573@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1609210949150.5573@nanos>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2016-09-21 9:50 GMT+02:00 Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>:
> On Wed, 21 Sep 2016, Alexandre Torgue wrote:
>
>> Hi Thomas,
>>
>> On 09/20/2016 10:16 PM, Thomas Gleixner wrote:
>> > Alexandre,
>> >
>> > On Tue, 20 Sep 2016, Alexandre TORGUE wrote:
>> >
>> > > The STM32 external interrupt controller consists of edge detectors that
>> > > generate interrupts requests or wake-up events.
>> > >
>> > > Each line can be independently configured as interrupt or wake-up source,
>> > > and triggers either on rising, falling or both edges. Each line can also
>> > > be masked independently.
>> > >
>> > > Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > > Signed-off-by: Alexandre TORGUE <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
>> >
>> > That all looks very reasonable now. The only remaining question is your SOB
>> > chain. Who is the author of these patches? You or Maxime? If it's Maxime,
>> > then the changelog misses a From: tag. If it's you then Maximes SOB is
>> > bogus.
>>
>> Actually Maxime wrote the main part of this driver and sent version 1 and 2 of
>> the series. After Linus W. reviews, rework was required to use hierarchical
>> domain. According to Maxime, I coded the rework (adaptation to hierarchical
>> domain) and sent other version of the series.
>
> So I replace Maximes SOB with Originally-by: Does that apply to all four
> patches?
Yes, that's fine.
Alex did a lot of rework on this series, he deserves the SoB.

Thanks,
Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
