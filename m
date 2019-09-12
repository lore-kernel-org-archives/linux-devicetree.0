From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Date: Thu, 12 Sep 2019 15:30:52 +0100
Message-ID: <CACRpkdYcdaoA_D6YyKJuT5bfJ5QE4LWfXF8+R1y01xaWJaJZuQ@mail.gmail.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com> <20190912135806.GA2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912135806.GA2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andriy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, qi-ming.wu@intel.com, yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com, Mathias Nyman <mathias.nyman@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 12, 2019 at 2:58 PM Andriy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
> > Hi Rahul,
> >
> > thanks for your patches!
> >
> > On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
> > <rahul.tanwar@linux.intel.com> wrote:
> >
> > > This series is to add pinctrl & GPIO controller driver for a new SoC.
> > > Patch 1 adds pinmux & GPIO controller driver.
> > > Patch 2 adds the dt bindings document & include file.
> > >
> > > Patches are against Linux 5.3-rc5 at below Git tree:
> > > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> >
> > OK nice, I think you need to include Mika Westerberg on this review
> > as well, because I think he likes to stay on top of all things intel
> > in pin control. (Also included two other Intel folks in Finland who usually
> > take an interest in these things.)
>
> Linus,
> nevertheless I guess you may give your comments WRT device tree use
> (bindings, helpers, etc) along with some basics, (like devm_*()
> [ab]use I just noticed).

I plan to look at the patches per se but right now I don't have much
time because soon there is merge window and kernel summit,
the patches just need to age a little bit like a good wine ;)

Yours,
Linus Walleij
