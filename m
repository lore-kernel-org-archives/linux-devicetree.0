From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: irq: don't return 0 from of_irq_get()
Date: Fri, 10 Jun 2016 07:55:18 -0500
Message-ID: <CAL_JsqKUM=Un6MAfmJPBQy7jdNMv0MDNB1gmq5v+mG4FwNfrbQ@mail.gmail.com>
References: <20938812.efaALfQEUn@wasted.cogentembedded.com>
 <20160603121432.GB8472@rob-hp-laptop> <65e9eb00-ba9a-87c5-1410-8a5da6b42c8f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <65e9eb00-ba9a-87c5-1410-8a5da6b42c8f@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 10, 2016 at 7:14 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 6/3/2016 3:14 PM, Rob Herring wrote:
>
>>> of_irq_get() returns 0 iff irq_create_of_mapping() call fails. Returning
>>> both error code  and 0 on failure is a sign of a misdesigned API. Return
>>> -ENXIO instead like one of the callers, platform_get_irq(), does; fix up
>>> the kernel-doc as well...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>>
>> So I think this is done this way because of the variation in NO_IRQ
>> definition across architectures.
>
>
>    I remember that NO_IRQ is "considered harmful" by Linus. Actually, I'm
> nit sure what you mean, could you elaborate on that?

Calling locations could handle 0 vs. negative differently. The return
value propagates as well, so you can't easily audit how it is handled.
I'm being paranoid, but we need a better reason than "misdesigned
API". I'm pretty sure we misdesigned it on purpose.

Rob
