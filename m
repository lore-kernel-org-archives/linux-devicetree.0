From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 3/9] irq: convert generic-chip to use irq_domain
Date: Wed, 14 Dec 2011 14:14:28 -0700
Message-ID: <CACxGe6sqTx4h3vPgq+XrAoqLTiDMB-vcS5C9GgYssdsSYV_0qA@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-4-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-4-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> Add irq domain support to irq generic-chip. This enables users of
> generic-chip to support dynamic irq assignment needed for DT interrup=
t
> binding. Users must be converted to use irq_data.hwirq for determinin=
g
> local interrupt numbers rather than using the Linux irq number.
>
> irq_base is kept for now as there are a few users of it. Once they
> are converted to use the irq domain, it can be removed.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
> =A0include/linux/irq.h =A0 =A0 =A0 | =A0 =A02 +-
> =A0kernel/irq/Kconfig =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0kernel/irq/generic-chip.c | =A0 57 ++++++++++++++++++++++++++++---=
-------------
> =A03 files changed, 38 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index bff29c5..9ba8a30 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -664,7 +664,7 @@ struct irq_chip_generic {
> =A0 =A0 =A0 =A0raw_spinlock_t =A0 =A0 =A0 =A0 =A0lock;
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*reg_base;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq_base;
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0irq_cnt;
> + =A0 =A0 =A0 struct irq_domain =A0 =A0 =A0 *domain;

Instead of making domain a pointer, why not embed the structure inside
irq_chip_generic?  I don't see a reason for keeping it separate.

After changing that you can add my Acked-by for this patch.

g.


--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
