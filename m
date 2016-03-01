From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
Date: Tue, 1 Mar 2016 11:27:33 +0100
Message-ID: <56D56E95.4030204@atmel.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454322360-8666-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 01/02/2016 11:25, Romain Izard a =E9crit :
> The NAND Flash controller for SAMA5D2 has small differences that make=
 it
> impossible to use the existing driver for SAMA5D3. This patchset uses=
 the
> device tree's compatible string to get those differences, and the cod=
e is
> slightly modified to handle them.
>=20
> Base on linux-mtd-next, commit 15c0be7bec002f9a529dd0966d0db96dde176f=
d0
>=20
> See previous revisions to apply on the Atmel Linux 4.1 branch.
>=20
> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there=
 is no
> existing SAMA5D2 board with NAND Flash memory (yet).

Brian,

Hi, do we need to resend this series with all the tags collected (aka
ping ;-)) ?

Bye,


> V3 -> V2:
> - Rebase on linux-mtd-next
> - Skip patches already in the tree
>=20
> V2 -> V1:
> - Rebase on v4.4
> - Use of_device_get_match_data
> - Split message cleanup
> - Reword a small part of the atmel_nand device tree binding
> - Use 'caps' for all private data structures
>=20
> RFC -> V1:
> - Split the support of 32-bit ECC on SAMA5D2 in two commits
> - Fix the missing ECC strength configuration code
>=20
> Romain Izard (5):
>   mtd: atmel_nand: Support variable RB_EDGE interrupts
>   dt-bindings: atmel_nand: Reword the documenation
>   mtd: atmel_nand: Support PMECC on SAMA5D2
>   mtd: atmel_nand: Support 32-bit ECC strength
>   ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
>=20
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 31 +++++----
>  arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++++
>  drivers/mtd/nand/atmel_nand.c                      | 77 ++++++++++++=
++++++----
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  5 files changed, 131 insertions(+), 27 deletions(-)
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
