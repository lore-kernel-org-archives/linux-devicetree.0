From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v9 2/4] pinctrl: cygnus: add gpio/pinconf driver
Date: Wed, 4 Mar 2015 21:01:45 -0800
Message-ID: <54F7E339.50902@broadcom.com>
References: <1423606584-21795-1-git-send-email-rjui@broadcom.com>	<1423606584-21795-3-git-send-email-rjui@broadcom.com> <CACRpkda-C1upKfa4FKLcVF9sxL4T=B+eG9ndun4fS6DZ9TfCSw@mail.gmail.com> <54F742CA.7080500@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54F742CA.7080500@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger
List-Id: devicetree@vger.kernel.org

Hi Linus,

>>> +#include <linux/kernel.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/module.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/io.h>
>>> +#include <linux/gpio.h>
>>
>> This should be:
>> #include <linux/gpio/driver.h>

In fact, just by trying it out I found I need linux/gpio.h for APIs like
gpiochip_add_pin_range, and etc.

>>
>>
> 
> Great! I will address all comments and re-send a BIG patch series with
> the other pinctrl patch series consolidated.
> 
> Thanks!
> 
> Ray
> 

I've consolidated this patch series with the IOMUX and sent out a
combined patch series earlier. I believe all other comments have been
addressed except the above include header one.

Thanks,

Ray
