From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH v3] gpio: add export with name from dts
Date: Thu, 17 Oct 2013 11:03:25 -0700
Message-ID: <CAAVeFuJCamVumTphu-Wv2DSgepwoPgYXnCGdK=L8oem-3-K+gA@mail.gmail.com>
References: <1382011682-18595-1-git-send-email-jiri.prchal@aksignal.cz> <20131017150455.GH24056@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20131017150455.GH24056@e106331-lin.cambridge.arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "blogic@openwrt.org" <blogic@openwrt.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "acourbot@nvidia.com" <acourbot@nvidia.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "cooloney@gmail.com" <cooloney@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 17, 2013 at 8:04 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> Hello Jiri,
>
> On Thu, Oct 17, 2013 at 01:08:02PM +0100, Jiri Prchal wrote:
>> Add export possibility to sysfs with given name in device tree. It is nice for
>> users to have board specific gpios exported at boot-time and with their names.
>> It renames some functions in gpiolib and adds name as parameter. If it is passed
>> NULL as name everything works like before, export by chip name.
>> It can be done by extra function export_with_name without changing original
>> export function but I think there would not to be twice almost the same.
>> Even if gpio sysfs interface is almost to be deprecated, I would like to add
>> this, cause new chardev interface is in farness future.
>> Rebased from older unapplyed patch: [PATCH] owrt: GPIO: add gpio_export_with_name.
>> v3:
>> change to "linux,gpio-export"
>> removed arrays of gpios, just one child node -> one GPIO line
>> simplified node properties like as it's in gpio-leds
>> if not label -> uses child node name
>>
>> Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
>> ---
>>  Documentation/devicetree/bindings/gpio/gpio.txt |   44 ++++++++++++++++++
>>  drivers/gpio/gpiolib-of.c                       |   56 +++++++++++++++++++++++
>>  drivers/gpio/gpiolib.c                          |   27 +++++++----
>>  include/asm-generic/gpio.h                      |    6 ++-
>>  include/linux/gpio.h                            |   23 +++++++++-
>>  5 files changed, 144 insertions(+), 12 deletions(-)
>
> As I mentioned on v1 of this patch [1], I do not think that this is the
> right way to go about exporting GPIOs to userspace. Why do we need a
> binding for a non-device to tell Linux (specifically Linux) whether or
> not to represent a device to userspace, and how to do so?
>
> Why can this policy not be handled within the GPIO framework, or within
> GPIO drivers?

Pretty much agree with Mark here. There is no reason to limit this
naming feature (which I'm not opposed to fundamentally) to the device
tree. Besides gpio_export_with_link() does something suspisciously
similar, and better-suited in my opinion: the GPIO keeps its
hard-coded, predictable name but is also accessible through a link
under the device that uses it. Since GPIOs are typically used as
functions for devices this seems to make the most sense.

But maybe I'm missing your point - could you describe a concrete
use-case for this feature that can *not* be achieved using
gpio_export_with_link()?

Alex.
