From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
Date: Wed, 25 Jul 2018 18:08:36 +0200
Message-ID: <20180725160835.4z3zmrfnfwrca5st@verge.net.au>
References: <20180724114552.aybrijeonsj2tmcw@verge.net.au>
 <8f72716f-75b4-e8c0-3a77-9d709959e45d@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <8f72716f-75b4-e8c0-3a77-9d709959e45d@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 06:08:21PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 07/24/2018 02:45 PM, Simon Horman wrote:
> 
> [...]
> > On Tue, Jul 24, 2018 at 09:01:59AM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Jul 20, 2018 at 9:21 PM Sergei Shtylyov
> >> <sergei.shtylyov@cogentembedded.com> wrote:
> >>> Describe RWDT in the R8A77980 SoC device tree.
> >>>
> >>> Enable RWDT on the Condor and V3H Starter Kit boards.
> >>>
> >>> Based on the original (and large) patch by Vladimir Barinov.
> >>>
> >>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied for v4.20.
> 
>    Sorry, still not seeing any 'devel' branch updates... forgot to push?

I did push but, as discussed elsewhere, it seems that there was a glitch
in The Matrix. Updates are now there after repushing them.
