From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/3] rsnd: dts: change to use extended audio dmac
 register
Date: Tue, 19 Mar 2019 13:06:46 +0100
Message-ID: <20190319120646.nqra6vjrvgynji3o@verge.net.au>
References: <20190319055705.24115-1-jiada_wang@mentor.com>
 <87va0fs92d.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87va0fs92d.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jiada Wang <jiada_wang@mentor.com>, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 03:07:15PM +0900, Kuninori Morimoto wrote:
> 
> Hi Jiada
> 
> > According to user reference manual for R-CAR H3, M3-W and M3-N SoCs,
> > in order to access busif4 ~ busif7, extended audio dmac registers
> > (PDMASAREn, PDMADAREn, PDMACHCREn)
> > need to be used, rather than basic audio dmac registers
> > (PDMASARn, PDMADARn, PDMACHCRn)
> > 
> > Now DT bindings has stated that extended Audio dmac register set need
> > to be used when available with patch
> > https://patchwork.kernel.org/patch/10856905/
> > 
> > This patch set updates H3 (= r8a7795), M3-W (= r8a7796) and M3-N (=r8a77965)
> > to use extended audio dmac register set.
> 
> For all patches
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks.

Could I ask for this series to be reposted as a single patch?
