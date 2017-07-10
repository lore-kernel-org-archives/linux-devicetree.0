From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] iio: humidity: hts221: support active-low interrupts
Date: Mon, 10 Jul 2017 10:36:47 +0100
Message-ID: <ceef5860-91ee-a922-0dd7-8f2698192b9b@arm.com>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
 <20170709165704.26311-6-lorenzo.bianconi@st.com>
 <20170709193951.14caff79@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170709193951.14caff79-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On 09/07/17 19:39, Jonathan Cameron wrote:
> On Sun,  9 Jul 2017 18:57:00 +0200
> Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
>> Add support for active low interrupts (IRQF_TRIGGER_LOW and
>> IRQF_TRIGGER_FALLING). Configure the device as active high or low
>> according to the requested irq line.
>>
>> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
> Hi Lorenzo,
> 
> Sorry, you are getting caught up in a more general question I'd like to 
> pin down an answer for...
> 
> What should we be doing if we have a part that supports both high and
> low interrupts and/or rising and falling?
> 
> We actually have more than one possible thing we are configuring with
> one parameter.  If we are looking at shared interrupts or level
> converters it's more than possible we have an inversion going on between
> the two.   How is this represented to the two ends?
> 
> What's the right way of doing this?
> 
> I've added a few CCs that I think might chip in on this question!
> 
> My personal gut feeling is that the inverter should have explicit
> representation in the kernel.  We should be able to instantiate an
> irq_chip which is responsible for flipping it's sense.
> 
> You request an active high input on one side and it deals with
> the active low that needs to be requested upstream.
> 
> Chances are I'm missing something and this is already well handled!

We already have things like that, such as
drivers/irqchip/irq-mtk-sysirq.c (whose sole purpose in life is to
invert interrupt polarity).

Hope this helps,

	M.
-- 
Jazz is not dead. It just smells funny...
