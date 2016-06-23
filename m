From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] gpio: sx150x: Update OF configuration
Date: Thu, 23 Jun 2016 10:18:02 +0200
Message-ID: <576B9B3A.2070808@baylibre.com>
References: <1466157063-10955-1-git-send-email-narmstrong@baylibre.com>
 <20160620155744.GA1419@rob-hp-laptop>
 <CACRpkdbWPKbQRnO4v9GcY4BMTbp1ivMO6TFa-u-QpRyyZED0oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbWPKbQRnO4v9GcY4BMTbp1ivMO6TFa-u-QpRyyZED0oQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 06/23/2016 10:08 AM, Linus Walleij wrote:
> On Mon, Jun 20, 2016 at 5:57 PM, Rob Herring <robh@kernel.org> wrote:
>> On Fri, Jun 17, 2016 at 11:51:03AM +0200, Neil Armstrong wrote:
> 
>>> +Optional Properties:
>>> +- oscio-is-gpo: Boolean, Indicated the oscio pin can be used as additional
>>> +             output gpo port.
>>> +
>>
>>> +- pull-up-ports: Array of port numbers which must have pull-up enabled.
>>> +- pull-down-ports: Array of port numbers which must have pull-down enabled.
>>> +- open-drain-ports: Array of port numbers which must be configured as open-drain,
>>> +                     Push-Pull mode is default.
>>> +- polarity-invert-ports: Array of port numbers whih port polarity must be inverted.
>>
>> Seems like these should be done in a common way.
>>
>> If not, they all need a vendor prefix.
> 
> Actually on second look, this takes the sx150 to pin control territory.
> 
> I am starting to feel like a move to drivers/pinctrl/* might be warranted.
> 
> Neil you worked on other pin controllers IIRC, do you think it would
> be much work to make a combined GPIO+pinctrl driver and move
> this over to drivers/pinctrl?
> 
> I know refactoring across subsystems can be a pain, but at least
> I'm maintaining both and happy to help out.
> 
> Yours,
> Linus Walleij
> 

Hi Linus,

Yes, it would be good to have it as a gpio+pinctrl with only pinconf, but it would show
the way on how to support external GPIO expanders using the pinctrl framework.

But it is quite challenging and needs quite some work, and actually the current state of the driver is that the OF is broken.

Would you agree to :
 - Push the minimal code to make OF work again, at least for 4.7 ?
 - Engage complete refactoring to transform it in a real gpio+pinctrl driver ?

For the dt-bindings properties, I can add the vendor prefixes ASAP.

Thanks,
Neil
