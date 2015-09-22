From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH 2/2] MIPS: ath79: add irq chip ar7240-misc-intc
Date: Tue, 22 Sep 2015 19:12:29 +0200
Message-ID: <20150922171228.GB18064@linux-mips.org>
References: <1442636780-2891-1-git-send-email-lynxis@fe80.eu>
 <1442636780-2891-3-git-send-email-lynxis@fe80.eu>
 <alpine.DEB.2.11.1509221223280.5606@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.11.1509221223280.5606@nanos>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Couzens <lynxis@fe80.eu>, linux-mips@linux-mips.org, Alban Bedel <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 12:24:26PM +0200, Thomas Gleixner wrote:

> > The ar7240 misc irq chip use ack handler
> > instead of ack_mask handler. All new ath79 chips use
> > the ar7240 misc irq chip
> > 
> > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > Acked-by: Alban Bedel <albeu@free.fr>
> > ---
> >  .../interrupt-controller/qca,ath79-misc-intc.txt     | 20 ++++++++++++++++++--
> >  arch/mips/ath79/irq.c                                | 10 ++++++++++
> 
> That driver should probably move into drivers/irqchip.

Like a fair number of other irq.c type files in arch/mips that could
reasonably easily be rewritten to go to drivers/irqchip.

> Other than that.
> 
> Acked-by: Thomas Gleixner <tglx@linutronix.de>

Thanks, I replaced the previous version of this patch with this one.

  Ralf
