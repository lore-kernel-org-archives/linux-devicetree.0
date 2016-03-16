From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCHv2 00/31] ARM: dts: r8a779[0-4]: Reference both DMA
 controllers
Date: Wed, 16 Mar 2016 09:06:05 +0900
Message-ID: <20160316000603.GE6912@verge.net.au>
References: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2016 at 01:41:37PM +0100, Niklas S=C3=B6derlund wrote:
> Hi,
>=20
> R-Car Gen2 have two DMA controllers, which are equivalent. However DM=
A
> slaves were tied only to a single DMA controller in .dtsi. This serie=
s
> add references to to both DMA controllers for all nodes that previous=
ly
> only referenced one of them. It also adds dma references to the SDHI
> nodes for r8a7794 which according to the datasheet should work but I
> have not access to HW to verify.
>=20
> Tested on Koelsch (r8a7791) by altering the compatible value of eithe=
r
> dmac0 or dmac1 and verifying that the DMA slaves pick the DMA control=
ler
> that is instantiated.
>=20
> For your convince the series can be fetched from
> https://git.ragnatech.se/linux rcar-dmas-dt-2
>=20
> * Changes since v1
> - Rebase on top of renesas-devel-20160315-v4.5 and add dmas reference=
s
>   new nodes (r8a7790: scif2 r8a7793: i2c6,i2c7,i2c8).
> - Correct error in commit message 31/31 (s/QSPI/MMCIF).
> - Collect Ack and Reviewed tags from Geert.

Thanks Niklas,

I have queued these up for v4.7.
