From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: atmel-aic: fix irqdomain initialization
Date: Tue, 11 Nov 2014 17:58:00 -0500
Message-ID: <20141111225800.GE3698@titan.lakedaemon.net>
References: <20141110230301.GV4068@piout.net>
 <1415712816-9202-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415712816-9202-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-sh-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Kevin Cernekee <cernekee@gmail.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kevin Hilman <khilman@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-sh@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, linux-mips@linux-mips.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 11, 2014 at 02:33:36PM +0100, Boris Brezillon wrote:
> First of all IRQCHIP_SKIP_SET_WAKE is not a valid irq_gc_flags and thus
> should not be passed as the last argument of
> irq_alloc_domain_generic_chips.
> 
> Then pass the correct handler (handle_fasteoi_irq) to
> irq_alloc_domain_generic_chips instead of manually re-setting it in the
> initialization loop.
> 
> And eventually initialize default irq flags to the pseudo standard:
> IRQ_REQUEST | IRQ_PROBE | IRQ_AUTOEN.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Hello Kevin,
> 
> This patch has not been tested yet but it should solve the issue you've
> experienced with the IRQ_GC_BE_IO flag and the atmel-aic driver.
> 
> I'll test it tomorrow and let you know if it actually works.
> 
> Regards,
> 
> Boris
> 
>  drivers/irqchip/irq-atmel-aic-common.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to irqchip/urgent with Kevin's Tested-by.  Also, flagged for
stable, v3.17 and up.

Boris, once this is in mainline, you may want to generate a patch
against older versions (in the arch dir) for the stable team.

thx,

Jason.
