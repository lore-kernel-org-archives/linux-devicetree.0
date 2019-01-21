From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
Date: Mon, 21 Jan 2019 14:53:36 +0100
Message-ID: <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset fixes the initial pinctrl support added for th g12a SoC
> family, which is mainly around the register regions claimed by the
> driver.
>
> Linus, would it possible for you to provide a tag with these changes to
> Kevin ?

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes

> ATM, we can only use the devices for which the pinmux is already set by
> the bootloader. Enabling the broken pinctrl driver could cause regressions
> in kernelCI. Having a tag, would allow us to start using pinctrl on this
> SoC in this cycle, w/o regression. It would be nice :)

When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
or next (v5.1) with these patches?

Yours,
Linus Walleij
