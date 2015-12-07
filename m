From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Mon, 7 Dec 2015 13:58:47 -0600
Message-ID: <5665E4F7.1070707@ti.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <20151124162624.GI807@x1> <20151204120240.GW26072@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20151204120240.GW26072@sirena.org.uk>
Sender: linux-gpio-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/04/2015 06:02 AM, Mark Brown wrote:
> On Tue, Nov 24, 2015 at 04:26:24PM +0000, Lee Jones wrote:
>> On Wed, 18 Nov 2015, Andrew F. Davis wrote:
>
>>>   Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
>>>   drivers/gpio/Kconfig                               |   2 +-
>>>   drivers/gpio/gpio-tps65912.c                       | 317 ++++-----
>>>   drivers/mfd/Kconfig                                |  20 +-
>>>   drivers/mfd/Makefile                               |   3 +-
>>>   drivers/mfd/tps65912-core.c                        | 290 ++++-----
>>>   drivers/mfd/tps65912-i2c.c                         | 219 +++----
>>>   drivers/mfd/tps65912-irq.c                         | 217 -------
>>>   drivers/mfd/tps65912-spi.c                         | 219 +++----
>>>   drivers/regulator/Kconfig                          |   2 +-
>>>   drivers/regulator/tps65912-regulator.c             | 710 +++++----------------
>>>   include/linux/mfd/tps65912.h                       | 208 +++---
>
>> Just waiting for the regulator Ack now, right?
>
> No, you also need to work out what to do about the GPIO driver not
> building in -next due to interface changes in gpiolib.
>

As all of this driver should be taken though the MFD tree how
can this gpiolib change be handled? If we have gpio.parent it
will not build on MFD, with gpio.dev it will fail to build when
the changes are merged from the gpio subsystem. As the change
has not been merged into linux-next as far a I can tell maybe
this should be taken as is, then when the gpiolib change is
made this can be changed with all the other drivers?
