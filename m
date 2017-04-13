From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
Date: Thu, 13 Apr 2017 10:15:13 +0100
Message-ID: <20170413091513.GA1878@localhost.localdomain>
References: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20170410201758.lobmtzxt2jgcwwvc@rob-hp-laptop>
 <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491903267.4826.8.camel@rf-debian.wolfsonmicro.main>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Cc: Rob Herring <robh@kernel.org>, linus.walleij@linaro.org, lee.jones@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, Apr 11, 2017 at 10:34:27AM +0100, Richard Fitzgerald wrote:
> On Mon, 2017-04-10 at 15:17 -0500, Rob Herring wrote:
> > On Fri, Apr 07, 2017 at 01:38:44PM +0100, Charles Keepax wrote:
> > > The Arizona devices only maintain the state of output GPIOs whilst the
> > > CODEC is active, this can cause issues if the CODEC suspends whilst
> > > something is relying on the state of one of its GPIOs. However, in
> > > many systems the CODEC GPIOs are used for audio related features
> > > and thus the state of the GPIOs is unimportant whilst the CODEC is
> > > suspended. Often keeping the CODEC resumed in such a system would
> > > incur a power impact that is unacceptable.
> > > 
> > > Add a flag through the second cell of the GPIO specifier in device
> > > tree, to allow the user to select whether a GPIO being configured as
> > > an output should keep the CODEC resumed.
> > 
> > If the whole codec can't be suspended, why does this need to be per 
> > GPIO? You could just have a single boolean property.
> > 
> 
> Three reasons I can think of:
> 
> 1) The GPIO binding already provides for passing extra information
> through the binding ("Exact meaning of each specifier cell is controller
> specific" as it says in the main gpio binding doc) so why add yet
> another custom property to do it?
> 
> 2) Doing it through the gpio means that if ultimately the child DT node
> that is using it gets disabled (status="disabled") or that driver isn't
> in use the codec will be able to go to sleep. That won't happen with a
> brute-force "big lock".
> 
> 3) The codec only has to be kept awake while any such GPIO is actually
> in use. See (2)
> 

Yeah option 3 is the primary issue here, we only want to keep the
CODEC enabled whilst specific GPIOs are in use. As GPIOs can be
dynamically requested/released by things in the kernel we want to
know which GPIOs require the CODEC to be kept alive. Also in the
future one might be tempted to add maintain whilst high and
maintain whilst low options for lines with pulls on them to
further optimise power.

Thanks,
Charles
