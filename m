From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Fri, 18 Oct 2013 09:04:02 +0200
Message-ID: <5260DD62.2060706@aksignal.cz>
References: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz> <20131017150455.GH24056@e106331-lin.cambridge.arm.com> <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "blogic@openwrt.org" <blogic@openwrt.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "cooloney@gmail.com" <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi all,

Dne 17.10.2013 20:03, Alexandre Courbot napsal(a):
> On Thu, Oct 17, 2013 at 8:04 AM, Mark Rutland <mark.rutland@arm.com> wrote:
>> Hello Jiri,
>>
>> On Thu, Oct 17, 2013 at 01:08:02PM +0100, Jiri Prchal wrote:
>>> Add export possibility to sysfs with given name in device tree. It is nice for
>>> users to have board specific gpios exported at boot-time and with their names.
>>> It renames some functions in gpiolib and adds name as parameter. If it is passed
>>> NULL as name everything works like before, export by chip name.
>>> It can be done by extra function export_with_name without changing original
>>> export function but I think there would not to be twice almost the same.
>>> Even if gpio sysfs interface is almost to be deprecated, I would like to add
>>> this, cause new chardev interface is in farness future.
>>> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
>>> v3:
>>> change to "linux,gpio-export"
>>> removed arrays of gpios, just one child node -> one GPIO line
>>> simplified node properties like as it's in gpio-leds
>>> if not label -> uses child node name
>>>
>>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>>> ---
>>>   Documentation/devicetree/bindings/gpio/gpio.txt |   44 ++++++++++++++++++
>>>   drivers/gpio/gpiolib-of.c                       |   56 +++++++++++++++++++++++
>>>   drivers/gpio/gpiolib.c                          |   27 +++++++----
>>>   include/asm-generic/gpio.h                      |    6 ++-
>>>   include/linux/gpio.h                            |   23 +++++++++-
>>>   5 files changed, 144 insertions(+), 12 deletions(-)
>>
>> As I mentioned on v1 of this patch [1], I do not think that this is the
>> right way to go about exporting GPIOs to userspace. Why do we need a
>> binding for a non-device to tell Linux (specifically Linux) whether or
>> not to represent a device to userspace, and how to do so?
>>
>> Why can this policy not be handled within the GPIO framework, or within
>> GPIO drivers?
>
> Pretty much agree with Mark here. There is no reason to limit this
> naming feature (which I'm not opposed to fundamentally) to the device
> tree. Besides gpio_export_with_link() does something suspisciously
> similar, and better-suited in my opinion: the GPIO keeps its
> hard-coded, predictable name but is also accessible through a link
> under the device that uses it. Since GPIOs are typically used as
> functions for devices this seems to make the most sense.
>
> But maybe I'm missing your point - could you describe a concrete
> use-case for this feature that can *not* be achieved using
> gpio_export_with_link()?

The concrete use-case is that I have two boards with same I/O on them, but they use
two different SoC. And I like to shadow it to users. On one board is some I/O on
pioC16 and on the other it is on pioA30 for example.
I'd like to prepare I/O just with right board names for example in11.
I'm trying to do something like GPIOs LEDs, I like that interface, but I need it
for both direction.
So where else give the name then in DT. And why not to export it there. Just like
LEDs.
Of course I can use gpio_export_with_link() to not change gpio_export().
But what I don't like on gpio_export_with_link() is that there will be twice more
dirs in sysfs and it would be less transparent and users confusing "What is the pioA30?"

Jiri
