From: Johan Hovold <johan@kernel.org>
Subject: Re: [Letux-kernel] [PATCH 0/5] gnss: sirf: add support for w2sg0004
 + lna
Date: Wed, 5 Dec 2018 17:01:08 +0100
Message-ID: <20181205160108.GN15689@localhost>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <3487514B-E546-4F11-8C0A-F5B4A8114376@goldelico.com>
 <20181119194414.1c7d6887@aktux>
 <20181205151916.GJ15689@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181205151916.GJ15689@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 05, 2018 at 04:19:16PM +0100, Johan Hovold wrote:
> On Mon, Nov 19, 2018 at 07:44:14PM +0100, Andreas Kemnade wrote:
> 
> > On Mon, 19 Nov 2018 09:22:59 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> 
> > > > Am 18.11.2018 um 22:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > > > 
> > > > Here is another chapter of the story to get gta04 gnss power
> > > > management into the mainline kernel.
> > > > There is a w2sg0004 without wakeup line in there, so power state
> > > > can only be determined indirectly by looking at the serial data lines.
> > > > Then there as also an lna which needs to be powered for real gps
> > > > reception. That part needs probably more discussion, since it might
> > > > be an idea to have it more generalized since it has nothing todo
> > > > with the chip itself.  
> > > 
> > > On the other hand if we follow the "SoC is the spider in the net"
> > > way of looking at DTS hierarchy, we have the uart as a child of the
> > > SoC and the gnss receiver as a serdev child of the UART. The LNA
> > > is even one step more distantly connected to the gnss. So it makes
> > > sense to me to have it as a property/reference of the gnss chip's
> > > DTS record which is a sibling of the compatible records. So the only
> > > place where it can be reasonably processed is the driver.
> > > 
> > Or the lna is a child of the gnss receiver. The whole thing
> > should probably not be overdesigned, but it does not make sense that
> > every gnss chip driver has some lna logic.
> 
> Did you mean "does make sense" here?
> 
> > Maybe the regulator should just be stored in the struct
> > gnss_device and then drivers/gnss/core.c takes care.
> 
> Maybe eventually, but keeping it per driver is fine for now.
> 
> As you say above, this really isn't part of the chip itself, and
> therefore should probably be a generic gnss property as it could be
> required for any receiver (in principle).
> 
> But we still need driver support for coordinating it with the rest of
> the receiver power management, so adding it to drivers as need arises
> seems reasonable.

Actually, the property probably still should go into gnss.txt as a
generic optional property, but driver support for it will be added as
need arises.

Rob?

Thanks,
Johan
