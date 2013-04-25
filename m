From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH v3 02/17] Documentation: devicetree: arm: cpus/cpu
 nodes bindings updates
Date: Thu, 25 Apr 2013 10:09:32 +0100
Message-ID: <20130425090931.GB25870@e102568-lin.cambridge.arm.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366824502-19729-3-git-send-email-lorenzo.pieralisi@arm.com>
 <20130424195820.GM4998@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130424195820.GM4998@game.jcrosoft.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <Will.Deacon@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <Catalin.Marinas@arm.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Sekhar Nori <nsekhar@ti.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 24, 2013 at 08:58:20PM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:

[...]

> > +     - compatible:
> > +             Usage: required
> > +             Value type: <string>
> > +             Definition: should be one of:
> > +                         "arm,arm710t"
> > +                         "arm,arm720t"
> > +                         "arm,arm740t"
> > +                         "arm,arm7ej-s"
> > +                         "arm,arm7tdmi"
> > +                         "arm,arm7tdmi-s"
> > +                         "arm,arm9es"
> > +                         "arm,arm9ej-s"
> > +                         "arm,arm920t"
> > +                         "arm,arm922t"
> > +                         "arm,arm925"
> > +                         "arm,arm926e-s"
> > +                         "arm,arm926ej-s"
> > +                         "arm,arm940t"
> > +                         "arm,arm946e-s"
> > +                         "arm,arm966e-s"
> > +                         "arm,arm968e-s"
> > +                         "arm,arm9tdmi"
> > +                         "arm,arm1020e"
> > +                         "arm,arm1020t"
> > +                         "arm,arm1022e"
> > +                         "arm,arm1026ej-s"
> the common name is arm926ejs / arm1026ejs & co

The TRMs names are arm926ej-s/arm1026ej-s/... and other machs are using that
nomenclature already in dts files, time to consolidate.

Lorenzo
