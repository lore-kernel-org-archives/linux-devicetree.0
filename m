From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 2/2] MIPS: ath79: add irq chip ar7240-misc-intc
Date: Tue, 22 Sep 2015 12:24:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1509221223280.5606@nanos>
References: <1442636780-2891-1-git-send-email-lynxis@fe80.eu> <1442636780-2891-3-git-send-email-lynxis@fe80.eu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1442636780-2891-3-git-send-email-lynxis@fe80.eu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexander Couzens <lynxis@fe80.eu>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 19 Sep 2015, Alexander Couzens wrote:

> The ar7240 misc irq chip use ack handler
> instead of ack_mask handler. All new ath79 chips use
> the ar7240 misc irq chip
> 
> Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> Acked-by: Alban Bedel <albeu@free.fr>
> ---
>  .../interrupt-controller/qca,ath79-misc-intc.txt     | 20 ++++++++++++++++++--
>  arch/mips/ath79/irq.c                                | 10 ++++++++++

That driver should probably move into drivers/irqchip.

Other than that.

Acked-by: Thomas Gleixner <tglx@linutronix.de>
