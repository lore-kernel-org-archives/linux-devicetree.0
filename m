Return-Path: <SRS0=SWKd=HQ=gmail.com=brandon.maier@kernel.org>
MIME-Version: 1.0
References: <20180422040132.1389-1-brandon.maier@gmail.com>
 <20180422040132.1389-2-brandon.maier@gmail.com> <20180427211355.lkuadz7elfz6prws@rob-hp-laptop>
In-Reply-To: <20180427211355.lkuadz7elfz6prws@rob-hp-laptop>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Fri, 27 Apr 2018 23:20:01 +0000
Message-ID: <CADwxmTn3fS50oAvqEj947RC5Hnq0q6666_CGvWU7KMmtOc=fvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: net: gmii2rgmii: Clarify proper usage
Content-Type: text/plain; charset="UTF-8"
To: robh@kernel.org
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 27, 2018 at 4:13 PM Rob Herring <robh@kernel.org> wrote:
...
> > +     gem0: ethernet@e000b000 {
> > +             compatible = "cdns,zynq-gem", "cdns,gem";
> > +             phy-handle = <&phy>;

> The phy here and...
...
> > +                     gmiitorgmii: gmiitorgmii@8 {
> > +                             compatible = "xlnx,gmii-to-rgmii-1.0";
> > +                             reg = <8>;
> > +                             phy-handle = <&phy>;

> ...here doesn't look right.


I don't see what you're referring to, they appear to match the
phy/phy-handle formats in Documentation/devicetree/bindings/net/phy.txt and
ethernet.txt. It's a bit odd that the label is just "phy", when most phy
labels are "phy0" etc., is that what should be changed?
