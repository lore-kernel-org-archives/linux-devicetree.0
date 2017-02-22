From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 3/3] mfd: wm831x: Add device tree binding document
Date: Wed, 22 Feb 2017 16:09:49 +0000
Message-ID: <20170222160949.GC2742@localhost.localdomain>
References: <1486984514-29749-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1486984514-29749-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170222151502.njwsimmttah3tv4f@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170222151502.njwsimmttah3tv4f@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: lee.jones@linaro.org, mark.rutland@arm.com, linus.walleij@linaro.org, gnurou@gmail.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 09:15:02AM -0600, Rob Herring wrote:
> On Mon, Feb 13, 2017 at 11:15:14AM +0000, Charles Keepax wrote:
> > This is just a very simple initial binding, supporting only registering
> > the chip and the GPIOs. More features will be added as support for
> > device tree in the driver is expanded.
> 
> Please make the binding as complete as you can. You don't have to have 
> driver side support in place. Doesn't have to be everything, but at 
> least everything you know you will need.
> 

I am happy to flush the binding out with a bit more detail,
although the GPIOs are actually all I need to use at the moment.
I will send a new revision with some more detail. Do we normally
do anything to mark the bits of the binding that are currently
un-implemented?

Thanks,
Charles
