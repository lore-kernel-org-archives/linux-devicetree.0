From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: Lack of suspend/resume/shutdown ordering between GPIO providers
 and consumers
Date: Wed, 25 Apr 2018 13:06:42 -0500
Message-ID: <03711276-d854-7f87-f2e2-c64716b09dbe@ti.com>
References: <dc0c15eb-3dab-f512-aed6-045528fcec2c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <dc0c15eb-3dab-f512-aed6-045528fcec2c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, jeffy.chen@rock-chips.com, enric.balletbo@collabora.com, josephl@nvidia.com, opendmb@gmail.com, rjw@rjwysocki.net
List-Id: devicetree@vger.kernel.org



On 04/24/2018 05:58 PM, Florian Fainelli wrote:
> Hi Linus, Rafael, all
> 
> Our GPIO controller driver: gpio-brcmstb.c has a shutdown callback which
> gets invoked when the system is brought into poweroff aka S5. So far so
> good, except that we also wish to use gpio_keys.c as a possible wake-up
> source, so we may have a number of GPIO pins declared as gpio-keys that
> allow the system to wake-up from deep slumber.
> 
> Recently we noticed that we could easily get into a state where
> gpio-brcmstb.c::brcmstb_gpio_shutdown() gets called first, and then
> gpio_keys.c::gpio_keys_suspend() gets called later, which is too late to
> have the enable_irq_wake() call do anything sensible since we have
> suspend its parent interrupt controller before. This is completely
> expected unfortunately because these two drivers are both platform
> device instances with no connection to one another except via Device
> Tree and the use of the GPIOLIB APIs.

You can take a look at device_link_add() and Co.

But it's little bit unclear what exactly you have issue with:
- shutdown
- suspend

above are different (at least as it was before) and gpio-brcmstb.c
  brcmstb_gpio_shutdown() should not be called as part of suspend !?
may be you mean brcmstb_gpio_suspend?



-- 
regards,
-grygorii
