From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 09/11] DT: arm: shmobile: document Condor board bindings
Date: Fri, 9 Feb 2018 10:18:46 +0100
Message-ID: <20180209091846.cj62onabse2ag47s@verge.net.au>
References: <CAMuHMdV+36Jff6ui1B_90GvPhTb7Xu7+_CaX44EcXxiLi3c=aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV+36Jff6ui1B_90GvPhTb7Xu7+_CaX44EcXxiLi3c=aQ@mail.gmail.com>
 <20180208201306.peirumr6hvu22uyt@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 08, 2018 at 02:13:06PM -0600, Rob Herring wrote:
> On Fri, Feb 02, 2018 at 09:45:08PM +0300, Sergei Shtylyov wrote:
> > Document the Condor device tree bindings, listing it as a supported board.
> > 
> > This allows to use checkpatch.pl to validate .dts files referring to the
> > Condor board.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> >  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
> >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

On Fri, Feb 09, 2018 at 08:27:34AM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 2, 2018 at 7:45 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Document the Condor device tree bindings, listing it as a supported board.
> >
> > This allows to use checkpatch.pl to validate .dts files referring to the
> > Condor board.
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>


Thanks, applied with the following subject:

dt-bindings: arm: document Condor board bindings
