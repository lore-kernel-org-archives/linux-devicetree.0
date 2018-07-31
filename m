From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Date: Tue, 31 Jul 2018 15:35:50 -0700
Message-ID: <20180731223550.GA60117@ban.mtv.corp.google.com>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180731221255.3e65c1fa@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, NeilBrown <neilb@suse.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil, Boris,

On Tue, Jul 31, 2018 at 10:12:55PM +0200, Boris Brezillon wrote:
> On Tue, 31 Jul 2018 11:05:11 +1000
> NeilBrown <neilb@suse.com> wrote:
> > On Fri, Jul 27 2018, Boris Brezillon wrote:
> > > On Fri, 27 Jul 2018 11:33:13 -0700
> > > I'll leave Neil some time to review/test/comment on the patch before
> > > queuing it, but it looks good to me.  
> > 
> > Thanks.
> > I can confirm that if I apply this patch, my system won't reboot
> > properly (as expected), and if I then add
> > 
> > 		broken-flash-reset;
> > 
> > to the jedec,spi-nor device, it starts functioning correctly again.
> > 
> > I don't like the pejorative "broken", and it also suggests that a thing
> > used to work, but something happened to break it - this is not
> > accurate.
> > I would prefer something like "reset-not-connected" which is an accurate
> > description of the state of the hardware.

One reason I didn't specifically say something like "not connected", is
because IIUC it's actually *possible* to have a robust boot sequence
without the RESET# pin -- e.g., if your boot ROM hardcoded a software
reset command (just because it's not really standardized doesn't mean
one can't do it).

> > I also think that having a WARN_ON is an over-reaction.  Certainly a
> > warning could be appropriate, but just one pr_warn() should be enough.
> > The "problem" is unlikely in practice, and loudly warning people that an
> > asteroid might kill them isn't particularly helpful.
> > 
> > I genuinely think that if the system fails to reboot, then Linux is at
> > fault. I accept that changing Linux to be completely robust might be
> > more trouble than it is worth, but I don't accept that it is impossible.

Did you read my last response on the original thread? In my
understanding, there's always a way to, e.g., b0rk your exception
handlers, etc., such that you cannot guarantee your software fallbacks
will work. Normally, one would rely on a (hardware) watchdog to do your
last resort reset for you, but if said reset cannot also reset your boot
flash, then...you're stuck.

IOW, it's impossible.

Is that not an accurate description?

> > But I don't intend to fight either of these battles.
> 
> Does that mean you're accepting this change? Brian, any comment on what
> Neil said?
> 
> To be honest, I hate being in the middle of this discussion without
> having been involved in the first decision to accept such workarounds.
> I keep thinking that making boards that do not have reset properly
> wired less likely to fail rebooting is a wise decision, but I also
> agree with Brian when he says we should inform people that their design
> is unreliable.
> The main problem I see here, is that adding this prop won't help people
> figuring out what is wrong with their design, it will just help them

How else would we help someone figure out what's wrong with their
design? My best attempt is to make it quite obvious, as long as they're
using vanilla mainline: if their system hangs on reboot (without this
property), then it's probably a bad design.

And if instead, someone stuck in this DT property already, the loud
warning might suggest the reader look at the DT binding doc or code
comments, where I elaborated.

> workaround the problem when they find out, and it might already be to
> late to fix the HW design. But maybe it's not what we're trying to do
> here. Maybe we just want to warn users that rebooting such boards is a
> risky procedure.

Brian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
