From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/5] gpio: use new gpio_set_config() helper in more
 places
Date: Tue, 26 Mar 2019 22:04:03 +0100
Message-ID: <20190326220403.63e0b533@windsurf>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
        <20190207162859.26252-4-thomas.petazzoni@bootlin.com>
        <20190316014352.GA6124@roeck-us.net>
        <20190316144519.07805478@windsurf>
        <20190326200302.GA15712@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326200302.GA15712@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>
List-Id: devicetree@vger.kernel.org

Hello Guenter,

On Tue, 26 Mar 2019 13:03:02 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> > I'll have a look. In the mean time, I'm fine with the patch being
> > reverted.
> 
> The problem is still seen in the latest kernel as of last night, and
> I did not see any further activities. Should I send a revert request ?

Sorry for not replying. I have not had the chance to investigate this
further due to lack of time. Linus Walleij initially suggested to use
gpio_set_config() in more places, but that doesn't to work as expected.

A revert patch has already been sent:

  https://lore.kernel.org/lkml/20190326044954.18671-1-andrew@aj.id.au/

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
