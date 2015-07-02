From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 02 Jul 2015 16:30:47 +0200
Message-ID: <55954B17.3020303@linutronix.de>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de> <5594E9F6.7040701@linutronix.de> <20150702142601.GB9349@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20150702142601.GB9349@localhost.localdomain>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, Dinh Nguyen <dinguyen@altera.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On 07/02/2015 04:26 PM, Richard Cochran wrote:
> On Thu, Jul 02, 2015 at 09:36:22AM +0200, Sebastian Andrzej Siewior wrote:
>> If you are in a specific SoC you could do
>> 	base = of_alias_get_id(np, "gpio") * num_of_gpio_per_chip
>> and get consistent numbers / sane.
> 
> And what about /sys/class/gpio ?

What about it?

> 
>> I think this is the one reason why there is no generic binding for the
>> starting address. The other reason might be that this is simply a user
>> space problem. To get consistent numbers all you need to do to lookup
>> each gpio's memory address and decide if this is the one you look for.
> 
> The user should be able to simply look up a GPIO in the data sheet,
> and then use it from a shell script.  Why not make that easy to do?
> 
> (Other gpio controllers are doing that, too, BTW.)

I'm not saying that you should not do so. There is _no_ generic binding
for this and this is what I suggest.

> 
> Thanks,
> Richard
> 
Sebastian
