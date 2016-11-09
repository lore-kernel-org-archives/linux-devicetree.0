From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCHv2 2/2] gpio: xilinx: Add clock support
Date: Wed, 9 Nov 2016 09:18:52 -0800
Message-ID: <20161109171852.GC14444@xsjsorenbubuntu>
References: <1478668191-26322-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1478668191-26322-2-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20161109062734.GX14444@xsjsorenbubuntu>
 <CAKfKVtGxaWYEVPaU_G0Z7HJm4_ZAcTisZBj-BtSmAdL1+w+7xw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKfKVtGxaWYEVPaU_G0Z7HJm4_ZAcTisZBj-BtSmAdL1+w+7xw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-09 at 12:16:58 +0530, Shubhrajyoti Datta wrote:
> On Wed, Nov 9, 2016 at 11:57 AM, Sören Brinkmann
> <soren.brinkmann@xilinx.com> wrote:
> > On Wed, 2016-11-09 at 10:39:51 +0530, Shubhrajyoti Datta wrote:
> >> Add basic clock support for xilinx gpio.
> >>
> >> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >> ---
> >> v2 :
> >> no change
> >>
> >>  drivers/gpio/gpio-xilinx.c |   22 ++++++++++++++++++++++
> >>  1 files changed, 22 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> >> index 14b2a62..923cab8 100644
> >> --- a/drivers/gpio/gpio-xilinx.c
> >> +++ b/drivers/gpio/gpio-xilinx.c
> >> @@ -13,6 +13,7 @@
> >>   */
> >>
> >>  #include <linux/bitops.h>
> >> +#include <linux/clk.h>
> >>  #include <linux/init.h>
> >>  #include <linux/errno.h>
> >>  #include <linux/module.h>
> >> @@ -45,6 +46,7 @@
> >>   * @gpio_state: GPIO state shadow register
> >>   * @gpio_dir: GPIO direction shadow register
> >>   * @gpio_lock: Lock used for synchronization
> >> + * @clk: Clock resource for this controller
> >>   */
> >>  struct xgpio_instance {
> >>       struct of_mm_gpio_chip mmchip;
> >> @@ -52,6 +54,7 @@ struct xgpio_instance {
> >>       u32 gpio_state[2];
> >>       u32 gpio_dir[2];
> >>       spinlock_t gpio_lock[2];
> >> +     struct clk *clk;
> >>  };
> >>
> >>  static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
> >> @@ -282,6 +285,7 @@ static int xgpio_remove(struct platform_device *pdev)
> >>       struct xgpio_instance *chip = platform_get_drvdata(pdev);
> >>
> >>       of_mm_gpiochip_remove(&chip->mmchip);
> >> +     clk_disable_unprepare(chip->clk);
> >>
> >>       return 0;
> >>  }
> >> @@ -307,6 +311,23 @@ static int xgpio_probe(struct platform_device *pdev)
> >>
> >>       platform_set_drvdata(pdev, chip);
> >>
> >> +     /* Retrieve GPIO clock */
> >> +     chip->clk = devm_clk_get(&pdev->dev, NULL);
> >
> > The driver should use the clock-name documented in the binding to do the
> > clock lookup.
> 
> My idea was to keep the clk name optional since there is only one clock.
> Or do you think we should mandate the name if clk is provided.

I'd make 'clock-names' mandatory if 'clocks' is present. That way there
won't be any trouble if this IP ever consumed additional clocks in the
future.

	Sören
