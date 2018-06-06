Return-Path: <SRS0=iExR=IY=verge.net.au=horms@kernel.org>
Date: Wed, 6 Jun 2018 11:16:07 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: r8a77990 and ebisu: Enable
 USB2.0 host
Message-ID: <20180606091606.ac5lqgknevfrcq57@verge.net.au>
References: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528268171-19276-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 06, 2018 at 03:56:07PM +0900, Yoshihiro Shimoda wrote:
> This patch set is based on renesas-drivers.git /
> renesas-drivers-2018-06-05-v4.17 tag.
> 
> About dt-bindings of "renesas,usb2-phy-r8a77990", I submitted a patch:
> https://patchwork.kernel.org/patch/10449723/
> 
> But, the phy-rcar-gen3-usb2 driver works on the board without the bindings
> because "renesas,rcar-gen3-usb2-phy" can bind the driver.
> 
> Also, for now, I don't try to add/enable USB2.0 peripheral on the board
> because the phy driver needs some modifications.
> 
> Yoshihiro Shimoda (4):
>   arm64: dts: renesas: r8a77990: add usb2_phy device node
>   arm64: dts: renesas: r8a77990: add USB2.0 host device nodes
>   arm64: dts: renesas: r8a77990: ebisu: enable usb2_phy0
>   arm64: dts: renesas: r8a77990: ebisu: enable USB2.0 host
> 
>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 20 ++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi      | 37 ++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)

Hi Shomoda-san,

the contents of this series looks good to me.  However, given Olof
Johansson's recent comments in ("Re: [GIT PULL] Renesas ARM64 Based SoC DT
Updates for v4.18") please consider squashing this series into a single
patch and reposting.

Thanks!
