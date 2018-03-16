From: afzal mohammed <afzal.mohd.ma@gmail.com>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I
 laptop
Date: Fri, 16 Mar 2018 12:07:53 +0530
Message-ID: <20180316063753.GB3415@afzalpc>
References: <20180315162510.11669-1-harald@ccbib.org>
 <20180315162510.11669-6-harald@ccbib.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180315162510.11669-6-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Harald Geyer <harald@ccbib.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Mar 15, 2018 at 04:25:10PM +0000, Harald Geyer wrote:
> The TERES-I is an open hardware laptop built by Olimex using the
> Allwinner A64 SoC.
> 
> Add the board specific .dts file, which includes the A64 .dtsi and
> enables the peripherals that we support so far.
> 
> Signed-off-by: Harald Geyer <harald@ccbib.org>

Received only patch 4 & 5 in my inbox, receive path was via
linux-kernel rather than linux-arm-kernel, but in both archives all
patches are seen (though threading seems not right), probably missing
patches are due to issue gmail have with LKML,

so had to pull the series from patchwork, for the series,

Tested-by: afzal mohammed <afzal.mohd.ma@gmail.com>

afzal
