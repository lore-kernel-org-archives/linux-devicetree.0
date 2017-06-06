From: Baolin Wang <baolin.wang@spreadtrum.com>
Subject: Re: [PATCH v2 2/2] pinctrl: sprd: Add Spreadtrum pin control driver
Date: Tue, 6 Jun 2017 15:40:24 +0800
Message-ID: <20170606074023.GB11506@spreadtrum.com>
References: <ee404d190712f5826662c7b079caf75dba455145.1496664241.git.baolin.wang@spreadtrum.com>
 <201706060334.Gr0opyQJ%fengguang.wu@intel.com>
 <20170606072055.GA11506@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170606072055.GA11506@spreadtrum.com>
Sender: linux-gpio-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, linus.walleij@linaro.org, mark.rutland@arm.com, robh+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Hi,

O 二,  6月 06, 2017 at 03:20:55下午 +0800, Baolin Wang wrote:
> Hi,
> 
> O 二,  6月 06, 2017 at 03:07:22上午 +0800, kbuild test robot wrote:
> > Hi Baolin,
> > 
> > [auto build test WARNING on robh/for-next]
> > [also build test WARNING on v4.12-rc4]
> > [cannot apply to pinctrl/devel next-20170605]
> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/DT-pinctrl-Add-binding-documentation-for-Spreadtrum-pin-controller/20170605-222351
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > config: i386-allmodconfig (attached as .config)
> > compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> > reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=i386 
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_pinconf_set':
> > >> drivers/pinctrl/sprd/pinctrl-sprd.c:484:4: warning: case value '129' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_SLEEP_MODE:
> >        ^~~~
> >    drivers/pinctrl/sprd/pinctrl-sprd.c:497:4: warning: case value '131' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_INPUT_SLEEP:
> >        ^~~~
> >    drivers/pinctrl/sprd/pinctrl-sprd.c:502:4: warning: case value '132' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_OUTPUT_SLEEP:
> >        ^~~~
> >    drivers/pinctrl/sprd/pinctrl-sprd.c:534:4: warning: case value '130' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_PULLUP:
> >        ^~~~
> >    drivers/pinctrl/sprd/pinctrl-sprd.c:543:4: warning: case value '133' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_PULLUP_SLEEP:
> >        ^~~~
> >    drivers/pinctrl/sprd/pinctrl-sprd.c:548:4: warning: case value '134' not in enumerated type 'enum pin_config_param' [-Wswitch]
> >        case SPRD_PIN_CONFIG_PULLDOWN_SLEEP:
> >        ^~~~
> 
> From kernel doc for 'enum pin_config_param', user need use
> PIN_CONFIG_END + 1 as the base offset if the user need to
> pass in custom configuration to the pin controller. So I do
> not think I need to fix this warning. Thanks.

Sorry for misunderstanding the warning, I've found the reason
of the warning and I will fix it in next version. Thanks.

> 
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
