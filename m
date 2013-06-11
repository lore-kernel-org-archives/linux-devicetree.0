From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/6] Marvell Orion SoC irqchip and clocksource
Date: Tue, 11 Jun 2013 09:35:23 -0300
Message-ID: <20130611123521.GA3996@localhost>
References: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1370536034-23956-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Thomas Gleixner <tglx@linutronix.de>, John Stultz <john.stultz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,

On Thu, Jun 06, 2013 at 06:27:08PM +0200, Sebastian Hesselbarth wrote:
> This patch set introduces DT-aware irqchip and clocksource drivers fo=
r
> Marvell Orion SoCs (Kirkwood, Dove, Orion5x, MV78x00) and correspondi=
ng
> patches for Dove and Kirkwood to enable them for DT-boards.
>=20
> The irqchip driver, of course, depends on Thomas Gleixner's work on
> irqdomain support for generic chip (tip irq/core).
>=20
> The ARM part of this patch set has a quite ridiculuous dependency hav=
oc
> of mv643xx_eth DT support (current net-next) that will add to both ir=
qchip
> and clocksource branches respectively. Therefore, I suggest that irq
> and clocksource maintainers take in the mere drivers (Patches 1+2) an=
d
> Jason Cooper handles the remaining patches when all three drivers hav=
e
> surfaced on mainline linux.
>=20
> I prepared a branch for anyone to test on Kirkwood and Dove which tak=
es
> care of the above dependencies based on v3.10-rc4 plus tip irq/core,
> net-next, and arm-soc for-next (I know it is unstable but contains la=
test
> mvebu related patches already). When Thomas, John, and Jason agree th=
e
> dependencies will vanish and only Jason has to take care of ARM patch=
es
> for enabling DT-based mv643xx_eth, irqchip, and clocksource.
>=20
> The branch can be found at
>=20
> git://github.com/shesselba/linux-dove.git orion-irqchip-for-v3.11
>=20
> and has been tested on Dove/CuBox and compile tested for Kirkwood.
>=20
> Sebastian Hesselbarth (6):
>   irqchip: add support for Marvell Orion SoCs
>   clocksource: add Marvell Orion SoC timer
>   ARM: dove: move device tree nodes to DT irqchip and clocksource
>   ARM: kirkwood: move device tree nodes to DT irqchip and clocksource
>   ARM: dove: convert to DT irqchip and clocksource
>   ARM: kirkwood: convert to DT irqchip and clocksource
>=20

I've done some tests on my Kirkwood Openblocks A6 using the latest
branch orion-irqchip-for-v3.11-v4. Everything works fine so:

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

=46or patches 3 to 6 I'm wondering if there's any reason why the irqchi=
p and
clocksource changes are not separated. I'm probably being too picky but=
,
unless you have a good reason for having them together,
I think they should go separated, i.e. patches for irqchip on one side,
and patches for clocksource on the other.

Aside from that, the series looks good. Nice job!

Thanks,
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
