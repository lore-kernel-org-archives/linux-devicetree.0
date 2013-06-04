From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/11] leds: leds-gpio: Enhance pinctrl support
Date: Tue, 4 Jun 2013 09:18:46 +0200
Message-ID: <CACRpkdYAo-VxYkNwsBGXE4pHob=ubaak+zLGc5QwLNTXu0Qp2g@mail.gmail.com>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
	<1369995191-20855-3-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369995191-20855-3-git-send-email-gururaja.hebbar@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hebbar Gururaja <gururaja.hebbar@ti.com>
Cc: Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vaibhav Bedia <vaibhav.bedia@ti.com>, sudhakar.raj@ti.com, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 31, 2013 at 12:13 PM, Hebbar Gururaja
<gururaja.hebbar@ti.com> wrote:

>  struct gpio_leds_priv {
>         int num_leds;
> +       /* Two optional pin states - default & sleep */
> +       struct pinctrl          *pinctrl;
> +       struct pinctrl_state    *pins_default;
> +       struct pinctrl_state    *pins_sleep;
>         struct gpio_led_data leds[];
>  };

Or actually, wait. You're adding quite a lot of these.

Could you try:

- Adding pins_sleep and pins_idle to struct dev_pin_info
  in include/linux/pinctrl/devinfo.h

- Modify drivers/base/pinctrl.c to optionally look up
  sleep and idle states, you can make that code
  #ifdef CONFIG_PM I think.

- Add something like static inline functions to
  include/linux/pinctrl/consumer.h
  with names like pinctrl_select_pm_idle(struct device *)
  pinctrl_select_pm_sleep(struct device *) to switch states
  using the device core containers, and includes
  checking IS_ERR() on the handles etc.

I think this will save a *lot* of identical code in all the
drivers, that will just have to call
pinctrl_select_pm_sleep(), pinctrl_select_pm_default()
pinctrl_select_pm_idle() instead of all the complex code.

This is what I planned to do but never got around to.

Please?

Yours,
Linus Walleij
