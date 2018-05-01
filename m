Return-Path: <robherring2@gmail.com>
Date: Tue, 1 May 2018 08:16:48 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: net: gmii2rgmii: Clarify proper usage
Message-ID: <20180501131648.GA4135@rob-hp-laptop>
References: <20180422040132.1389-1-brandon.maier@gmail.com>
 <20180422040132.1389-2-brandon.maier@gmail.com>
 <20180427211355.lkuadz7elfz6prws@rob-hp-laptop>
 <CADwxmTn3fS50oAvqEj947RC5Hnq0q6666_CGvWU7KMmtOc=fvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADwxmTn3fS50oAvqEj947RC5Hnq0q6666_CGvWU7KMmtOc=fvw@mail.gmail.com>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 27, 2018 at 11:20:01PM +0000, Brandon Maier wrote:
> On Fri, Apr 27, 2018 at 4:13 PM Rob Herring <robh@kernel.org> wrote:
> ...
> > > +     gem0: ethernet@e000b000 {
> > > +             compatible = "cdns,zynq-gem", "cdns,gem";
> > > +             phy-handle = <&phy>;
> 
> > The phy here and...
> ...
> > > +                     gmiitorgmii: gmiitorgmii@8 {
> > > +                             compatible = "xlnx,gmii-to-rgmii-1.0";
> > > +                             reg = <8>;
> > > +                             phy-handle = <&phy>;
> 
> > ...here doesn't look right.
> 
> 
> I don't see what you're referring to, they appear to match the
> phy/phy-handle formats in Documentation/devicetree/bindings/net/phy.txt and
> ethernet.txt. It's a bit odd that the label is just "phy", when most phy
> labels are "phy0" etc., is that what should be changed?

You don't need both properties. If the ethernet driver needs the phy, 
then it can decend into the child nodes to find it.

Rob
