From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Thu, 3 Dec 2015 09:52:56 -0600
Message-ID: <56606558.9080200@ti.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <20151124162624.GI807@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151124162624.GI807@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/24/2015 10:26 AM, Lee Jones wrote:
> On Wed, 18 Nov 2015, Andrew F. Davis wrote:
>
>> In an effort to cleanup this driver and add Device Tree support
>> the driver has been rewritten based on new driver styles and
>> modern kernel driver helpers. This has nearly halved the lines
>> of code while keeping all previous functionality.
>>
>> Platform file based initialization has been dropped as there is
>> no examples of this use in the kernel.
>>
>> v1 can be found here: [1] v2: [2] v3: [3] v4: [4] v5: [5] v6: [6]
>>
>> Changes from v6:
>>   - Removed compatible strings from DT sub-nodes
>>   - Rearranged DT bindings
>>   - Small fixes
>>
>> Changes from v5:
>>   - Small formatting changes to DT Docs
>>   - Converted to_tps65912_gpio from macro to inline function
>>
>> Changes from v4:
>>   - Use mfd core to add sub-devices
>>
>> Changes from v3:
>>   - Reorganized regulator driver and related DT node
>>   - Other small fixes as discussed in v3 thread
>>
>> Changes from v2:
>>   - Split the series further into subsystems
>>
>> Changes from v1:
>>   - Split the rewrite into delete/create patches
>>   - Several small fixes as discussed in v1 thread
>>
>> [1] http://www.spinics.net/lists/devicetree/msg93863.html
>> [2] http://www.spinics.net/lists/devicetree/msg95003.html
>> [3] http://www.spinics.net/lists/devicetree/msg95133.html
>> [4] http://www.spinics.net/lists/devicetree/msg96109.html
>> [5] http://www.spinics.net/lists/devicetree/msg100601.html
>> [6] https://lkml.org/lkml/2015/10/30/690
>>
>> Andrew F. Davis (5):
>>    Documentation: tps65912: Add DT bindings for the TPS65912 PMIC
>>    mfd: tps65912: Remove old driver in preparation for new driver
>>    mfd: tps65912: Add driver for the TPS65912 PMIC
>>    regulator: tps65912: Add regulator driver for the TPS65912 PMIC
>>    gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
>>
>>   Documentation/devicetree/bindings/mfd/tps65912.txt |  50 ++
>>   drivers/gpio/Kconfig                               |   2 +-
>>   drivers/gpio/gpio-tps65912.c                       | 317 ++++-----
>>   drivers/mfd/Kconfig                                |  20 +-
>>   drivers/mfd/Makefile                               |   3 +-
>>   drivers/mfd/tps65912-core.c                        | 290 ++++-----
>>   drivers/mfd/tps65912-i2c.c                         | 219 +++----
>>   drivers/mfd/tps65912-irq.c                         | 217 -------
>>   drivers/mfd/tps65912-spi.c                         | 219 +++----
>>   drivers/regulator/Kconfig                          |   2 +-
>>   drivers/regulator/tps65912-regulator.c             | 710 +++++----------------
>>   include/linux/mfd/tps65912.h                       | 208 +++---
>
> Just waiting for the regulator Ack now, right?
>

I believe so, is there a friendly way to poke Mark Brown so this doesn't
get caught in his filter? This is almost identical to the regulator he
applied the other day from me so I don't imagine there will be much problem
with this patch.

>>   12 files changed, 780 insertions(+), 1477 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/tps65912.txt
>>   rewrite drivers/gpio/gpio-tps65912.c (74%)
>>   rewrite drivers/mfd/tps65912-core.c (95%)
>>   rewrite drivers/mfd/tps65912-i2c.c (93%)
>>   delete mode 100644 drivers/mfd/tps65912-irq.c
>>   rewrite drivers/mfd/tps65912-spi.c (92%)
>>   rewrite drivers/regulator/tps65912-regulator.c (94%)
>>
>> --
>> 1.9.1
>>
>
