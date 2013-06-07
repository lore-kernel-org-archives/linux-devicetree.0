From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 03/14] bus: mvebu-mbus: Introduce device tree binding
Date: Fri, 7 Jun 2013 23:15:50 +0200
Message-ID: <201306072315.50390.arnd@arndb.de>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072153.03855.arnd@arndb.de>
 <20130607200956.GB9010@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130607200956.GB9010@obsidianresearch.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, devicetree-discuss@lists.ozlabs.org, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 07 June 2013, Jason Gunthorpe wrote:
> 
> On Fri, Jun 07, 2013 at 09:53:03PM +0200, Arnd Bergmann wrote:
>  
> > Can you explain to me why it is an invalid target ID value? Is it
> > treated very differently by the mbus register setup than all the
> > others? I guess we can define it as something else to make a valid
> > target ID, by using one or more of the remaining bits in the first
> > address cell.
> 
> There is a special dedicated window register for the internal regs
> base. Marvell did not define it a target ID or window attributes, and
> only that window register can be used to configure it.

Ok.

> The mbus driver should never read or write this register.

That is not a hard requirement, right? I guess based on the
recent discussion about the 0xd0 or 0xf1 window, there may
actually be good reasons to reassign it, although I agree
that we shouldn't bother with implementing that for now, as
it's not a simple or urgent problem.

> So we have a 2 cell address encoding of the form:
> 
>  IIAA0000 00oooooo
> 
> Where:
>  -- I = Marvell defined target ID for programmable windows
>  -- A = Marvell defined target attributes for programmable windows
>  -- o = offset within the window
> 
> Now, we need 2 cell format that tells the driver that this is the
> internal regs block. Assuming that marvell defines all I/A values we
> need another value (I called it an invalid valid) to indicate internal
> regs, several choices:
> 
>   FFFFFFFF 00oooooo
>   0000FFFF 00oooooo
>   00000001 00oooooo
> 
> Doesn't really matter which is picked, as far as I can tell, though
> maybe the 01 option is best, leading to:
> 
>   IIAAssss 00oooooo
> 
> Where:
>  -- s = target space
>    == 0 means I/A are:
>     -- I = Marvell defined target ID for programmable windows
>     -- A = Marvell defined target attributes for programmable windows
>    == 1 means internal regs block
>  -- o = offset within the target
> 
> Which is pretty tidy..

Ok, thanks for the explanation. I think this is a good representation.
The other idea I raised in my previous mail would end up with something
like

 SIIAA000 00oooooo

with 'S' having the inverted meaning of your 's', so '0' actually
refers to the internal regs as in Ezequiel's current code.

I'm fine with either representation though.


	Arnd
