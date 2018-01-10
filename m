From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 3/4] bcm2835-gpio-exp: Driver for GPIO expander via
 mailbox service
Date: Wed, 10 Jan 2018 05:45:57 +0200
Message-ID: <20180110034557.5sqpbsvt6ly6s2go@tarshish>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <bcac00c71b29c359b59053a30d817a8f17d6731d.1514898134.git.baruch@tkos.co.il>
 <CACRpkdb73jGGRm5OrXLGYSOjMni-NsOwdC7TXH2k+iAEnAvL2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb73jGGRm5OrXLGYSOjMni-NsOwdC7TXH2k+iAEnAvL2g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wed, Jan 03, 2018 at 11:08:15AM +0100, Linus Walleij wrote:
> On Tue, Jan 2, 2018 at 2:19 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > +#include <linux/err.h>
> > +#include <linux/gpio.h>
> 
> Just use
> 
> #include <linux/driver.h>

You mean linux/gpio/driver.h, right?

I still need linux/gpio.h for GPIOF_DIR_*.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
