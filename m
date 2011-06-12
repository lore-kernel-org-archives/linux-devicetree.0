From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 0/3] patches to allow DTB to be appended to the ARM zImage
Date: Sun, 12 Jun 2011 11:47:59 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.1106121145570.2142@xanadu.home>
References: <1307858800-16712-1-git-send-email-nicolas.pitre@linaro.org>
	<20110612112219.GD16318@ibawizard.net>
	<20110612115820.GF10283@n2100.arm.linux.org.uk>
	<201106121615.24059.arnd@arndb.de>
	<20110612145751.GA4013@ponder.secretlab.ca>
	<20110612151931.GK10283@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110612151931.GK10283@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, =?ISO-8859-15?Q?Petr_=A6tetiar?= <ynezz@true.cz>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, 12 Jun 2011, Russell King - ARM Linux wrote:

> On Sun, Jun 12, 2011 at 08:57:51AM -0600, Grant Likely wrote:
> > On Sun, Jun 12, 2011 at 04:15:23PM +0200, Arnd Bergmann wrote:
> > > But when you have both atag and DT and the atag overrides the DT, that
> > > means we have incorrect information in the DT, and code might later
> > > rely on that information.
> > > 
> > > IMHO when we allow passing a DT to a kernel while booting from an
> > > existing boot loader that only knows about atag, the code that loads
> > > the DT should be responsible for updating the DT with the atag information,
> > > not pass two conflicting sets of data into the actual kernel.
> > 
> > I completely agree here.  I /started/ from the position that ATAGs and
> > DTB would coexist, and after extensive debate[1] my opinion turned around
> > to it should be one or the other.  Otherwise there are all kinds of
> > questions about accuracy of the information and which takes
> > precedence.
> 
> And we've ended up with a fucked up situation which is extremely
> fragile, and actually makes me _NOT_ want to convert any existing
> platforms to use DT in the least.

Agreed.  I don't think that anything older than OMAP2 is worth 
converting to DT.  The return on the investment is simply not worth it, 
other than for experimental purposes.


Nicolas
