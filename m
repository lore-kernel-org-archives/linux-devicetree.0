From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] irqchip: gic: Add binding probe for ARM GIC400
Date: Thu, 17 Jul 2014 14:31:08 +0100
Message-ID: <20140717133108.GL30313@leverpostej>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com>
 <2932284.F1eaAf8ArJ@diego>
 <2621565.f5eISveXXJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2621565.f5eISveXXJ@diego>
Sender: linux-doc-owner@vger.kernel.org
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <Marc.Zyngier@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 14, 2014 at 11:03:03PM +0100, Heiko St=C3=BCbner wrote:
> From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>=20
> Commit 3ab72f9156bb "dt-bindings: add GIC-400 binding" added the
> "arm,gic-400" compatible string, but the corresponding IRQCHIP_DECLAR=
E
> was never added to the gic driver.
>=20
> Therefore add the missing irqchip declaration for it.
>=20
> Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
>=20
> Removed additional empty line and adapted commit message to mark it
> as fixing an issue.
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> As I really need this, I took the liberty of adapting the patch accor=
dingly
> to make it apply on top of the current irqchip/for-next (or urgent) a=
nd
> explicitly state the fixed issue. Hope that is ok

While this is a fix that we should have, I'm not certain I see why this
is urgent. A dt can already have:

	compatible =3D "arm,gic-400", "arm,cortex-a15-gic";

Which will work _today_, before this patch. If we need to treat the A15
GIC string differently, we'll have to ensure we support the GIC 400
string first.

Thanks,
Mark.

>=20
>  drivers/irqchip/irq-gic.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index 9d26643..6ff28b4 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -1020,6 +1020,7 @@ gic_of_init(struct device_node *node, struct de=
vice_node *parent)
>  	gic_cnt++;
>  	return 0;
>  }
> +IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
>  IRQCHIP_DECLARE(cortex_a15_gic, "arm,cortex-a15-gic", gic_of_init);
>  IRQCHIP_DECLARE(cortex_a9_gic, "arm,cortex-a9-gic", gic_of_init);
>  IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
> --=20
> 1.9.0
>=20
>=20
>=20
>=20
