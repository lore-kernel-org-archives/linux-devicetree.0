From: Lars Poeschel <larsi@wh2.tu-dresden.de>
Subject: Re: [PATCH 1/2] gpio: mcp23s08: rename the device tree property
Date: Sun, 25 Aug 2013 12:06:41 +0200
Message-ID: <201308251206.41764.larsi@wh2.tu-dresden.de>
References: <1377165378-9589-1-git-send-email-larsi@wh2.tu-dresden.de> <CACRpkdZMsBynLohhNw=XyzpYns9E8QVksVJYkv3dcRJ2JHWLnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZMsBynLohhNw=XyzpYns9E8QVksVJYkv3dcRJ2JHWLnA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Lars Poeschel <poeschel@lemonage.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Arnd Bergmann <arnd@arndb.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Am Freitag 23 August 2013, 21:10:00 schrieb Linus Walleij:
> On Thu, Aug 22, 2013 at 11:56 AM, Lars Poeschel <larsi@wh2.tu-dresden.de> 
wrote:
> > From: Lars Poeschel <poeschel@lemonage.de>
> > 
> > The device tree property should be more descriptive.
> > microchip seems more reasonable than mcp. As there are no
> > in tree users of this property, so the rename can still be
> > done without pain.
> > 
> > Signed-off-by: Lars Poeschel <poeschel@lemonage.de>
> 
> So do I apply this to the GPIO tree now or what?
> 
> Are the DT custodians happy?

No Linus, do not take this.
There will be a new version.

Thanks,
Lars
