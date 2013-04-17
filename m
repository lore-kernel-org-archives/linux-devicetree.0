From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Wed, 17 Apr 2013 10:14:58 +0100
Message-ID: <20130417091457.GB5012@e106331-lin.cambridge.arm.com>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
 <516C544A.4090107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <516C544A.4090107@wwwdotorg.org>
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
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Lennert Buytenhek <kernel@wantstofly.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <Catalin.Marinas@arm.com>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Simon Horman <horms@ver>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

> > +	- enable-method
> > +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> > +		       systems
> > +		Value type: <string>
> > +		Definition: On ARM 64-bit systems must be "spin-table" [1].
> 
> Can that be an integer instead? with dtc+cpp support, that shouldn't
> hurt the eyes too much any more.

The "enable-method" property is described as a stringlist by ePAPR, and is
currently in use on arm64 as such. It *must* remain a string(list) for arm64.

Having it as an integer for arm is only going to cause us additional work,
makes it impossible to share a common dt between 64bit and 32bit, and goes
against the standard. I think it should be a stringlist for arm.

> 
> > +	- cpu-release-addr
> > +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> > +		       systems
> > +		Value type: <prop-encoded-array>
> > +		Definition: On ARM 64-bit systems must be a two cell
> > +			    property identifying a 64-bit zero-initialised
> > +			    memory location [1].
> 
> Presumably that property is required, or not, based on the value of
> enable-method, not based on the ARM architecture or bit-size?

This should be required if the enable-method depends on it. In ePAPR, it's
specified it should be there if the enable-method is "spin-table". We have
(undocumented) PSCI support on arm64 which doesn't require a cpu-release-addr.

> 
> > +[1] ARM Linux kernel documentation
> > +    Documentation/devicetree/bindings/arm64/booting.txt
> 
> Is referencing Linux-specific documentation from a supposedly
> OS-agnostic DT binding definition a good idea?

Once we have the enable-method(s) and their required properties here, we can
invert the dependency and refer to the binding from the Linux documentation.

Mark.
