From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH  0/2] gpio: Allow userspace export from DT
Date: Thu, 07 May 2015 07:38:46 +0200
Message-ID: <554AFA66.4000407@aksignal.cz>
References: <20150413110515.9681.58848.stgit@localhost>
 <20150504084925.GB4047@localhost>
 <20150506112449.GQ2067@n2100.arm.linux.org.uk>
 <20150506124354.GA5302@localhost>
 <20150506125707.GV2067@n2100.arm.linux.org.uk>
 <20150506132520.GC5302@localhost>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150506132520.GC5302@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Johan Hovold <johan@kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Martin Fuzzey <mfuzzey@parkeon.com>, devicetree@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 6.5.2015 15:25, Johan Hovold wrote:
> On Wed, May 06, 2015 at 01:57:08PM +0100, Russell King - ARM Linux wrote:
>> On Wed, May 06, 2015 at 02:43:54PM +0200, Johan Hovold wrote:
>>> On Wed, May 06, 2015 at 12:24:50PM +0100, Russell King - ARM Linux wrote:
>>>> On Mon, May 04, 2015 at 10:49:25AM +0200, Johan Hovold wrote:
>>>>> Firmware should describe pin directionality and function, and undefined
>>>>> pins should never be allowed to be accessed from userspace.
>>>>
>>>> No, that's totally wrong if you consider one of the most common use
>>>> cases out there...
>>>>
>>>> Think about something like a Raspberry Pi, where you have a header with
>>>> GPIOs on it, which can be used for multiple different purposes (and are
>>>> even multiplexed with some on-SoC functions.)
>>>>
>>>> "Firmware" can't know about all possible configurations of those IO pins.
>>>>
>>>> That's why Raspberry Pi uses a userspace helper and programs stuff up
>>>> appropriately for the users application.
>>>
>>> I'm not familiar with exactly how the RPi handles its pin muxing, but
>>> even if it requires userspace interaction that should not prevent having
>>> firmware describe the pins.
>>
>> How it handles this is... it doesn't.  Userspace does it.
>>
>> There is *no* "firmware" on these devices.  The only thing you have is a
>> boot loader and a DT blob, and people will hate you if you tell them that
>> they have to change the DT blob and then reboot their systems to change
>> the functionality of a GPIO pin.
>>
>> It's also entirely reasonable to assume that people are going to want to
>> change the configuration at runtime, given their diverse range of
>> applications.
>
> DT can be changed at run-time using overlays.
>
> This way the RPi users could define their i2c-clients, or whatever buses
> they choose to expose on those pins as well.
>
>>> In general, if the hardware configuration is static we use device trees.
>>>
>>> If the configuration is dynamic we use device-tree overlays; either
>>> loaded manually or by some service (e.g. Beaglebone capes). Perhaps this
>>> could be handled by the RPi helper.
>>
>> Yes, that _could_ work, but I bet asking millions of people to change
>> what they're doing is going to be extremely difficult.  Remember the
>> golden rule of the kernel: thou shalt not break userspace.
>>
>> So, there is _no_ possibility of removing this GPIO exposure to userspace
>> because we _know_ that it will break people.
>>
>> If you think differently on the "thou shalt not break userspace" please
>> don't discuss it with me, I'm not interested.  Linus isn't interested
>> either, and if you try and discuss it with him, he'll tell you to get
>> out of kernel programming. :)
>>
>> This is a commonly used API.  You can't change it.
>
> I've never suggested that we remove the current API, but *only* exposing
> a totally non-restrictive interface for systems not used by school
> children and hardware hackers is not sane.
>
> You also cut out the part in my reply about continuing to allow
> unrestricted access for such cases. That could still continue to be the
> default (e.g. when there are no pin function names defined in DT).
>
> And if those people ever update their DTs they could benefit from the
> deterministic pin naming without loosing any flexibility too.

Just to not let Johan alone:
I totally agree with Johan and looking for this export for at least 2 years.
Jiri

>
> Johan
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
