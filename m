From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] pinctrl: meson: g12a fixes
Date: Fri, 8 Feb 2019 14:57:33 +0100
Message-ID: <CACRpkdb4105RwXhiyVd1dz5mjYO_u6CxTbCySbqUWBv=yhF1qg@mail.gmail.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com> <CACRpkdb7pje9mrgOQoiWTRxGQC8xsOvJ9a8PCguM807unPtpCg@mail.gmail.com>
 <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a434c3b1c55a1b5a1485adc29cfe26b45131a936.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 4:36 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Mon, 2019-01-21 at 14:53 +0100, Linus Walleij wrote:
> > On Thu, Jan 17, 2019 at 11:23 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> > > This patchset fixes the initial pinctrl support added for th g12a SoC
> > > family, which is mainly around the register regions claimed by the
> > > driver.
> > >
> > > Linus, would it possible for you to provide a tag with these changes to
> > > Kevin ?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-meson-fixes
> >
> > > ATM, we can only use the devices for which the pinmux is already set by
> > > the bootloader. Enabling the broken pinctrl driver could cause regressions
> > > in kernelCI. Having a tag, would allow us to start using pinctrl on this
> > > SoC in this cycle, w/o regression. It would be nice :)
> >
> > When you say "this cycle" do you mean I should target fixes (v5.0-rcN)
> > or next (v5.1) with these patches?
>
> I was referring to the 5.1 release but it is a good question, I did not really
> think about 5.0.
>
> Those changes are mainly fixes, so guess it could go in the 5.0 but support
> for this SoC is still in its early stages, so either way is fine by me.
>
> Whatever is simpler for you I guess ;)

I already merged it for devel and other stuff on top so it will be for v5.1
as it looks now.

Yours,
Linus Walleij
