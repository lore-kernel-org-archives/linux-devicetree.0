From: Aleksandar Markovic <Aleksandar.Markovic@mips.com>
Subject: RE: [PATCH 1/2] dt-bindings: Document mti,mips-cpc binding
Date: Mon, 18 Dec 2017 15:38:16 +0000
Message-ID: <BD3A5F1946F2E540A31AF2CE969BAEEEC27E53@MIPSMAIL01.mipstec.com>
References: <1513356723-7393-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1513356723-7393-2-git-send-email-aleksandar.markovic@rt-rk.com>,<20171216182638.3vd2rbkyos74e4jo@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171216182638.3vd2rbkyos74e4jo@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Paul Burton <Paul.Burton@mips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Douglas Leung <Douglas.Leung@mips.com>, Goran Ferenc <Goran.Ferenc@mips.com>, James Hogan <James.Hogan@mips.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Miodrag Dinic <Miodrag.Dinic@mips.com>, Petar Jovanovic <Petar.Jovanovic@mips.com>, Raghu Gandham <Raghu.Gandham@mips.com>
List-Id: devicetree@vger.kernel.org

> From: Rob Herring [robh@kernel.org]
> Sent: Saturday, December 16, 2017 7:26 PM
> To: Aleksandar Markovic
> Subject: Re: [PATCH 1/2] dt-bindings: Document mti,mips-cpc binding
>
> On Fri, Dec 15, 2017 at 05:51:59PM +0100, Aleksandar Markovic wrote:
> > From: Paul Burton <paul.burton@mips.com>
> >
> > Document a binding for the MIPS Cluster Power Controller (CPC) which
> > simply allows the device tree to specify where the CPC registers should
> > be mapped.
> >
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> > Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
> > ---
> >  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> >
..
> > +++ b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
> > @@ -0,0 +1,8 @@
> > +Binding for MIPS Cluster Power Controller (CPC).
> > +
> > +This binding allows a system to specify where the CPC registers should be
> > +mapped using device tree.
> 
> Not really where you map registers, but where they are located.
> 

This will be corrected in the next version.

> > +
> > +Required properties:
> > +compatible : Should be "mti,mips-cpc".
> 
> Only one version of the block?
> 

I am not clear what you mean by "version of the block". I you meant
number of allowed values for *compatible* property, yes, we want and
need just one such value (string).

> > +regs: Should describe the address & size of the CPC register region.
> > --
