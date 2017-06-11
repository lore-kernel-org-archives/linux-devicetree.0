From: Oleksij Rempel <ore@pengutronix.de>
Subject: Re: [PATCH v1 1/1] gpio: of: provide option generic property for
 initial line states
Date: Sun, 11 Jun 2017 08:19:19 +0200
Message-ID: <20170611061919.jsbc7x67ut4segj5@pengutronix.de>
References: <20170609141622.21502-1-o.rempel@pengutronix.de>
 <CAL_JsqJeSCN88JnVnofb2Ncy4bDyXiKQbLniHmvbE4j854ZePA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJeSCN88JnVnofb2Ncy4bDyXiKQbLniHmvbE4j854ZePA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, barebox@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Jun 09, 2017 at 10:41:30AM -0500, Rob Herring wrote:
> On Fri, Jun 9, 2017 at 9:16 AM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > This property is needed for barebox or may be other bootloaders
> > to set proper gpio configuration as early as possible.
> >
> > This example is mainly based on "lines-initial-states" property
> > from this binding documentation:
> > Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> 
> Don't we have a binding for this already based on gpio-hogs.

Markus Pargmann was working on this topic before and suddenly was not
able to finish it.
I found only some not finished discussions and no code or documentation
in linux kernel upstream.

So far, I was able to find fallowing patches and discussions:
patch 23.08.2015, last comment 11.05.2017:
https://patchwork.kernel.org/patch/7096721/

patch 23.02.2016, last comment 09.03.2016:
https://patchwork.ozlabs.org/patch/586743/

Since there was objections about node-like design for gpio-initval, I
provided an array property, which is similar to initval properties already used
for different other device nodes. For example:

Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
qcom,ath10k-calibration-data

Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
lines-initial-states

Please fixme if I miss something.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
