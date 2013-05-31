From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 00/11] drivers: Add Pinctrl PM support
Date: Fri, 31 May 2013 11:08:06 -0700
Message-ID: <8761xz10qh.fsf@linaro.org>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
	<20130531170437.GA17591@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130531170437.GA17591@core.coreip.homeip.net> (Dmitry
	Torokhov's message of "Fri, 31 May 2013 10:04:37 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hebbar Gururaja <gururaja.hebbar@ti.com>, grant.likely@linaro.org, linus.walleij@linaro.org, rob.herring@calxeda.com, davinci-linux-open-source@linux.davincidsp.com, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, vaibhav.bedia@ti.com, sudhakar.raj@ti.comLinus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

+ Linus W. (pinctrl maintainer)

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> Hi Hebbar,
>
> On Fri, May 31, 2013 at 03:43:00PM +0530, Hebbar Gururaja wrote:
>> By optionally putting the pins into sleep state in the suspend [or in
>> runtime_suspend] callback we can accomplish two things.
>> - One is to minimize current leakage from pins and thus save power,
>> - second, we can prevent the IP from driving pins output in an
>> uncontrolled manner, which may happen if the power domain drops the
>> domain regulator.
>> 
>> These states can be specified in the DT blob and corresponding driver
>> can pick these states during probe & set the related values during
>> idle/suspend.
>> 
>> Not all drivers support/has idle state. Drivers like i2c, spi, mmc has
>> idle states and hence these drivers are updated to support all the
>> three states
>> - default  : during regular operation
>> - idle : when the module is in idle state
>> - sleep : when the module is in suspend state
>> 
>> For those drivers which doesn't support/have idle state (at least at
>> the moment), only default & sleep state is added.
>
> As with the original introduction of pinctrl states my question is: "Can
> all of this be handled in the driver/bus core instead of adding a lot
> of boilerplate code to the individual drivers".

Yes, I had the same thought.

What's being handled here are either events related to runtime PM
(runtime suspend, runtime resume) or system PM (suspend/resume) so seems
appropriat to handle them in the PM core.

Kevin
