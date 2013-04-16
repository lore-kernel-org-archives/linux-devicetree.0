From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Tue, 16 Apr 2013 18:21:08 +0200
Message-ID: <1366129268.24994.60.camel@pasglop>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
 <516C544A.4090107@wwwdotorg.org>
 <20130416104545.GA19837@e102568-lin.cambridge.arm.com>
 <516D74E9.9030404@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <516D74E9.9030404@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>, Barr
List-Id: devicetree@vger.kernel.org

On Tue, 2013-04-16 at 09:57 -0600, Stephen Warren wrote:
> > Mmm, I need to read more on dtc+cpp, I do not think that leaving it
> > as a string would hurt though, am I wrong ? Can we assume that all
> dts
> > are preprocessed before being compiled and passed to the kernel ?
> 
> It wouldn't hurt too much, but representing enums as strings when
> there's a capability to simply represent it as a integer just feels
> pretty gross to me.

It's the other way around...

Unless there's a direct semantic meaning of the numbers, things like
that (ie. "methods") should be represented as strings.

Else we fall back to the realm of "magic numbers" which sucks and causes
all sort of pains when several new methods get added by different
people, etc...

The tree is meant to be generally human readable and we should stick to
that. The tiny memory usage is irrelevant on any modern setup.

Cheers,
Ben.
