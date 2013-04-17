From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Wed, 17 Apr 2013 18:24:09 +0200
Message-ID: <1366215849.24994.70.camel@pasglop>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
 <516C544A.4090107@wwwdotorg.org>
 <20130417091457.GB5012@e106331-lin.cambridge.arm.com>
 <516EBC66.20508@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <516EBC66.20508@wwwdotorg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Viresh Kumar <viresh.kumar@linaro.org>, Jon Medhurst <tixy@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <Catalin.Marinas@arm.com>, David Brown <davidb@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>, Bar
List-Id: devicetree@vger.kernel.org

On Wed, 2013-04-17 at 09:14 -0600, Stephen Warren wrote:
> On 04/17/2013 03:14 AM, Mark Rutland wrote:
> > Hi Stephen,
> > 
> >>> +	- enable-method
> >>> +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> >>> +		       systems
> >>> +		Value type: <string>
> >>> +		Definition: On ARM 64-bit systems must be "spin-table" [1].
> >>
> >> Can that be an integer instead? with dtc+cpp support, that shouldn't
> >> hurt the eyes too much any more.
> > 
> > The "enable-method" property is described as a stringlist by ePAPR, and is
> > currently in use on arm64 as such. It *must* remain a string(list) for arm64.
> > 
> > Having it as an integer for arm is only going to cause us additional work,
> > makes it impossible to share a common dt between 64bit and 32bit, and goes
> > against the standard. I think it should be a stringlist for arm.
> 
> OK, that's a great reason for this case.
> 
> I hope we don't introduce any more standards that use strings, but that
> may just be my personal preference...

I happen to have the exact opposite opinion :-)

Cheers,
Ben.
