From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for GPIO subnodes
Date: Wed, 9 Mar 2016 10:53:18 +0700
Message-ID: <CACRpkdaE64pjnr=hn0nMJb-KHx5GhvOSrdhNWJucY+UJVcV18w@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-3-git-send-email-mpa@pengutronix.de>
	<20160223232534.GA29637@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160223232534.GA29637@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Markus Pargmann <mpa@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 6:25 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Feb 23, 2016 at 08:54:48AM +0100, Markus Pargmann wrote:

>> +Optional properties:
>> +- line-name:  The GPIO name. If not present the node name is used.
>
> I'd like to deprecate line-name in favor of the standard property
> for user visible names "label".

This causes some unfortunate confusion wrt internal linux naming.

GPIO lines have two "names"

- The "name" is what the line (pin) is named
  on the chip, or the name of the rail going out on the board, from the chip,
  so it is a producer name.

- Then the GPIO consumers set a second name, called "label"
  (confusingly) so we can see in e.g. debugfs and now also the userspace
  ABI who is using it.

I named these "name" and "consumer" in the userspace ABI, I think
I should take a round and rename it from "label" to "consumer"
also inside the kernel to avoid confusion with this, because "label"
in DT is going to be converted to "name" in the GPIOlib and
then it also has something named "label" and that is another thing,
argh!

Yours,
Linus Walleij
