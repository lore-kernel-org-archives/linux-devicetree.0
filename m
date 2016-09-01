From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 0/12] arm64: renesas: add H3ULCB board
Date: Thu, 1 Sep 2016 16:27:08 +0200
Message-ID: <20160901142707.GJ14300@verge.net.au>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdX4sxY4_FKemcQfYtvCr5ZZ52nTqnRtp5G42X93UTT8aw@mail.gmail.com>
 <20160901141711.GE14300@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160901141711.GE14300@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 01, 2016 at 04:17:12PM +0200, Simon Horman wrote:
> On Thu, Sep 01, 2016 at 10:39:04AM +0200, Geert Uytterhoeven wrote:
> > Hi Vladimir,
> > 
> > On Wed, Aug 31, 2016 at 12:01 PM, Vladimir Barinov
> > <vladimir.barinov@cogentembedded.com> wrote:
> > > This adds the folowing:
> > > - R8A7795 SoC based H3ULCB low cost board device tree
> > > - Document DT bindings
> > 
> > Thanks for your split series!
> 
> Likewise. And thanks Geert for your review.
> 
> 
> > > Vladimir Barinov (12):
> > > [01/12] dt: arm: shmobile: add H3ULCB board DT bindings
> 
> I have queued up the above patch after renaming it
> arm64: dts: h3ulcb: enable USB2.0 Host channel 1

Cut an paste error (that is the parent commit in my tree).
I meant to say:

  arm64: dts: h3ulcb: add H3ULCB board DT bindings

> > > [02/12] arm64: dts: h3ulcb: initial device tree
> > > [03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
> > > [04/12] arm64: dts: h3ulcb: enable EthernetAVB
> > > [05/12] arm64: dts: h3ulcb: enable GPIO leds
> > > [06/12] arm64: dts: h3ulcb: enable SDHI0
> > > [07/12] arm64: dts: h3ulcb: enable I2C2
> > > [08/12] arm64: dts: h3ulcb: enable EXTALR clk
> > > [09/12] arm64: dts: h3ulcb: enable WDT
> > > [10/12] arm64: dts: h3ulcb: enable USB2 PHY of channel 1
> > > [11/12] arm64: dts: h3ulcb: enable USB2.0 Host channel 1
> > 
> > I went through all of the above...
> 
> I have also queued up 02,03,04,07,08,09,11/12.
> 
> > > [12/12] arm64: dts: h3ulcb: Sound SSI support
> > 
> > ... but I'm leaving this one for Morimoto-san.
> 
