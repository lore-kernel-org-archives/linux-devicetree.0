From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  0/3] ARM: dts: Add PCIEC support
Date: Mon, 20 Nov 2017 11:16:50 +0100
Message-ID: <20171120101649.laatlo7lj5mpuswd@verge.net.au>
References: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510594992-63806-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 13, 2017 at 05:43:09PM +0000, Biju Das wrote:
> Hello,
> 
> This series aims to add PCIEC support for iWave RZ/G1M (R8A7743) board.
> 
> This patch has documentation dependency on below patch
> 
> * dt-bindings: PCI: rcar: Add device tree support for r8a7743
> https://patchwork.kernel.org/patch/10056407/
> 
> This patch series has dependency on below patches
> 
> * ARM: dts: r8a7743: Add CAN[01] SoC support
> https://patchwork.kernel.org/patch/10046875/
> 
> * ARM: dts: iwg20d-q7-common: Add can0 support to carrier board
> https://patchwork.kernel.org/patch/10046879/
> 
> Biju Das (3):
>   ARM: dts: r8a7743: Add default PCIe bus clock
>   ARM: dts: r8a7743: Add PCIe Controller device node
>   ARM: dts: iwg20d-q7: Enable PCIe Controller

Thanks, applied.
