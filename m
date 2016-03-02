From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] gpio: dt-bindings: Declare gpio-hog optional for
 GPIO subnodes
Date: Wed, 2 Mar 2016 09:41:20 -0600
Message-ID: <20160302154120.GA23716@rob-hp-laptop>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
 <1456214089-13954-3-git-send-email-mpa@pengutronix.de>
 <20160223232534.GA29637@rob-hp-laptop>
 <1813679.JaFRxta3v8@adelgunde>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1813679.JaFRxta3v8@adelgunde>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 08:01:47AM +0100, Markus Pargmann wrote:
> Hi,
> 
> On Tuesday, February 23, 2016 05:25:34 PM Rob Herring wrote:
> > On Tue, Feb 23, 2016 at 08:54:48AM +0100, Markus Pargmann wrote:
> > > Reuse the GPIO hogging DT bindings for more generic specifications of
> > > the GPIO. Therefore gpio-hog is declared optional.
> > 
> > Before extending this binding further, we need to consider other cases 
> > that have been discussed recently such as gpio switch binding and 
> > whether it should fit in with this.
> 
> I tried to discuss my ideas and issues with the gpio-switch bindings
> already some time ago, unfortunately the discussion didn't proceed:
> 	http://thread.gmane.org/gmane.linux.kernel/2100574

We need to revive that. I do plan to discuss this with Linus F2F next 
week.

> > My biggest issue with this binding is whether the DT changes because 
> > today we don't have a driver for some GPIO line and tomorrow we do.
> 
> This patch is just about defining that we can give GPIO lines names. In
> the best case this name refers to the line name on the schematic. In the
> worst case it is some arbitrary name. In both cases it should not
> influence any driver that is trying to use this GPIO.

No issues with adding this information. The question is just how should 
all this fit together (line names, simple functions (e.g. switches), and 
initialization). The overall structure needs to extendable. As Linus 
said, we need a proposal that addresses all these issues.

> gpio-hogging indeed could cause problems for future drivers as these
> GPIOs are not available for any drivers. But gpio-hogging is already
> defined for quite some time in the DT bindings.

That doesn't mean we can't decide some bindings were a bad idea and move 
towards something new.

> Also I would assume that for most new drivers new DT bindings are
> created so that it already requires a DT update together with a kernel
> update.

Frequently that may be right. However, I think having a temporary 
binding only encourages to not fully define their h/w. Think of the case 
where you have a single DTB and support multiple OSs (or different 
versions). The DTB would have to work with both as one OS may require 
gpio-hogs and the other may require a specific driver. That should be 
possible to do. Requiring removing the gpio-hog to add a specific 
binding is a problem. AIUI, a hog will prevent any other user in the 
kernel. I think that is backwards in that a hog should only provide some 
default configuration/use. 

Rob
