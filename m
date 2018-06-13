From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Thu, 14 Jun 2018 09:07:45 +1000
Message-ID: <a52cd1fc35cc76ac2482a6b8f6f3f6591053235c.camel@kernel.crashing.org>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
         <CAL_Jsq+dHVN+Y7xczf_Oxcn=BiJ6N9WzovRbSujgLLTYHMEh0g@mail.gmail.com>
         <f5e71bac1bc23f96b7dae64bbdad8e2154c339aa.camel@kernel.crashing.org>
         <CAL_JsqJtL0HMPxv5vMv2+LOyvyVtYusu3Ja-NikCy2RQSo7f0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJtL0HMPxv5vMv2+LOyvyVtYusu3Ja-NikCy2RQSo7f0Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2018-06-13 at 09:00 -0600, Rob Herring wrote:
> 
> > My thinking was to then replace most of_iomap users with this.
> > 
> > As for the specific case of the driver I'm cooking, it's a case where
> > the SoC contains a little coprocessor (a ColdFire even !) alongside the
> 
> Wow. Must be the 1 licensee.

Haha probably :-) It was fun to play with for sure, lots of old
memories of m68k asm coming back to the surface ;-)

> > main ARM core. I have a driver that offloads the bitbanging of some
> > GPIOs to it (to implement the FSI bus). I use devm_of_iomap() to map
> > the registers of the interrupt controller of the coprocessor, it's not
> > really part of the interrupt tree, it doesn't distribute interrupts to
> > the ARM or to Linux, it's just a device-node pointed to by a handle.
> 
> Accessing another processor's interrupt controller. What could go
> wrong with that.

We poke at one of the registers to trigger an IPI to the corproessor :-
) Sadly the HW doesn't cleanly separate the registers for the
"consumer" side (the coprocessor) from those used to poke at it by from
ARM into different banks (though at least the "clear IPI" is a separate
register so the coprocessor and the ARM don't race, ie, it actually
works fine :-).

> I guess this is fine. There's another problem though. This doesn't
> work on Sparc because address.c is not built. I'd suggest moving to
> of/device.c or a new file.

Ah sure. lib/devres.c maybe, where devm_ioremap is already.

> > BTW. Another thing that I find a bit annoying is "allocated" reserved-
> > memory, there's no API to get to it other than via the DMA APIs or a
> > CMA, which is overkill in a few circumstances (such as the one here
> > where I just want to dedicate a bit of memory to the coprocessor).
> > Right now I'm using a fixed reservation (with a reg property) and go to
> > it "manually" but that somewhat sucks.
> 
> But that's not really a DT problem.

Correct. At the moment I just use a fixed DT reserved entry and go
directly for it's "reg" property (well, via of_address_to_resource) but
that's not very nice. It would be better if I could have linux
"allocate" the space for me but then just give me an API to find it
without going via a CMA or some DMA ops.

>  It's a kernel problem if you can't
> reserve a contiguous range of unmapped pages. But why not just get
> coherent allocation and ignore that it is mapped. That seems better to
> me than working around it in DT.

The kernel won't get me a 1M (or 2M on the AST2400) aligned allocation
successfully at runtime. So a reserve entry is the way to go here
(though being mapped or not is not a big deal, I can just flush the
cache after loading the ucode into it).

Basically, I want one of the "allocated" reserved-memory entry but I
don't want to bother with a CMA or a shared DMA pool for it, which are
both completely overkill for what I need. (Also the code is hard to
follow :-)

Cheers,
Ben.
