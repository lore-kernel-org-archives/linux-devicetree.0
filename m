From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Sun, 09 Jun 2013 17:37:22 +0200
Message-ID: <2027719.ak85gut3pg@wuerfel>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1695243.lt6nZouziV@wuerfel> <20130609143422.GA2353@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130609143422.GA2353@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, devicetree-discuss@lists.ozlabs.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Maen Suleiman <maen@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sunday 09 June 2013 11:34:24 Ezequiel Garcia wrote:
> On Sun, Jun 09, 2013 at 03:42:24PM +0200, Arnd Bergmann wrote:
> > On Saturday 08 June 2013 15:38:52 Ezequiel Garcia wrote:
> > > On Fri, Jun 07, 2013 at 02:00:54PM -0600, Jason Gunthorpe wrote:
> > 
> > > Right. I think we have two options here for laying the DT ranges.
> > > 
> > > 1) This is the proposal implied in the patchset I sent:
> > > 
> > > mbus {
> > >     ranges = < we only put the internal-reg translation here>
> > >     devbus-bootcs {
> > >             ranges = <0 {target_id/attribute} {window_physical_base} {size}>
> > >     }
> > > }
> > 
> > As Jason explained, you cannot have the window_physical_base in the child
> > device, that just wouldn't work. I don't know if that's a typo or a thinko 
> > 
> 
> I'm not sure what you mean by "that just wouldn't work". I understand it
> may be a crappy DT layout, but it definitely works.

I didn't mean to imply that you hadn't tested it. I guess it works fine
if you put the same window_physical_base address into both the source
and destination side mbus ranges property, but then you have to pass
it three times in total and it gets really messy when you reassign it
to a different physical address.

	Arnd
