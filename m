From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Pulls and drive strengths in the pinctrl world
Date: Fri, 17 May 2013 14:38:14 +0200
Message-ID: <4505921.rFrq65cY6P@amdc1227>
References: <CAD=FV=V9h3RUfvAxj8k2EbYXYPO4FfoNwh=f=dno5ZBUFYeG0w@mail.gmail.com>
 <2465185.vYkbXUqoOT@flatron>
 <CACRpkdZvN_0fd6N11NeSRtVZd5A1oE9TEhbOOz6Q27x6M39bcQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <CACRpkdZvN_0fd6N11NeSRtVZd5A1oE9TEhbOOz6Q27x6M39bcQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@google.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Thomas Abraham <thomas.abraham@linaro.org>, Simon Glass <sjg@chromium.org>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Friday 17 of May 2013 13:59:54 Linus Walleij wrote:
> On Fri, May 17, 2013 at 11:09 AM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> >> Just add another state, pctldev->hog_shutdown to this, and
> >> add an operation pinctrl_force_poweroff() in the same spirit as
> >> pinctrl_force_sleep() that we already have.
> >> 
> >> Add a new state to include/linux/pinctrl/pinctrl-state.h:
> >> #define PINCTRL_STATE_POWEROFF "poweroff"
> >> 
> >> And define you pin table to hog these pins with the mentioned
> >> default and poweroff states.
> >> 
> >> Result: pinctrl core keeps track of your offstate too.
> > 
> > Power down mode settings on our pin controller are completely unrelated to
> > normal mode settings. You can set them once in appropriate registers and
> > pins are switched to them automatically when the SoC enters sleep mode.
> 
> Aha so it's actually automatic sleep modes, not power down
> (as in, disconnect the power and then push the "on" button to
> get it back up).
> 
> Please remember to document it per above in the code and the
> device tree, so everybody understands what it is.

Sure.

> > So IMHO in our case power mode settings are just additional pin
> > configuration options, next to pull-up/-down and driver strength.
> 
> I see. Yes that is different.
> 
> You might want to have a debugfs file in your driver for inspecting
> them though, that sounds like it could be helpful. I'd recommend
> augmenting your .pin_config_dbg_show() callback in the
> struct pinconf_ops to display this for each pin, in addition to the
> current configuration.

Seems reasonable.

Best regards,
-- 
Tomasz Figa
Linux Kernel Developer
Samsung R&D Institute Poland
Samsung Electronics
