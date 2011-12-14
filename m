From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/9] irq: check domain hwirq range for DT translate
Date: Wed, 14 Dec 2011 09:08:20 -0700
Message-ID: <CACxGe6t6mtPt9LsQ77N06n5gWAAUcswhGNut9O==Drq5CJDMpQ@mail.gmail.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com> <1323876538-20406-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323876538-20406-3-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, shawn.guo@freescale.com, Kukjin Kim <kgene.kim@samsung.com>, Kevin Hilman <khilman@ti.com>, Tony Lindgren <tony@atomide.com>, Barry Song <baohua.song@csr.com>, Linus Walleij <linus.ml.walleij@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2011 at 8:28 AM, Rob Herring <robherring2@gmail.com> wr=
ote:
> From: Rob Herring <rob.herring@calxeda.com>
>
> A DT node may have more than 1 domain associated with it, so make sur=
e
> the hwirq number is within range when doing DT translation.
>
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
> =A0kernel/irq/irqdomain.c | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 200ce83..ae6441e 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -135,6 +135,9 @@ int irq_domain_simple_dt_translate(struct irq_dom=
ain *d,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0if (intsize < 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> + =A0 =A0 =A0 if ((intspec[0] < d->hwirq_base) ||
> + =A0 =A0 =A0 =A0 =A0 (intspec[0] >=3D d->hwirq_base + d->nr_irq))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>
> =A0 =A0 =A0 =A0*out_hwirq =3D intspec[0];
> =A0 =A0 =A0 =A0*out_type =3D IRQ_TYPE_NONE;
> --
> 1.7.5.4
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
