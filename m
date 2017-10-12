From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH  0/4] ARM: dts: Add USB function support
Date: Thu, 12 Oct 2017 13:47:51 +0200
Message-ID: <20171012114751.lyx7jrgjbhy2d47j@verge.net.au>
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 09, 2017 at 02:21:17PM +0100, Biju Das wrote:
> Hello,
> 
> This series aims to add USB function support for iWave RZ/G1M (R8A7743) board.
> This series has been tested against renesas-dev tag 201710109-v4.14-rc4.
> 
> This patch has documentation dependency on below patches
> 
> * [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
> https://patchwork.kernel.org/patch/9990063/
> * [v2] dmaengine: usb-dmac: Add compatible string for r8a7743/5
> https://patchwork.kernel.org/patch/9990113/
> 
> Regards,
> 
> Biju Das (4):
>   ARM: dts: r8a7743: Add HS-USB device node
>   ARM: dts: iwg20d-q7: Enable HS-USB
>   ARM: dts: r8a7743: Add USB-DMAC device nodes
>   ARM: dts: r8a7743: Enable DMA for HSUSB

Thanks, applied v1 of patches 1, 3 and 4, and v2 of patch 2.

In future when reposting a patch of a series please repost the
entire series anew, in this case it would have been v2 for the whole
series.

Thanks!
