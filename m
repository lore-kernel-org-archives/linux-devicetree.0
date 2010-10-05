From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] Globally s/struct irq_host/struct irq_domain/
Date: Tue, 5 Oct 2010 09:25:44 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.1010050925260.2556@localhost6.localdomain6>
References: <E1P2Tqn-0004gj-W1@jdl.com> <20101004165212.GC13749@angua.secretlab.ca> <1286233776.2463.329.camel@pasglop> <AANLkTimGtuq8+yA121xg0tVQ=Z=nqfzUG6BC8YqzX3Qh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463795968-79811929-1286263567=:2556"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimGtuq8+yA121xg0tVQ=Z=nqfzUG6BC8YqzX3Qh@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jon Loeliger <jdl@jdl.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463795968-79811929-1286263567=:2556
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Mon, 4 Oct 2010, Grant Likely wrote:

> On Mon, Oct 4, 2010 at 5:09 PM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > On Mon, 2010-10-04 at 10:52 -0600, Grant Likely wrote:
> >> On Sun, Oct 03, 2010 at 02:03:57PM -0500, Jon Loeliger wrote:
> >> >
> >> > Just rename the irq_host structure as irq_domain to lessen the
> >> > confusion around the word "host".  Updated a few comments and
> >> > error messages to use "irq_domain" when refering to the structure.
> >> >
> >> > Suggested by Ben Herrenschmidt on the device-tree mailing list.
> >> >
> >> > Signed-off-by: Jon Loeliger <jdl@jdl.com>
> >> > ---
> >> >
> >> > Grant requested one giant patch simply renaming the structure.
> >>
> >> Thanks Jon,
> >>
> >> However, considering that tglx has already embarked on his Grand IRQ
> >> Subsystem Cleanup, I suspect that this will end up just getting in the
> >> way unless he picks it up into his queue.  It may even by that the
> >> need for irq_host will disappear once Thomas is finished by merging it
> >> into the core code.  I'd like to sit tight on this until the details
> >> of what powerpc virqs can be worked out with Ben and Thomas.
> >
> > I doubt the need for irq_host will disappear. However I don't see that
> > going into the core under that name, so I think the rename is a very
> > valid thing to do now. We just need to sync the patches to avoid pure
> > mechanical clash.
> >
> > Thomas initial series doesn't yet generalize the virq layer and that
> > will take a bit longer, so I'm happy to see Jon stuff go upstream first.
> 
> Alright, should tglx pick up this patch, or do you want to carry it in
> the powerpc tree?

Should go through powerpc.

       tglx
---1463795968-79811929-1286263567=:2556--
