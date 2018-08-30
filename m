From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
Date: Thu, 30 Aug 2018 14:16:08 +0200
Message-ID: <20180830121608.ei3dapfoziuvbkaj@verge.net.au>
References: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
 <1535014731-64472-5-git-send-email-biju.das@bp.renesas.com>
 <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
 <TY1PR01MB17707A80E98DE4602177C8EBC0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20180828122043.h7vup3e5gamfzejz@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180828122043.h7vup3e5gamfzejz@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 02:20:44PM +0200, Simon Horman wrote:
> On Fri, Aug 24, 2018 at 09:06:49AM +0000, Fabrizio Castro wrote:
> > Hello Simon,
> > 
> > Thank you for your feedback!
> > 
> > > Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
> > >
> > > On Thu, Aug 23, 2018 at 09:58:50AM +0100, Biju Das wrote:
> > > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > This patch adds the SoC specific part of the Ethernet AVB
> > > > device tree node.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 45 +++++++++++++++++++++++++++++++
> > > >  1 file changed, 45 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > index 15d7785..b771211 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > > @@ -350,6 +350,51 @@
> > > >  dma-channels = <16>;
> > > >  };
> > > >
> > > > +avb: ethernet@e6800000 {
> > > > +compatible = "renesas,etheravb-r8a774a1",
> > > > +     "renesas,etheravb-rcar-gen3";
> > > > +reg = <0 0xe6800000 0 0x800>;
> > >
> > > Should a region, <0 0xe6a00000 0 0x10000>, also be added
> > > here to describe the suggested space for descriptors?
> > 
> > There is no STBE (Stream Buffer for EthernetAVB-IF) on the r8a774a1, and that's why this node doesn't come with such a region.
> 
> Thanks for the follow-up. In that case I'm fine with this patch but
> I'd like to wait a little longer to allow review by others.

Thanks again, applied for v4.20.
