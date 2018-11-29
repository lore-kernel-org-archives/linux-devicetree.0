From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: pps: descriptor-based gpio,
 capture-clear addition
Date: Thu, 29 Nov 2018 12:00:56 -0600
Message-ID: <CAL_JsqLSz+iS0Ghy26+cvOd2xHdgc8z6VY88J2hm5gHFHR9vwg@mail.gmail.com>
References: <20181114125432.16044-1-tom@aussec.com> <20181114125432.16044-2-tom@aussec.com>
 <20181116224919.GA18008@bogus> <20181117213522.12672utznrvpbn56@www.aussec.com>
 <CAL_JsqKZHg5_8ghMmU4qO4CVZibcHOvtVJH669zod_6GLGakRg@mail.gmail.com>
 <20181118113502.55634v85ybgkt586@www.aussec.com> <CAL_Jsq+_Fb8mRDf_g=qDVsw-KPnrdZunLksYrgBFvhehzVNX+g@mail.gmail.com>
 <20181127145729.128452ujmj4uhb55@aussec.com> <CAL_Jsq+-S2tF++VstMCeUrX4SXcB4B99Tc-SFUQ3R66KPHVf+Q@mail.gmail.com>
 <20181129130520.198263bp7uxu51ls@aussec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129130520.198263bp7uxu51ls@aussec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Burkart <tom@aussec.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 8:05 PM tom burkart <tom@aussec.com> wrote:
>
> Quoting Rob Herring <robh@kernel.org>:
>
> > On Mon, Nov 26, 2018 at 9:57 PM tom burkart <tom@aussec.com> wrote:
> >>
> >> Quoting Rob Herring <robh@kernel.org>:
> >>
> >> > On Sat, Nov 17, 2018 at 6:35 PM tom burkart <tom@aussec.com> wrote:
> >> >>
> >> >> Quoting Rob Herring <robh@kernel.org>:
> >> >>
> >> >> > On Sat, Nov 17, 2018 at 4:35 AM tom burkart <tom@aussec.com> wrote:
> >> >> >>
> >> >> >> Quoting Rob Herring <robh@kernel.org>:
> >> >> >>
> >> >> >> > On Wed, Nov 14, 2018 at 11:54:29PM +1100, Tom Burkart wrote:
> >> >> >> >> This patch changes the devicetree bindings for the pps-gpio driver
> >> >> >> >> from the integer based ABI to the descriptor based ABI.
> >> >> >> > ? That has nothing to do with DT.
> >> >> >>
> >> >> >> I believe it does, as the change in ABI forces a rename in the DT
> >> >> >> naming convention.
> >> >> >> This is due to the descriptor based ABI appending "-gpio" or
> >> >> "-gpios" (see
> >> >> >> Documentation/gpio/base.txt.)
> >> >> >> Admittedly, I may have called it by the wrong name due to ignorance,
> >> >> >> my apologies.
> >> >> >
> >> >> > If what you say is correct, then you can't change this driver. You'll
> >> >> > break compatibility with any existing DT.
> >> >> >
> >> >> > Changing the binding reasoning should purely be that this is the
> >> >> > preferred form. Bindings must be independent from changing kernel
> >> >> > APIs.
> >> >>
> >> >> See comments from Philip Zabel.  I misread the documentation and this
> >> >> has now been corrected in v8 of the patch.  I hope that eliminates all
> >> >> comments made above.
> >> >>
> >> >> >> >>  It also adds
> >> >> >> >> documentation for the device tree capture-clear option.  The legacy
> >> >> >> >> device tree entry for the GPIO pin is supported.
> >> >> >> >>
> >> >> >> >> Signed-off-by: Tom Burkart <tom@aussec.com>
> >> >> >> >> ---
> >> >> >> >>  Documentation/devicetree/bindings/pps/pps-gpio.txt | 8 ++++++--
> >> >> >> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >> >> >> >>
> >> >> >> >> diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.txt
> >> >> >> >> b/Documentation/devicetree/bindings/pps/pps-gpio.txt
> >> >> >> >> index 3683874832ae..6c9fc0998d94 100644
> >> >> >> >> --- a/Documentation/devicetree/bindings/pps/pps-gpio.txt
> >> >> >> >> +++ b/Documentation/devicetree/bindings/pps/pps-gpio.txt
> >> >> >> >> @@ -5,19 +5,23 @@ a GPIO pin.
> >> >> >> >>
> >> >> >> >>  Required properties:
> >> >> >> >>  - compatible: should be "pps-gpio"
> >> >> >> >> -- gpios: one PPS GPIO in the format described by ../gpio/gpio.txt
> >> >> >> >> +- pps-gpios: one PPS GPIO in the format described by
> >> ../gpio/gpio.txt
> >> >> >> >> +Alternatively (DEPRECATED), instead of pps-gpios above,
> >> it may have:
> >> >> >> >> +- gpios: one PPS GPIO as above
> >> >> >> >>
> >> >> >> >>  Optional properties:
> >> >> >> >>  - assert-falling-edge: when present, assert is indicated by a
> >> >> >> falling edge
> >> >> >> >>                         (instead of by a rising edge)
> >> >> >> >> +- capture-clear: when present, also capture the PPS clear event
> >> >> >> >
> >> >> >> > Is this a h/w thing? or driver configuration?
> >> >> >>
> >> >> >> Driver configuration.  Most of the code was present in the driver, yet
> >> >> >> it was not documented, or usable due to a two line (code) omission
> >> >> >> (the value was not being fetched from DT).
> >> >> >
> >> >> > So what determines how you want to configure this? If the user will
> >> >> > want to change it, then it should be a sysfs attr and exposed to
> >> >> > userspace. If it depends on h/w config for a board then it can be in
> >> >> > DT.
> >> >>
> >> >> Sorry, I misled you somewhat.  If the PPS pulse active transition from
> >> >> the hardware is on the falling edge, this flag is required to get the
> >> >> OS to use that as the active transition.  This would not change at the
> >> >> user's whim but rather it is dependent on connected hardware.
> >> >
> >> > This description sounds more like 'assert-falling-edge' than
> >> 'capture-clear'.
> >> >
> >> > I'm still not clear on what 'capture-clear' is.
> >>
> >> Ignoring my patch for a minute, the pps_gpio_irq_handler will only
> >> report a pps PPS_CAPTURECLEAR event if 'capture-clear' is set.  As the
> >> current pps-gpio driver is not able to set this flag, it cannot ever
> >> report a PPS_CAPTURECLEAR event.
> >>
> >> My patch adds the ability to set this flag and adds the documentation
> >> to go with it.
> >> Admittedly, I do not require this functionality for what I want, but
> >> working with the code, I noticed the omission and decided to add it
> >> for someone else to use it, if they need it.
> >>
> >> I am happy to remove this out of my patch, if you feel this to be the
> >> best way forward.
> >
> > I found this prior discussion on adding this[1]. Seems to me this
> > should be userspace configurable if the GPIO line can interrupt on
> > both edges. We shouldn't need a DT property to determine that.
> >
> > Rob
> >
> > [1] https://lore.kernel.org/patchwork/patch/557781/
>
> Hi Rob,
> the fact that prior knowledge of board/CPU/SOC specifics is required
> is the most compelling argument for this to be in the DT.  This is not
> something a user should need to know or remember.
>
> Userspace is already asking for what they need via the
> time_pps_setparams call, but to do that they have to first call
> time_pps_getparams.  Time_pps_getparams will not return
> PPS_CAPTURECLEAR as it is never set in the driver due to it being
> hardware specific/unable to be set.

My understanding is it is a 2 step process. The capability is exposed
to the user if the hardware supports it, but it is still a user
decision whether or not to enable it. So as far as DT bindings are
concerned, we're only concerned with the first part. Whether the
hardware supports capture clear in the GPIO PPS case just depends on
whether the GPIO controller can support both edge interrupts (or
emulate that by switching between rising/falling edge interrupts). Do
we agree on that part?

Needing to know GPIO interrupt capabilities is hardly specific to PPS.
There is not any explicit property in DT for this capability because
it is implicit based on the GPIO controller's compatible string (or
driver capabilities if emulated). Therefore, it is up to the GPIO
driver and API to expose this information to client drivers like PPS.

Rob
