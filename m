Return-Path: <SRS0=LOhN=OJ=verge.net.au=horms@kernel.org>
Date: Fri, 30 Nov 2018 13:22:35 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] ARM: dts: r7s9210: Initial SoC device tree
Message-ID: <20181130122229.4iv6qgsnjyswoiiq@verge.net.au>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-2-chris.brandt@renesas.com>
 <20181130115500.twmtwnu352ukjm73@verge.net.au>
 <OSAPR01MB15534822E5E9CC52AA0BCE778AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB15534822E5E9CC52AA0BCE778AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Nov 30, 2018 at 12:04:57PM +0000, Chris Brandt wrote:
> Hi Simon,
> 
> 
> On Friday, November 30, 2018, Simon Horman wrote:
> > > +	cpg: clock-controller@fcfe0020 {
> > > +		compatible = "renesas,r7s9210-cpg-mssr";
> > > +		reg = <0xfcfe0010 0x455>;
> > 
> > There is a discrepancy here between the base address, fcfe0020
> > and the start address of the register range, 0xfcfe0010.
> 
> Good catch! Thank you.
> 
> 
> > > +	ostm0: timer@e803b000 {
> > > +		compatible = "renesas,r7s9210-ostm", "renesas,ostm";
> > > +		reg = <0xe803b000 0x30>;
> > 
> > 
> > Its not clear to me why the size of the register range is 0x30.
> 
> Because when reviewing the bindings docs, I was putting in 'exact' 
> values, but Geert said "those are ugly, just round up to make it look
> nicer".
> So instead of 0x21, I put 0x30.
> 
> You know...the standard answer: Throw Geert under the bus ;)

Lets leave 0x30 :)
