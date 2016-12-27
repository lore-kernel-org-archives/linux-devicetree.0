From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/5] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Tue, 27 Dec 2016 23:16:48 +0100
Message-ID: <CACRpkdY-Hn7eZVKORgDF7kSFSc7PrAPdENscjkj94WtWJPXBww@mail.gmail.com>
References: <20161220073551.28522-1-andrew@aj.id.au> <20161220073551.28522-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161220073551.28522-3-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Joel Stanley <joel@jms.id.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2016 at 8:35 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> The System Control Unit IP block in the Aspeed SoCs is typically where
> the pinmux configuration is found, but not always. A number of pins
> depend on state in one of LPC Host Control (LHC) or SoC Display
> Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have the
> means to adjust these as necessary.
>
> We use syscon to cast a regmap over the GFX and LPC blocks, which is
> used as an arbitration layer between the relevant driver and the pinctrl
> subsystem. The regmaps are then exposed to the SoC-specific pinctrl
> drivers by phandles in the devicetree, and are selected during a mux
> request by querying a new 'ip' member in struct aspeed_sig_desc.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Patch applied, adding Rob's ack in the process.

Yours,
Linus Walleij
