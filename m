From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 1/6] regulator: core: Allow simultaneous use of enable op
 and GPIO
Date: Thu, 23 Jun 2016 14:29:39 +0900
Message-ID: <CAAVeFu+9cgt+teWpA3KYwnBU+NAr+RusVd_XavgW1CuPfY2egA@mail.gmail.com>
References: <20160622082558.20935-1-acourbot@nvidia.com> <20160622082558.20935-2-acourbot@nvidia.com>
 <20160622103432.GJ28202@sirena.org.uk> <CAAVeFuK9AV+g0EwTAhr9mFz=ZK5nRR6jnWFhEEsz8+HU7rMKrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuK9AV+g0EwTAhr9mFz=ZK5nRR6jnWFhEEsz8+HU7rMKrw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 23, 2016 at 10:10 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Wed, Jun 22, 2016 at 7:34 PM, Mark Brown <broonie@kernel.org> wrote:
>> On Wed, Jun 22, 2016 at 05:25:53PM +0900, Alexandre Courbot wrote:
>>> The current regulator enable/disable mechanism does not call the driver
>>> enable/disable op if an enable GPIO is set. It may be desirable to use
>>> both mechanisms though, e.g. in the case of a PWM regulator that also
>>> has an enable GPIO.
>>>
>>> _regulator_is_enabled() is also updated in order to take both enable
>>> conditions into account.
>>
>> This is going to break or at least reduce the performance of a lot of
>> users - it is very common for regulators to have configurable support
>> for a GPIO enable in addition to a register enable with the GPIO enable
>> replacing a register enable for improved performance.
>
> Ah, I wasn't aware of this.
>
>> If you have some
>> strange device that requires GPIO and other operations the driver should
>> handle that, if nothing else it's likely that there are sequencing
>> requirements between the two which we are probably not going to get
>> right for everyone in the core.
>
> Having dedicated enable GPIO code in the PWM driver sounded redundant
> since we already have the same in the core, which is why I went for
> this approach. But with your above point it seems like I have no
> choice.

There is also another potential problem with not using the enable GPIO
in the regulator core: said GPIO can not be shared anymore between
several regulators, as this was handled by the core.

That's not a big issue for our use-case but I just wanted to point it
out. Maybe we need a more global solution for shared GPIOs, but I can
see a few challenges on the way (e.g. which policy to adopt and how to
handle conflicts).
