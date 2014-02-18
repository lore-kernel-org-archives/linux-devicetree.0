From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v4] gpio: Driver for SYSCON-based GPIOs
Date: Tue, 18 Feb 2014 15:25:20 -0800
Message-ID: <20140218232520.GA22492@quad.lixom.net>
References: <1389632203-22806-1-git-send-email-shc_work@mail.ru>
 <CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaVn0iNFYKE3HXWxnb4iCJorF0HSVG4Uvz8Q18SiF5PUQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexander Shiyan <shc_work@mail.ru>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 30, 2014 at 02:54:36PM +0100, Linus Walleij wrote:
> On Mon, Jan 13, 2014 at 5:56 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
> 
> > SYSCON driver was designed for using memory areas (registers)
> > that are used in several subsystems. There are systems (CPUs)
> > which use bits in one register for various purposes and thus
> > should be handled by various kernel subsystems. This driver
> > allows you to use the individual SYSCON bits as GPIOs.
> > ARM CLPS711X SYSFLG1 input lines has been added as first user
> > of this driver.
> >
> > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> 
> Oh the pain. I am so ambivalent of this patch as it obfuscates
> some stuff about the hardware that the driver should know,
> while at the same time being elegant in a way.
> 
> What does the ARM SoC maintainers think about this approach?
> 
> Arnd, Olof, Kevin: is this something you'd like to see deployed?

I think the binding needs to be adjusted -- syscon has nothing to do with
the binding, that's a Linux construct.

Really, if this is rephrased it becomes much more clear that this is a useful
driver:

CLPS711X implements a few GPIO lines in a register area that is shared with
other system registers. This is a driver for those GPIO lines, implemented
using the shared syscon infrastructure in the kernel.

And then take out syscon from the name of the driver (and the binding).

If we have more drivers like these down the road we can make a common shared
binding, but until then I don't think there's much point in it.


-Olof
