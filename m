From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 00/11] drivers: Add Pinctrl PM support
Date: Tue, 04 Jun 2013 11:15:51 -0700
Message-ID: <87k3m92148.fsf@linaro.org>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
	<20130531170437.GA17591@core.coreip.homeip.net>
	<CACRpkdYnhjpFp1CM=P_hddBe4qVigtE0c+CN9NKvk3nFgJS-ig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYnhjpFp1CM=P_hddBe4qVigtE0c+CN9NKvk3nFgJS-ig@mail.gmail.com>
	(Linus Walleij's message of "Tue, 4 Jun 2013 09:25:02 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hebbar Gururaja <gururaja.hebbar@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vaibhav Bedia <vaibhav.bedia@ti.com>, sudhakar.raj@ti.com
List-Id: devicetree@vger.kernel.org

Hi Linus,

Linus Walleij <linus.walleij@linaro.org> writes:

> On Fri, May 31, 2013 at 7:04 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>
>> As with the original introduction of pinctrl states my question is: "Can
>> all of this be handled in the driver/bus core instead of adding a lot
>> of boilerplate code to the individual drivers".
>
> It can. Per the suggestion in 2/11:
>
> - Adding pins_sleep and pins_idle to struct dev_pin_info
>   in include/linux/pinctrl/devinfo.h
>
> - Modify drivers/base/pinctrl.c to optionally look up
>   sleep and idle states, you can make that code
>   #ifdef CONFIG_PM I think.
>
> - Add something like static inline functions to
>   include/linux/pinctrl/consumer.h
>   with names like pinctrl_select_pm_idle(struct device *)
>   pinctrl_select_pm_sleep(struct device *) to switch states
>   using the device core containers, and includes
>   checking IS_ERR() on the handles etc.
>
> I think this will save a *lot* of identical code in all the
> drivers, that will just have to call
> pinctrl_select_pm_sleep(), pinctrl_select_pm_default()
> pinctrl_select_pm_idle() instead of all the complex code.
>
> This is what I planned to do but never got around to.

What about taking it one tiny step further, and having it done by the PM
core itself?

Seems like something that should just be done as part of runtime PM
transitions and the suspend/resume process.

Kevin
