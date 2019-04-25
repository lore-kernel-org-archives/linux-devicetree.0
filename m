From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 4/5] pinctrl: Add pinctrl support for BM1880 SoC
Date: Thu, 25 Apr 2019 12:58:25 +0530
Message-ID: <20190425072825.GA31116@Mani-XPS-13-9360>
References: <20190424120224.22660-1-manivannan.sadhasivam@linaro.org>
 <20190424120224.22660-5-manivannan.sadhasivam@linaro.org>
 <CACRpkdZJweCPs096r6LJJTUSmPYViPDV_rBJ8NWbHzx96xEfsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZJweCPs096r6LJJTUSmPYViPDV_rBJ8NWbHzx96xEfsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, haitao.suo@bitmain.com, darren.tsao@bitmain.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Thu, Apr 25, 2019 at 09:09:28AM +0200, Linus Walleij wrote:
> On Wed, Apr 24, 2019 at 2:03 PM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> 
> > Add pinctrl support for Bitmain BM1880 SoC. The driver only handles
> > pinmuxing as the SoC is not capable of handling pinconf.
> >
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Patch applied, because there is no reason to hold back this clean
> and important infrastructure for the platform. Minor nits can be
> considered for follow-up patches.
> 

Thanks a lot! I will follow up with the cleanup patches.

> > +config PINCTRL_BM1880
> > +       bool "Bitmain BM1880 Pinctrl driver"
> > +       depends on ARCH_BITMAIN
> 
> Could we do:
> 
> depends on ARCH_BITMAIN || COMPILE_TEST
> 
> to get some compiler coverage?
> 

Sure, will do.

> > +       select PINMUX
> > +       help
> > +         Pinctrl driver for Bitmain BM1880 SoC.
> 
> I think the platform always want this driver enabled, so I would either
> select it from arch/arm/mach-foo/Kconfig or add a row like this:
> 
> default ARCH_BITMAIN
> 
> Either defaulting it to 'y'.
> 

Makes sense! Will add ARCH_BITMAIN default to this Kconfig.

> > +       F_nand, F_spi, F_emmc, F_sdio, F_eth0, F_pwm0, F_pwm1, F_pwm2,
> > +       F_pwm3, F_pwm4, F_pwm5, F_pwm6, F_pwm7, F_pwm8, F_pwm9, F_pwm10,
> > +       F_pwm11, F_pwm12, F_pwm13, F_pwm14, F_pwm15, F_pwm16, F_pwm17,
> > +       F_pwm18, F_pwm19, F_pwm20, F_pwm21, F_pwm22, F_pwm23, F_pwm24,
> > +       F_pwm25, F_pwm26, F_pwm27, F_pwm28, F_pwm29, F_pwm30, F_pwm31,
> > +       F_pwm32, F_pwm33, F_pwm34, F_pwm35, F_pwm36, F_pwm37, F_i2c0, F_i2c1,
> 
> 
> Wow 38 individual PWMs. This platform must really have good use for PWM.
> I wonder why they hardcoded so many of them into the hardware...
> 

I don't know the reasoning behind it. This SoC is targeted at AI/ML
usecase, and there are 4 PWM modules in it. Maybe they tried to integrate
motor control usecase with these PWM modules? There is also a RISC-V core
in this SoC, which can perform some real time offloading.

> > +static int __init bm1880_pinctrl_init(void)
> > +{
> > +       return platform_driver_register(&bm1880_pinctrl_driver);
> > +}
> > +arch_initcall(bm1880_pinctrl_init);
> 
> driver_initcall() also known as module_builtin_driver() doesn't work?
> 

It will work, but I want this driver to be probed very soon.

> Do you plan to add GPIO (and interrupts) and pin config to this driver as well?
> 

GPIO support is handled by Designware IP. I have already added DTS
support for it. And you acked those 2 patches ;-)

For pinconfig, sadly there is nothing I can see in the vendor kernel so
assumed that the SoC doesn't support it (yes it is wierd). I will ask
Bitmain folks to be sure.

Thanks,
Mani

> Yours,
> Linus Walleij
