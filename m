From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add MMC support
Date: Tue, 24 Apr 2018 11:22:20 +0200
Message-ID: <20180424092220.s6qgtxloinmimqa7@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
 <20180420095857.latofivdh3dnvu2z@verge.net.au>
 <5be1ecdb-8f36-ca1e-aba6-012fbb263894@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <5be1ecdb-8f36-ca1e-aba6-012fbb263894@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 20, 2018 at 10:06:03PM +0300, Sergei Shtylyov wrote:
> On 04/20/2018 12:58 PM, Simon Horman wrote:
> 
> >> Define the generic R8A77980 part of the MMC0 (SDHI2) device node.
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> ---
> >>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> ===================================================================
> >> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> @@ -371,6 +371,18 @@
> >>  			dma-channels = <16>;
> >>  		};
> >>  
> >> +		mmc0: mmc@ee140000 {
> > 
> > Please use sdhi2: sd@ee140000 for consistency with other SoCs
> > (I refereed to the r8a7795).
> 
>    Mmm... note that this controller has MMC signals (8 data bits, DS, no CD/WP),
> see manual v0.55. I think it's more correct to call it MMC0 (trken from the
> manual as well)...

Ok, point taken. I've applied this. But in general I would like the
dtsi files to be consistent where it makes sense.
