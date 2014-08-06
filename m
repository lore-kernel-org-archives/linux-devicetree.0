From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH] of/irq: lookup 'interrupts-extended' property first
Date: Wed, 6 Aug 2014 17:24:12 -0500
Message-ID: <CAL_JsqL6Hzh=ZDM-CUEEvt7GWP4Q-h5OozWtGoYsAAXtzYnp2Q@mail.gmail.com>
References: <1403220823-19444-1-git-send-email-f.fainelli@gmail.com>
 <CAGVrzcYfA8rCXGRW7g0JhT4GQKT8SQj+pMvCh25yoXLFGNM_Pw@mail.gmail.com>
 <20140806165452.GN3711@ld-irv-0074> <CAL_JsqK8BiffXgpQSig5EbV3FUW7EBOn9YjZGqOcUcEJiCJ0WA@mail.gmail.com>
 <20140806201256.GO3711@ld-irv-0074> <CA+bK7J7LQq4S70ScSynbLTjNMmP=9n3KD2suYRg9JN+pEv-Y7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+bK7J7LQq4S70ScSynbLTjNMmP=9n3KD2suYRg9JN+pEv-Y7g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Bird <tbird20d@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 6, 2014 at 4:50 PM, Tim Bird <tbird20d@gmail.com> wrote:
> On Wed, Aug 6, 2014 at 1:12 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> On Wed, Aug 06, 2014 at 01:42:08PM -0500, Rob Herring wrote:
>>> On Wed, Aug 6, 2014 at 11:54 AM, Brian Norris <computersforpeace@gmail.com> wrote:
>>> > On Thu, Jul 31, 2014 at 11:00:01AM -0700, Florian Fainelli wrote:
>>> > I think it is important that a device tree provide some flexibility on
>>> > kernel versions. We only invented 'interrupts-extended' in Linux 3.13,
>>> > so it's easy to have device trees that could work only on 3.13+.
>>> >
>>> > Typically, we might say that new features require new kernels, but this
>>> > is a very basic piece of the DT infrastructure. In our case, we have
>>> > hardware whose basic features can be supported by a single interrupt
>>> > parent, and so we used the 'interrupts' property pre-3.13. But when we
>>> > want to add some power management features, there's an additional
>>> > interrupt parent. Under the current DT binding, we have to switch over
>>> > to using 'interrupts-extended' exclusively, and thus we must have a
>>> > completely new DTB for >=3.13, and this DTB no longer works with the old
>>> > kernels.
>>>
>>> "Must have" to enable the new features?
>>
>> Yes. The new feature requires an additional interrupt parent, and so it
>> requires interrupts-extended.
>
> Hold on there.  What about interrupt-map?  That was the traditional DT
> feature for
> supporting multi-parented interrupts.  Why couldn't the feature have been added
> using that instead of interrupts-extended?

It could have, but interrupts-extended is much more simple to express
for the simple case of a device's interrupts routed to more than one
parent.

> I know interrupts-extended is preferred, but has interrupt-map support been
> removed from recent kernels?  I'm a bit confused.

They are all still supported. It's just a question of order of parsing
if you have find both styles.

Rob
