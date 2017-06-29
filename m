From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC
 support for A83T
Date: Thu, 29 Jun 2017 20:19:14 +0800
Message-ID: <CAAST=9zv8nqbR42kS99F5S6Nk6brZXE8ruOEapSf7sEjKBrD-A@mail.gmail.com>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com> <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
 <24845446a80e3542d90a1111a6141415@aosc.io> <20170627173631.2rjdzgwdwnksqjzm@flea>
 <CAAST=9yWEO7qdZvZJPDKhYnqSwT_fJLcyN_f3eGrLQ15EMvSzQ@mail.gmail.com> <20170629075324.oflzdye3pi5ijzcr@flea>
Reply-To: techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCJ6PAPY4MPBBQ7A2PFAKGQE7LJMSYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170629075324.oflzdye3pi5ijzcr@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: icenowy-h8G6r0blFSE@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-06-29 15:53 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> On Thu, Jun 29, 2017 at 12:45:51PM +0800, Ziping Chen wrote:
>> 2017-06-28 1:36 GMT+08:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> > Hi,
>> >
>> > On Tue, Jun 27, 2017 at 11:29:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
>> >> Maxime, here's another problem: if we have already a GP LRADC driver,
>> >> how can we tell the kernel to use it as IIO ADC rather than keys?
>> >
>> > The GPADC IIO driver is not for the LRADC driver, but the GPADC /
>> > temperature sensor.
>> >
>> > We used to have an LRADC IIO driver in the CHIP BSP written by Alex
>> > (in CC):
>> > https://github.com/NextThingCo/CHIP-linux/commit/8675b761c54be73dc7cc0113209f02e10cc63a27
>> >
>> > But he never mainlined it.
>> >
>> >> Should we introduce a new property for this once ready?
>> >
>> > We need to keep the current binding. We can just check for the
>> > presence or not of child nodes to see if it has some keys, and we'd
>> > need an IIO-to-input driver that is yet to be written.
>> >
>>
>> Yes, then we need an iio-to-input driver...
>> So...whether the driver(a83t lradc keys) can be applied now,
>> or we should wait for the iio-to-input driver.
>
> This is a long term discussion, it shouldn't hold the patches you
> sent.

OK, I get it.

And I will think about how to implement the iio-to-input driver.

Thanks,
Ziping

>
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
