From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2] mtd: nand: document the NAND controller/NAND chip DT
 representation
Date: Sat, 2 Apr 2016 15:47:58 +0200
Message-ID: <20160402154758.706f6f0f@bbrezillon>
References: <1459513595-14308-1-git-send-email-boris.brezillon@free-electrons.com>
	<20160401205722.GA10227@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160401205722.GA10227@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Harvey Hunt <harvey.hunt@imgtec.com>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Brian,

On Fri, 1 Apr 2016 13:57:22 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Fri, Apr 01, 2016 at 02:26:35PM +0200, Boris Brezillon wrote:
> > Standardize the NAND controller/NAND chip DT representation. Now, all new
> > NAND controller drivers should comply with this representation, even if
> > they are only supporting a single NAND chip.
> > 
> > Existing drivers can keep support for the old representation (where only
> > the NAND chip was described), but are encouraged to also support the new
> > one.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> > Changes since v1:
> > - fix typo
> > ---
> 
> Thanks for doing this. This mostly looks pretty good.
> 
> >  Documentation/devicetree/bindings/mtd/nand.txt | 37 +++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
> > index b53f92e..a17662b 100644
> > --- a/Documentation/devicetree/bindings/mtd/nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> > @@ -1,4 +1,23 @@
> > -* MTD generic binding
> > +* NAND chip and NAND controller generic binding
> > +
> > +NAND controller/NAND chip representation:
> 
> You're starting with an assumption that there is a difference. I suppose
> that's usually the case, but is there ever a case that there isn't
> really? For instance, what about gpio.c? It's just a few GPIOs wired
> directly to a NAND chip.

Well, even if it's a bit-banging controller which is able to only
interface with a single chip it's still a controller and not the NAND
chip itself, so I think keeping the separation in this case is still
valid. As an example, see the i2c or spi bit-banging drivers, even if
there's no real controller, they are still represented with their own
node...

> Or perhaps, does it make sense still, even
> there? For instance, if you wanted to wire multiple chips but share most
> of the lines, you'd need to coordinate this in a "controller" node
> somehow.

Yep.

> 
> All-in-all, looks good though, and we can patch this up with any other
> additions. (It's not exactly a formal specification, after all, but just
> guidelines.) So:
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Ok, I'll wait for an ack from a DT maintainer before taking this patch.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
