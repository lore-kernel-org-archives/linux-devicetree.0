From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset GPIO
Date: Mon, 10 Jun 2019 00:32:52 +0200
Message-ID: <CAFBinCB3SLoVOt_jy6-OW=2=5671o+bXQwMn006u56gHLTOpBw@mail.gmail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com> <20190609204510.GB8247@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609204510.GB8247@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linus.walleij@linaro.org, bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Sun, Jun 9, 2019 at 10:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Patch #1 and #4 are minor cleanups which follow the boyscout rule:
> > "Always leave the campground cleaner than you found it."
>
> > I
> > am also looking for suggestions how to handle these cross-tree changes
> > (patch #2 belongs to the linux-gpio tree, patches #1, 3 and #4 should
> > go through the net-next tree. I will re-send patch #5 separately as
> > this should go through Kevin's linux-amlogic tree).
>
> Hi Martin
>
> Patches 1 and 4 don't seem to have and dependencies. So i would
> suggest splitting them out and submitting them to netdev for merging
> independent of the rest.
OK, I will do that but after the GPIO changes are applied because only
then I can get rid of that "np" variable

> Linus can probably create a stable branch with the GPIO changes, which
> David can pull into net-next, and then apply the stmmac changes on
> top.
let's go this way since Linus is happy with that route also.
I'll re-spin v2 tomorrow


Martin
