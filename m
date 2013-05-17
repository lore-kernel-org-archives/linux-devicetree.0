From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCHv9 5/9] clk: mvebu: create parent-child relation for
 PCIe clocks on Armada 370
Date: Fri, 17 May 2013 08:55:13 -0400
Message-ID: <20130517125513.GC11137@titan.lakedaemon.net>
References: <1368624323-24311-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1368624323-24311-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130515214154.12127.73539@quantum>
 <20130516094417.24b1ca0d@skate> <51949830.70306@gmail.com>
 <20130516150616.GD6563@titan.lakedaemon.net>
 <20130517070826.12127.41382@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130517070826.12127.41382@quantum>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Tawfik Bayouk <tawfik@marvell.com>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Lior Amsalem <alior@marvell.com>, Rob Herring <rob.herring@calxeda.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 17, 2013 at 12:08:26AM -0700, Mike Turquette wrote:
> Quoting Jason Cooper (2013-05-16 08:06:16)
> > Mike, Sebastian,
> > 
> > On Thu, May 16, 2013 at 10:26:24AM +0200, Sebastian Hesselbarth wrote:
> > > On 05/16/2013 09:44 AM, Thomas Petazzoni wrote:
> > > >Dear Mike Turquette,
> > > >
> > > >On Wed, 15 May 2013 14:41:54 -0700, Mike Turquette wrote:
> > > >>Quoting Thomas Petazzoni (2013-05-15 06:25:19)
> > > >>>The Armada 370 has two gatable clocks for each PCIe interface, and we
> > > >>>want both of them to be enabled. We therefore make one of the two
> > > >>>clocks a child of the other, as we did for the sataX and sataXlnk
> > > >>>clocks on Armada XP.
> > > >>
> > > >>Ack for patches #5 and #6.  Do you want me to take them?
> > 
> > Thanks for the Ack!
> > 
> > > >I don't know, I guess with your Ack, it would be easier to carry them
> > > >through the Marvell maintainers and then the arm-soc tree, so that we
> > > >can test arm-soc and have all the pieces needed in here.
> > > >
> > > >That said, Sebastian Hesselbarth has submitted a big rework of the
> > > >mvebu clock drivers, which would conflict with this patch, and
> > > >Sebastian's rework would most likely go through your tree. If that's
> > > >the case, I guess it would be better to let you take #5 and #6 in this
> > > >patch series.
> > > 
> > > I also requested to take the restructure patches through ARM tree. They
> > > are only touching files in drivers/clk/mvebu and by taking them through
> > > ARM, we can update PCIe clock patches easily. The dependency between
> > > Thomas' and my patches basically is that I renamed files that Thomas
> > > now commits to. (I switched clk/mvebu from per-function files to per-soc
> > > files).
> > 
> > I agree.  My heart jumped into my throat a little there :)  Mike, if
> > it's ok with you, I'd prefer to take these through arm-soc.  Any merge
> > conflicts should be minimal.  And at any rate, resolving the conflicts
> > are *much* easier to handle than having arm-soc depend on an outside
> > tree (then Linus has to take care in the order he merges them, no
> > rebasing for clk tree, dogs and cats living together, etc ;-) )
> > 
> 
> Yeah that all sounds good to me.  I'll review the restructure patches
> shortly.

Awesome, thanks.

Jason.
