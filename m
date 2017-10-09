From: Lars Poeschel <poeschel@lemonage.de>
Subject: Re: [PATCH] dt-bindings: pinctrl: Move mcp23s08 from gpio
Date: Mon, 09 Oct 2017 11:39:02 +0200
Message-ID: <8063886.6te7U6k3td@lem-wkst-02>
References: <20171005075002.9901-1-poeschel@lemonage.de> <CACRpkdY=r8XBqHKrVeZ34jR8FJM-zmOUxCSMhEROc6fOjfwX-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY=r8XBqHKrVeZ34jR8FJM-zmOUxCSMhEROc6fOjfwX-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 8, 2017 at 01:58:52 CEST Linus Walleij wrote:

CCing-in Sebastian Reichel who did the move to pinctrl and pinctrl support as 
well.

> On Thu, Oct 5, 2017 at 9:50 AM, Lars Poeschel <poeschel@lemonage.de> wrote:
> > The mcp23s08 driver was moved from gpio to pinctrl. This moves it's
> > devicetree binding doc as well. So driver and binding doc are in sync
> > again.
> > 
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> 
> Are there no new references to the generic pin control binding
> needed as well?

Well, yes there is one: As far as I can see it supports the bias-pull-up 
property.
My first intention was to have the doc as we have it in the right place, but 
you are right: It needs an update as well. I can do this, but Sebastian, 
please keep an eye on that.

As there are already patches depending on this patch (https://marc.info/?
l=linux-gpio&m=150726650325394&w=4) I would suggest, that you pull in this 
patch as is and I do the little update on the doc as a seperate patch.

Regards,
Lars
