From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Tue, 25 Jul 2017 14:06:32 +0200
Message-ID: <20170725120632.GA27516@localhost>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com>
 <20170719131640.GA2533@localhost>
 <596F73BC.1000305@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <596F73BC.1000305@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Johan Hovold <johan@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 08:29:08PM +0530, Laxman Dewangan wrote: 
> >> Good that you found this and fixed it before someone git hurt.
> > Well, while decoupling single-endedness from polarity was the right
> > thing to do, this change did actually break the DT binary interface.
> >
> > If you have an old compiled dtb whose source used GPIO_OPEN_DRAIN, you
> > now instead get *open-source* behaviour on 4.12:
> >
> > 	GPIO_OPEN_DRAIN = GPIO_SINGLE_ENDED | GPIO_ACTIVE_LOW
> > 	
> > 		=> active-low, but *open source*
> >
> > while if you recompile that source against 4.12 you do get the expected
> > open-drain behaviour, but now with inverted polarity:
> >
> > 	GPIO_OPEN_DRAIN = GPIO_SINGLE_ENDED | GPIO_LINE_OPEN_DRAIN
> > 	
> > 		=> open drain, but *active high*
> >
> > requiring the device tree to be updated by specifying
> >
> > 	(GPIO_OPEN_DRAIN | GPIO_ACTIVE_LOW)
> >
> > I guess the latter is fine, even if it is likely to amount to a fair bit
> > of debugging world wide.
> >
> > Perhaps all this can still be avoided by adding further flags and
> > deprecating others before people start migrating to 4.12 (after all,
> > GPIO_OPEN_DRAIN has been around since 4.4 even if there are no in-kernel
> > users).
> >
> > Or we accept the binary interface breakage -- it probably is pretty rare
> > that people update the kernel without updating the dtb. I can just
> > update the dts on the system that broke for me, and hopefully anyone
> > debugging this issue while updating to 4.12 will find this mail quickly.
> >
> 
> Yes, it breaks the older DTS with new kernel. However,  this point was 
> discussed before sending patch. As there was no user in the mainline DTs 
> for these macros, we made change.

These are generic gpio flags that can be used with a multitude of
devices (e.g. regulators, reset-signals for all sorts of ICs, etc.), and
whether there are any in-kernel users (dts) should probably not carry
much weight.

Some people are still stuck with 4.4 or 4.9 and it may still be a while
before they update to, say, the next LTS kernel (4.13) and get bitten by
this.

Thanks,
Johan
