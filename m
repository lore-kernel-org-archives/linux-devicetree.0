From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/2] Translate of PCI address without PCI enabled
Date: Wed, 19 Feb 2014 21:50:28 -0300
Message-ID: <20140220005027.GA5721@localhost>
References: <1392848096-17838-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1392848096-17838-1-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 19, 2014 at 11:14:54PM +0100, Gregory CLEMENT wrote:
> Hello,
>=20
> This patch set makes the use of the of PCI address translator less
> restrictive. At the end it will allow to use the mvebu_get_soc_id
> unconditionally.
>=20
> The mvebu SoC (such as Kirkwood, Dove or Armada XP for instance) come
> with an IP of a PCI controller. The ID and the revision of a SoC are
> stored in the registers of this controller. Being able to get this
> information allows to deals with errata more dynamically.
>=20
> To manage to read this information, we need to map the registers, and
> for this we need to use the of PCI translator which depend of the PCI
> support.
>=20
> However there are mvebu board without any PCI devices, and where
> selecting the PCI support would be useless.
>=20
> Moreover translating an address from a PCI node of the device-tree
> into a CPU physical address doesn't require the core PCI
> support. Those translations are just related to the device tree
> itself.
>=20
> The 1st patch introduces a new config symbol: OF_ADDRESS_PCI, which
> will be selected as soon as PCI will be selected, so we remains in th=
e
> same situation the current code. It should go to the of tree.
>=20
> The 2nd patch selects OF_ADDRESS_PCI as soon as ARCH_MVEBU will be
> selected. This will make mvebu_get_soc_id available even without the
> PCI support. It should go to the mvebu tree.
>=20
> Thanks,
>=20
> Gregory CLEMENT (2):
>   of: Allows to use the PCI translator without the PCI core
>   ARM: mvebu: Allows to get the SoC ID even without PCI enabled
>=20
>  arch/arm/mach-mvebu/Kconfig | 1 +
>  drivers/of/Kconfig          | 4 ++++
>  drivers/of/address.c        | 8 +++++---
>  3 files changed, 10 insertions(+), 3 deletions(-)
>=20
> --=20
> 1.8.1.2
>=20

On XP GP and CONFIG_PCI=3Dn, without the patches I get this:

  mvebu-soc-id: cannot map registers

and after applying the patches I have:

  mvebu-soc-id: MVEBU SoC ID=3D0x7846, Rev=3D0x2

Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Thanks for taking care of this.
--=20
Ezequiel Garc=C3=ADa, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
