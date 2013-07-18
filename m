From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v1 05/24] clk: wrap I/O access for improved portability
Date: Thu, 18 Jul 2013 13:47:22 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1307181330520.14924@syhkavp.arg>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
 <1373914074-20889-6-git-send-email-gsi@denx.de>
 <20130715193829.GS14452@pengutronix.de>
 <20130718070402.GO7080@book.gsilab.sittig.org>
 <20130718091735.GW24642@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130718091735.GW24642@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mike Turquette <mturquette@linaro.org>, Detlev Zundel <dzu@denx.de>, Wolfram Sang <wsa@the-dreams.de>, devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gerhard Sittig <gsi@denx.de>, linuxppc-dev@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Wolfgang Grandegger <wg@grandegger.com>, David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <m.chehab@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thu, 18 Jul 2013, Russell King - ARM Linux wrote:

> 1. clk_get() and clk_put() are NOT part of the common clock API.
>    They're separate - they're part of the clk API, and the infrastructure
>    behind that is clkdev, which is a separately owned thing (by me.)
> 
> 2. The "contract" of the clk API is defined by the clk API, not by some
>    random implementation like the common clock API.  The clk API is
>    maintained by myself, and is described in include/linux/clk.h
> 
> 3. clk_prepare() and clk_unprepare() are functions MUST only be called
>    from contexts where sleeping is permitted.  These functions MAY sleep
>    for whatever reason they require to, and as long as they require to.
>    (This is the whole reason these two functions were created in the
>    first place.)
> 
> 4. clk_enable() and clk_disable() MAY be called from any context, but
>    MUST never sleep.  If you need to talk over a non-atomic bus for these,
>    then these functions should be no-ops, and the code which does that
>    must be executed from the clk_prepare()/clk_unprepare() operations.

Could the above be included in some form in Documentation/clk.txt (this 
is likely one of the first location people look for information) and 
elsewhere if appropriate please?

A *lot* of people are confused by the prepare-enable-disable-unprepare 
sequence and when I try to find some rational for the prepare/enable 
split I can only direct them to mail archive posts since this is nowhere 
to be found in the kernel.

The comments in include/linux/clk.h, while correct, are very terse and 
don't provide any insight to the reason why there is a split in the API.

The content of Documentation/clk.txt does refer to prepare and enable 
(and their counterparts) but again doesn't provide any clue about the 
reason for their existence.

Since there've been several good posts with usage example now buried 
into list archives, I think this would go a long way helping people get 
it right if those were part of the kernel documentation as well.


Nicolas
