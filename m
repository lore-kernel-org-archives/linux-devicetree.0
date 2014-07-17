From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] irqchip: gic: Add binding probe for ARM GIC400
Date: Thu, 17 Jul 2014 08:48:04 -0400
Message-ID: <20140717124804.GI13108@titan.lakedaemon.net>
References: <1404947104-21345-1-git-send-email-suravee.suthikulpanit@amd.com>
 <1404947104-21345-2-git-send-email-suravee.suthikulpanit@amd.com>
 <2932284.F1eaAf8ArJ@diego>
 <2621565.f5eISveXXJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2621565.f5eISveXXJ@diego>
Sender: linux-pci-owner@vger.kernel.org
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: suravee.suthikulpanit@amd.com, linux-arm-kernel@lists.infradead.org, marc.zyngier@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com, linux-doc@vger.kernel.org, Catalin.Marinas@arm.com, Harish.Kasiviswanathan@amd.com, linux-kernel@vger.kernel.org, Will.Deacon@arm.com, linux-pci@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

On Tue, Jul 15, 2014 at 12:03:03AM +0200, Heiko St=FCbner wrote:
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
>=20
>  drivers/irqchip/irq-gic.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to irqchip/urgent with Will's Ack and Cc'd to stable for v3.14+

thx,

Jason.
