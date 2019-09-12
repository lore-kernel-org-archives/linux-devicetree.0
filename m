From: Andriy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Date: Thu, 12 Sep 2019 16:58:06 +0300
Message-ID: <20190912135806.GA2680@smile.fi.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, qi-ming.wu@intel.com, yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com, Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
> Hi Rahul,
> 
> thanks for your patches!
> 
> On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
> <rahul.tanwar@linux.intel.com> wrote:
> 
> > This series is to add pinctrl & GPIO controller driver for a new SoC.
> > Patch 1 adds pinmux & GPIO controller driver.
> > Patch 2 adds the dt bindings document & include file.
> >
> > Patches are against Linux 5.3-rc5 at below Git tree:
> > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> 
> OK nice, I think you need to include Mika Westerberg on this review
> as well, because I think he likes to stay on top of all things intel
> in pin control. (Also included two other Intel folks in Finland who usually
> take an interest in these things.)

Linus,
nevertheless I guess you may give your comments WRT device tree use
(bindings, helpers, etc) along with some basics, (like devm_*()
[ab]use I just noticed).

-- 
With Best Regards,
Andy Shevchenko
