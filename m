From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
Date: Tue, 24 Jul 2018 13:45:53 +0200
Message-ID: <20180724114552.aybrijeonsj2tmcw@verge.net.au>
References: <CAMuHMdVeyaU9iKnubhzkjN8Fd-Z-=r+yoF+_jGoFxDzPdwbSpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeyaU9iKnubhzkjN8Fd-Z-=r+yoF+_jGoFxDzPdwbSpQ@mail.gmail.com>
 <4eb91e29-9c2f-6f7c-2b3c-983e41430e26@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 07:14:28PM +0300, Sergei Shtylyov wrote:
> On 07/23/2018 07:08 PM, Simon Horman wrote:
> 
> >> Describe RWDT in the R8A77980 SoC device tree.
> >>
> >> Enable RWDT on the Condor and V3H Starter Kit boards.
> >>
> >> Based on the original (and large) patch by Vladimir Barinov.
> >>
> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> ---
> >> The patch is against the 'renesas-devel-20180720-v4.18-rc5' of Simon Horman's
> >> 'renesas.git' repo.  It depends on Geert Uytterhoeven's clock driver patches
> >> (adding the RWDT clock) in order to work...
> > 
> > But it is safe to apply without those patches, right?
> 
>    The RWDT driver should just fail to probe with -ENOENT. 

...

On Tue, Jul 24, 2018 at 09:01:59AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 20, 2018 at 9:21 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Describe RWDT in the R8A77980 SoC device tree.
> >
> > Enable RWDT on the Condor and V3H Starter Kit boards.
> >
> > Based on the original (and large) patch by Vladimir Barinov.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.20.
