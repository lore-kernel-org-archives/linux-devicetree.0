From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/7] arm64: dts: renesas: r8a77970: add VSPD support
Date: Mon, 9 Apr 2018 14:21:25 +0200
Message-ID: <20180409122124.qlzzuf5p6cp4jyf2@verge.net.au>
References: <1523020092-25540-1-git-send-email-jacopo+renesas@jmondi.org>
 <1523020092-25540-3-git-send-email-jacopo+renesas@jmondi.org>
 <3172265.bfWcyC1uqx@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3172265.bfWcyC1uqx@avalon>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, magnus.damm@gmail.com, geert@linux-m68k.org, niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 06, 2018 at 04:33:21PM +0300, Laurent Pinchart wrote:
> On Friday, 6 April 2018 16:08:07 EEST Jacopo Mondi wrote:
> > From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Describe VSPD0 in the R8A77970 device tree; it will be used by DU in
> > the next patch...
> > 
> > Based on the original (and large) patch by Daisuke Matsushita
> > <daisuke.matsushita.ns@hitachi.com>.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a77970.dtsi index 71f466d..db06c94 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -625,6 +625,16 @@
> >  			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >  			resets = <&cpg 603>;
> >  		};
> > +
> > +		vspd0: vsp@fea20000 {
> > +			compatible = "renesas,vsp2";
> > +			reg = <0 0xfea20000 0 0x4000>;
> 
> You need to extend the memory region to include the V6_CLUTn_TBL* registers. I 
> would recommend simply extending it to 0x8000 as all other VSP instances, even 
> if the registers at 0x7000-0x7fff are not implemented.
> 
> Apart from that,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I applied the first patch of this series. Please update this,
and any subsequent patches as appropriate and then repost the series
without the first patch.

Thanks
