From: David Brown <davidb@codeaurora.org>
Subject: Re: of_iomap() matched with plan iounmap()
Date: Fri, 19 Aug 2011 14:19:02 -0700
Message-ID: <20110819211902.GA19702@huya.qualcomm.com>
References: <20110818170226.GA16721@huya.qualcomm.com>
	<20110818.203447.462383652600224162.davem@davemloft.net>
	<201108191426.19152.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201108191426.19152.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, davidb@codeaurora.org, David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2011 at 02:26:18PM +0200, Arnd Bergmann wrote:
> On Friday 19 August 2011, David Miller wrote:
> > From: David Brown <davidb@codeaurora.org>
> > Date: Thu, 18 Aug 2011 10:02:26 -0700
> > 
> > > The SPARC target contains of_ioremap() and of_iounmap(), which various
> > > drivers use (generally inside of CONFIG_SBUS).
> > > 
> > > include/linux/of_address.h contains a definition for of_iomap(), but
> > > not corresponding unmap call.  Code using this calls the regular
> > > iounmap().
> > > 
> > > Is it safe to assume that of_iomap() will always be based on ioremap()
> > > and therefore it is safe to use iounmap(), or would it be better to
> > > define another name for drivers to use as the inverse of of_iomap().
> > > I'm not sure what to call it, since of_iounmap() is already taken by
> > > SPARC.
> > 
> > It's better to define a matching of_iounmap() interface, even if for
> > now it is exactly iounmap()
> 
> But the problem is that we need conflicting prototypes for of_iounmap.

What if we left the SPARC calls alone, and changed of_iomap() into
of_dt_iomap() and could then make of_dt_iounmap().  Or, it could just
be of_dt_map(), and of_dt_unmap().

David

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.
