From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/9 v5] ARM: kirkwood: fdt: convert kirkwood to fdt
Date: Fri, 16 Mar 2012 20:41:12 +0000
Message-ID: <201203162041.12831.arnd@arndb.de>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <201203162018.27957.arnd@arndb.de>
 <20120316202815.GI20243@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120316202815.GI20243@titan.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, olof@lixom.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Friday 16 March 2012, Jason Cooper wrote:
> I was going to give it a day or two more, and if no one brought up
> anything earth-shattering, I was going to submit the pull-request for
> this series on Sunday.  I can do it now if you think it's ok.

I've already pulled it now, and I'm not going to take any new patches
for v3.4 any more. I expect Linus to open up the merge window
any time now, and he does not like to see patches sent to him
that have not been in linux-next before the merge window opened.

So the deal is that anything that is in now stays in unless someone
reports a serious problem and in that case it gets removed.
Any simple bugs can be fixed by sending follow-up patches of
course.

> > I'm willing to take it and have put it into next/dt2 for now so it
> > makes it into linux-next. I'm not taking a newer version for v3.4 any
> > more, so if anyone has concerns over some of your patches in the
> > series, it all gets removed again and we will have to postpone them
> > until v3.5.
> 
> The problematic patch (sata_mv) has been removed.  So, there should be
> no issue.

Ok, thanks for the confirmation.

	Arnd
