From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 7/8] pinctrl: aspeed-g4: Add mux configuration for all pins
Date: Thu, 29 Sep 2016 10:24:26 +0930
Message-ID: <CACPK8XdmD9mOYDAw-A-X2X2=nJYpkEJkncawwhVeuhn=-KQajA@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e0d8fa6cd444972e6f048f98da98f0439e6ca39b.1474986045.git-series.andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Timothy Pearson <tpearson@raptorengineering.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The patch introducing the g4 pinctrl driver implemented a smattering of
> pins to flesh out the implementation of the core and provide bare-bones
> support for some OpenPOWER platforms. Now, update the bindings document
> to reflect the complete functionality and implement the necessary pin
> configuration tables in the driver.
>
> Cc: Timothy Pearson <tpearson@raptorengineering.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>
