From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: sun4i-lradc: Add binding documentation
Date: Sat, 2 Jul 2016 21:46:43 +0200
Message-ID: <b23bd147-0d68-a6a6-14c0-5047af35e6b7@redhat.com>
References: <1467406855-9677-1-git-send-email-alexandre.belloni@free-electrons.com>
 <CAGb2v66PzgVqVGxs4FSQkkX=2hX42UmftahOgJmepv4wA-mwnw@mail.gmail.com>
 <20160702133528.GC20045@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160702133528.GC20045-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 02-07-16 15:35, Alexandre Belloni wrote:
> On 02/07/2016 at 17:12:55 +0800, Chen-Yu Tsai wrote :
>> Hi,
>>
>> On Sat, Jul 2, 2016 at 5:00 AM, Alexandre Belloni
>> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>> Document the bindings for the Allwinner LRADC.
>>
>> We already have Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
>> and I'm pretty sure Hans (CC-ed) argued that this is not a generic ADC
>> block.
>>
>> Any plans to reconcile the different bindings?
>>
>
> Yes, I already submitted an adc-keys driver that can work with any ADC:
> https://lkml.org/lkml/2016/7/1/670
>
> I agree that because it is not yet handling interrupts and is polling
> the ADC, it is not as good as sun4i-lradc-keys yet. My plan is to solve
> that but it require significant work in iio.

And it also seems to break dt compatibility. Note I'm not against
making an exception for this and breaking the dt compat, but until
the polling is fixed we should not replace sun4i-lradc-keys.

If I understand you correctly then you want to use a new generic
"sun4i-lradc" compatible. If you do that then we can just build both
drivers for now and use the right compatible depending on how the
board uses the lradc for now.

Regards,

Hans
