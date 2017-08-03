From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/1] gpio: core: Decouple open drain/source flag with
 active low/high
Date: Thu, 3 Aug 2017 14:14:30 +0200
Message-ID: <20170803121430.GS30136@localhost>
References: <1491485752-28030-1-git-send-email-ldewangan@nvidia.com>
 <CACRpkdaK1ut-1=NtqqL15QuQV+P2n8XidNqVspOfu+7x=XMvog@mail.gmail.com>
 <20170719131640.GA2533@localhost>
 <596F73BC.1000305@nvidia.com>
 <CACRpkdYqj68NpqedyPY2P6o_-JcVaw=4xzh7ccw6t-2gcy5sqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYqj68NpqedyPY2P6o_-JcVaw=4xzh7ccw6t-2gcy5sqg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 10:14:32AM +0200, Linus Walleij wrote:
> On Wed, Jul 19, 2017 at 4:59 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> > On Wednesday 19 July 2017 06:55 PM, Johan Hovold wrote:
> 
> >> I guess the latter is fine, even if it is likely to amount to a fair bit
> >> of debugging world wide.
> >>
> >> Perhaps all this can still be avoided by adding further flags and
> >> deprecating others before people start migrating to 4.12 (after all,
> >> GPIO_OPEN_DRAIN has been around since 4.4 even if there are no in-kernel
> >> users).
> >>
> >> Or we accept the binary interface breakage -- it probably is pretty rare
> >> that people update the kernel without updating the dtb. I can just
> >> update the dts on the system that broke for me, and hopefully anyone
> >> debugging this issue while updating to 4.12 will find this mail quickly.
> >
> > Yes, it breaks the older DTS with new kernel. However,  this point was
> > discussed before sending patch. As there was no user in the mainline DTs for
> > these macros, we made change.
> 
> My operating assumption is usually "rough consensus and running code".
> 
> If the code doesn't run, i.e. if there are regressions then we need to fix
> them.
> 
> I am not aware of any systems having picked up the flags as they were
> set before this patch, but if they exist we need to patch it of course.

Eight kernel releases, including two long-term stable kernels (4.4 and
4.9), is a long time for people start using these flags and without us
finding out about it for a while still.

> On the other hand we don't patch theoretical compatibility issues either,
> only those that occure in practice.

I have a customer who was bitten by this after updating to 4.12, and I'm
sure there will be others.

So I wouldn't simply dismiss it as theoretical.

> It falls back on when a DT binding is really standardized. When it is
> starting to get discussed? When the final binding is merged to the kernel
> tree? When the devicetree.org people publish it? When a big enough
> vendor ships more than 100 devices using it no matter what happened
> discussion-wise?
> 
> All these are a bit fluid concepts, so as a result, the handling of bindings
> is a bit fluid.
> 
> If we really want DT bindings to have a point when they are "set in stone"
> then we need to talk to devicetree.org about that. But in reality I think all
> standards ever are a bit fuzzy around the edges.

I agree. And the interface needed to be fixed. But for next time,
perhaps being more explicit about the implications for current users
would help people notice such changes when they do happen. Backporting a
fix for a broken interface could also be considered (at least if
discovered in the next kernel release cycle or so).

And in this particular case, it looks like it might have been possible
to pick flags in such a way that the breakage could have be avoided in
the first place.

Johan
