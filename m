From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: mediatek: add driver for MT7621
Date: Fri, 29 Jun 2018 21:30:36 +0200
Message-ID: <CAMhs-H_2_muvbZsCpM7WkgBYhv1CW=2o4UkVuUm8iuyvG75=jA@mail.gmail.com>
References: <1530276212-18376-2-git-send-email-sergio.paracuellos@gmail.com>
 <201806300035.7k8QGAO8%fengguang.wu@intel.com>
 <CAMhs-H_EmNoFQhiLzxT07=bzO7np0ZPvsZon1a8Y-MCp+r977A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAMhs-H_EmNoFQhiLzxT07=bzO7np0ZPvsZon1a8Y-MCp+r977A@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: kbuild test robot <lkp@intel.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, driverdev-devel@linuxdriverproject.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, kbuild-all@01.org, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 29, 2018 at 6:52 PM, Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Fri, Jun 29, 2018 at 6:43 PM, kbuild test robot <lkp@intel.com> wrote:
>> Hi Sergio,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on gpio/for-next]
>> [also build test ERROR on v4.18-rc2 next-20180629]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Sergio-Paracuellos/gpio-mediatek-driver-for-gpio-chip-in-MT7621-SoC/20180629-225420
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
>> config: x86_64-randconfig-s0-06292230 (attached as .config)
>> compiler: gcc-6 (Debian 6.4.0-9) 6.4.0 20171026
>> reproduce:
>>         # save the attached .config to linux build tree
>>         make ARCH=x86_64
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
>>>> drivers/gpio/gpio-mt7621.c:221:10: error: 'struct gpio_chip' has no member named 'of_node'
>>      rg->chip.of_node = node;
>>              ^
>
> Should I have to add #ifdef CONFIG_OF_GPIO for this line? Is kind of
> ugly hack... Does exist another way to fix this?
>

Ah, this is v2 where the Makefile was wrong... I though it was v3. I
think we can ignore this and see what happen with likely correct v3.

Best regards,
    Sergio Paracuellos

> Thanks,
>     Sergio Paracuellos
>
>>
>> vim +221 drivers/gpio/gpio-mt7621.c
>>
>>    207
>>    208  static int
>>    209  mediatek_gpio_bank_probe(struct platform_device *pdev,
>>    210                           struct device_node *node, int bank)
>>    211  {
>>    212          struct mtk_data *gpio = dev_get_drvdata(&pdev->dev);
>>    213          struct mtk_gc *rg;
>>    214          void __iomem *dat, *set, *ctrl, *diro;
>>    215          int ret;
>>    216
>>    217          rg = &gpio->gc_map[bank];
>>    218          memset(rg, 0, sizeof(*rg));
>>    219
>>    220          spin_lock_init(&rg->lock);
>>  > 221          rg->chip.of_node = node;
>>    222          rg->bank = bank;
>>    223          rg->chip.label = mediatek_gpio_bank_name(rg->bank);
>>    224
>>    225          dat = gpio->gpio_membase + GPIO_REG_DATA + (rg->bank * GPIO_BANK_WIDE);
>>    226          set = gpio->gpio_membase + GPIO_REG_DSET + (rg->bank * GPIO_BANK_WIDE);
>>    227          ctrl = gpio->gpio_membase + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_WIDE);
>>    228          diro = gpio->gpio_membase + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_WIDE);
>>    229
>>    230          ret = bgpio_init(&rg->chip, &pdev->dev, 4,
>>    231                           dat, set, ctrl, diro, NULL, 0);
>>    232          if (ret) {
>>    233                  dev_err(&pdev->dev, "bgpio_init() failed\n");
>>    234                  return ret;
>>    235          }
>>    236
>>    237          ret = devm_gpiochip_add_data(&pdev->dev, &rg->chip, gpio);
>>    238          if (ret < 0) {
>>    239                  dev_err(&pdev->dev, "Could not register gpio %d, ret=%d\n",
>>    240                          rg->chip.ngpio, ret);
>>    241                  return ret;
>>    242          }
>>    243
>>    244          if (gpio->gpio_irq) {
>>    245                  /*
>>    246                   * Manually request the irq here instead of passing
>>    247                   * a flow-handler to gpiochip_set_chained_irqchip,
>>    248                   * because the irq is shared.
>>    249                   */
>>    250                  ret = devm_request_irq(&pdev->dev, gpio->gpio_irq,
>>    251                                         mediatek_gpio_irq_handler, IRQF_SHARED,
>>    252                                         rg->chip.label, &rg->chip);
>>    253
>>    254                  if (ret) {
>>    255                          dev_err(&pdev->dev, "Error requesting IRQ %d: %d\n",
>>    256                                  gpio->gpio_irq, ret);
>>    257                          return ret;
>>    258                  }
>>    259
>>    260                  mediatek_gpio_irq_chip.name = rg->chip.label;
>>    261                  ret = gpiochip_irqchip_add(&rg->chip, &mediatek_gpio_irq_chip,
>>    262                                             0, handle_simple_irq, IRQ_TYPE_NONE);
>>    263                  if (ret) {
>>    264                          dev_err(&pdev->dev, "failed to add gpiochip_irqchip\n");
>>    265                          return ret;
>>    266                  }
>>    267
>>    268                  gpiochip_set_chained_irqchip(&rg->chip, &mediatek_gpio_irq_chip,
>>    269                                               gpio->gpio_irq, NULL);
>>    270          }
>>    271
>>    272          /* set polarity to low for all gpios */
>>    273          mtk_gpio_w32(rg, GPIO_REG_POL, 0);
>>    274
>>    275          dev_info(&pdev->dev, "registering %d gpios\n", rg->chip.ngpio);
>>    276
>>    277          return 0;
>>    278  }
>>    279
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
