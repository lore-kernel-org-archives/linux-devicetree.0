From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 1/6] ARM: bcm476x: Add infrastructure
Date: Fri, 12 Oct 2012 10:12:52 +0200
Message-ID: <20121012101252.6c3b7dce@skate>
References: <20121007015300.828366635@gmail.com>
 <20121012070651.GA17511@glitch> <20121012092617.37e82610@skate>
 <201210120803.54539.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201210120803.54539.arnd@arndb.de>
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
Cc: devicetree-discuss@lists.ozlabs.org, Domenico Andreoli <cavokz@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Arnd,

On Fri, 12 Oct 2012 08:03:54 +0000, Arnd Bergmann wrote:

> I would certainly like to see this, yes. I had a patch for it ages
> ago, but would start over again if I did this now.
> 
> I don't have time to do the conversion at the moment, but I would
> certainly welcome a patch that does it. I can give some details about
> the problems with that and how I think they should be solved.

I did start working on such a patch a few weeks ago, but converting all
the platforms to use IOMEM() was really boring. But now you did that, I
can try to revive my patch, see if it works, and post it if you're
interested.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
