From: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] gpio: interrupt consistency check for OF GPIO IRQs
Date: Mon, 11 Nov 2013 20:17:14 +0100
Message-ID: <52812D3A.2070107@keymile.com>
References: <1377526030-32024-1-git-send-email-larsi@wh2.tu-dresden.de> <1521079.WSLhhfqBXl@lem-wkst-02> <52261BF0.4090106@wwwdotorg.org> <3144247.j2q6H0KWZx@lem-wkst-02> <52279524.8090006@wwwdotorg.org> <20130909161924.GT29403@sirena.org.uk> <528121D5.40403@keymile.com> <528127B2.80109@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528127B2.80109-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lars Poeschel <larsi-myOXECIRRCL4ajHJ1XSv27NAH6kLmebB@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Balaji T K <balajitk-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Jon
List-Id: devicetree@vger.kernel.org

Hi Stephan,

On 11/11/2013 07:53 PM, Stephen Warren wrote:
> On 11/11/2013 11:28 AM, Gerlando Falauto wrote:
>> Hi everyone,
>>
>> [jumping in on an old discussion]
>>
>> On 09/09/2013 06:19 PM, Mark Brown wrote:
>>> On Wed, Sep 04, 2013 at 02:16:36PM -0600, Stephen Warren wrote:
>>>> On 09/04/2013 03:05 AM, Lars Poeschel wrote:
>>>
>>>>> The driver that tries to use the GPIO requested by this patch before
>>>>> HAS to
>>>>> fail. This is exactly the intention of this patch. We don't want the
>>>>> GPIO to
>>>>> be requested any more, if it is used as an interrupt pin.
>>>
>>>> That will break existing drivers. There are drivers that request the
>>>> same GPIO and IRQ. IIRC, the SDHCI CD (Card Detect) GPIO is requested
>>>> that way.
>>>
>>> Yes, plus input devices and audio jack detection among others.  This
>>> pattern is very common if the GPIO is actually being used as a GPIO, an
>>> edge triggered interrupt is used to flag when something happens and the
>>> state is determined by reading the GPIO state (often with some
>>> debounce).
>>
>> I actually came across this thread while looking for an answer to the
>> following (apparently trivial) question:
>>
>> If you were to write a new driver & binding, what would be, in general,
>> the recommended DT binding for a cascade interrupt controller (or any
>> other peripheral, for that matter), which is connected through a GPIO
>> (to be used as IRQ)?
>>
>> a) Through gpios = <&gpio0 N>
>> b) through interrupt-parent = <&gpio0> & interrupts <N
>> IRQ_TYPE_LEVEL_LOW>, or
>> c) both?
>
> (b) alone.
>
>  From the perspective of the child interrupt controller, its output is
> purely an interrupt. The fact that the parent interrupt controller could
> use that pin as a GPIO in some other context (e.g. on a different board)
> isn't something that the child interrupt controller should know/care about.
>

Thanks for your answer. So it should be the parent driver to proactively 
configure the GPIO as input, active high etc..., when an IRQ for its 
GPIOs is requested, right?

Moving to a different target (actually Mark's original point), i.e. a 
generic device which is connected through a GPIO, using the IRQ to 
trigger an event, what would be the recommended way?

Thanks again!
Gerlando
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
