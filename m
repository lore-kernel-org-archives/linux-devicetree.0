From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
Date: Wed, 25 Oct 2017 09:14:54 +0100
Message-ID: <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508490173.24322.53.camel@aj.id.au>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Michael Welling <mwelling@emacinc.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 07:32:53PM +1030, Andrew Jeffery wrote:
> On Fri, 2017-10-20 at 09:27 +0200, Linus Walleij wrote:
> > I don't see it as helpful to give userspace control over whether the line
> > is persistent or not. It is more reasonable to assume persistance for
> > userspace use cases, don't you think? Whether the system goes to sleep
> > or the gpiochip resets should not make a door suddenly close or the
> > lights in the christmas tree go out, right? I think if the gpiochip supports
> > persistance of any kind, we should try to use it and not have userspace
> > provide flags for that.
> 
> Right. I guess the counter argument to your examples is if the gpio is
> controlling any active process that we don't want to continue if we've
> lost the capacity to monitor some other inputs (some kind of dead-man's 
> switch). But maybe the argument is that should be implemented in the
> kernel anyway?
> 

To me it certainly feels like decisions like this should live in
the kernel, your talking about things that could cause very weird
hardware behaviour if set wrong, so it makes sense to me to have
that responsibility guarded in the kernel.

Thanks,
Charles
