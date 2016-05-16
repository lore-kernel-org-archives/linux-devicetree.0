From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCHv4 0/4] Reference both DMA controllers
Date: Mon, 16 May 2016 17:11:08 +0900
Message-ID: <20160516081108.GB4955@verge.net.au>
References: <1463043285-14702-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463043285-14702-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: magnus.damm@gmail.com, geert@linux-m68k.org, arnd@arndb.de, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 12, 2016 at 10:54:41AM +0200, Niklas S=C3=B6derlund wrote:
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
> that is available.

Thanks, I have queued these up.
