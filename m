From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] clk: shmobile: Deprecate renesas,clock-indices
Date: Thu, 30 Oct 2014 10:46:59 +0900
Message-ID: <20141030014658.GA26159@verge.net.au>
References: <1414592353-24044-1-git-send-email-geert+renesas@glider.be>
 <1414592353-24044-2-git-send-email-geert+renesas@glider.be>
 <20141030010619.GF22052@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141030010619.GF22052@verge.net.au>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mike Turquette <mturquette@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, devicetree@vger.kernel.org, linux-sh@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 30, 2014 at 10:06:20AM +0900, Simon Horman wrote:
> On Wed, Oct 29, 2014 at 03:19:08PM +0100, Geert Uytterhoeven wrote:
> > Commit 8e33f91a0b84ae19 ("clk: shmobile: clk-mstp: change to using
> > clock-indices") forgot to mark "renesas,clock-indices" deprecated in
> > the driver-specific binding documentation.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks Geert.
> 
> Mike, this documentation update reflects the implementation.
> 
> I'd appreciate it if you could pick this up (or at least indicate that
> you intend to) so I can pick up the remaining in this series that
> make use of the new binding.

Sorry, I forgot one thing:

Acked-by: Simon Horman <horms+renesas@verge.net.au>

> > ---
> >  .../devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt        | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > index a5f52238c80d5f9b..26ab9fc499f51113 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt
> > @@ -26,11 +26,12 @@ Required Properties:
> >      must appear in the same order as the output clocks.
> >    - #clock-cells: Must be 1
> >    - clock-output-names: The name of the clocks as free-form strings
> > -  - renesas,clock-indices: Indices of the gate clocks into the group (0 to 31)
> > +  - clock-indices: Indices of the gate clocks into the group (0 to 31)
> > +    ("renesas,clock-indices" is deprecated)
> >  
> > -The clocks, clock-output-names and renesas,clock-indices properties contain one
> > -entry per gate clock. The MSTP groups are sparsely populated. Unimplemented
> > -gate clocks must not be declared.
> > +The clocks, clock-output-names and clock-indices properties contain one entry
> > +per gate clock. The MSTP groups are sparsely populated. Unimplemented gate
> > +clocks must not be declared.
> >  
> >  
> >  Example
> > -- 
> > 1.9.1
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-sh" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
