From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a774a1: Add RWDT node
Date: Thu, 30 Aug 2018 14:16:59 +0200
Message-ID: <20180830121658.4wiykfs4xac3bmha@verge.net.au>
References: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
 <1535014731-64472-6-git-send-email-biju.das@bp.renesas.com>
 <20180824090502.kmip6uvom4zkhed2@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180824090502.kmip6uvom4zkhed2@verge.net.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 24, 2018 at 11:05:03AM +0200, Simon Horman wrote:
> On Thu, Aug 23, 2018 at 09:58:51AM +0100, Biju Das wrote:
> > Add a device node for the Watchdog Timer (RWDT) controller on the Renesas
> > RZ/G2M (r8a774a1) SoC.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again, applied for v4.20.
