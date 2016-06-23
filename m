From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: sx150x: Update OF configuration
Date: Thu, 23 Jun 2016 10:08:33 +0200
Message-ID: <CACRpkdbWPKbQRnO4v9GcY4BMTbp1ivMO6TFa-u-QpRyyZED0oQ@mail.gmail.com>
References: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com> <20160620155744.GA1419@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160620155744.GA1419@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 20, 2016 at 5:57 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 17, 2016 at 11:51:03AM +0200, Neil Armstrong wrote:

>> +Optional Properties:
>> +- oscio-is-gpo: Boolean, Indicated the oscio pin can be used as additional
>> +             output gpo port.
>> +
>
>> +- pull-up-ports: Array of port numbers which must have pull-up enabled.
>> +- pull-down-ports: Array of port numbers which must have pull-down enabled.
>> +- open-drain-ports: Array of port numbers which must be configured as open-drain,
>> +                     Push-Pull mode is default.
>> +- polarity-invert-ports: Array of port numbers whih port polarity must be inverted.
>
> Seems like these should be done in a common way.
>
> If not, they all need a vendor prefix.

Actually on second look, this takes the sx150 to pin control territory.

I am starting to feel like a move to drivers/pinctrl/* might be warranted.

Neil you worked on other pin controllers IIRC, do you think it would
be much work to make a combined GPIO+pinctrl driver and move
this over to drivers/pinctrl?

I know refactoring across subsystems can be a pain, but at least
I'm maintaining both and happy to help out.

Yours,
Linus Walleij
