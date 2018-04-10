Return-Path: <SRS0=b8Rb=G7=verge.net.au=horms@kernel.org>
Date: Tue, 10 Apr 2018 11:31:28 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] phy: Renesas R-Car gen3 PCIe PHY driver
Message-ID: <20180410093128.l6ornliuosnwkoyt@verge.net.au>
References: <0f28c74d-f35a-5ccb-eeba-f21ae39c3857@cogentembedded.com>
 <CAMuHMdXNg32ECS+xNH46qK58JoU=VC_kbqhaVXD4xGZC16wY3A@mail.gmail.com>
 <267e381f-64d7-ea76-b5b7-96e71f9536ce@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <267e381f-64d7-ea76-b5b7-96e71f9536ce@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Apr 09, 2018 at 06:57:11PM +0300, Sergei Shtylyov wrote:
> On 04/09/2018 12:46 PM, Geert Uytterhoeven wrote:
> 
> >> This PHY is still mostly undocumented -- the only documented registers
> >> exist on R-Car V3H (R8A77980) SoC  where this PHY stays in a powered-down
> >> state after a reset and thus  we must power it on for PCIe to work...
> > 
> > Bogus spaces slipping in again?
> 
>    Yes, I should have worked in the type-setting. :-)
> 
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> >> --- /dev/null
> >> +++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
> >> @@ -0,0 +1,32 @@
> [...]
> >> +Example (R-Car V3H):
> >> +
> >> +       pcie-phy@e65d0000 {
> >> +               compatible = "renesas,r8a77980-pcie-phy",
> >> +                            "renesas,rcar-gen3-pcie-phy";
> > 
> > Is the R8A77980 PCIe PHY compatible with the generic version, given it needs
> > to be powered up explicitly?
> 
>    I assumed it's upwardly compatible. However, given the lack of information,
> it might not be...

If we are not sure I'd rather assume that it is not upwardly compatible.
Because falling back to something that doesn't work does not seem at all
useful to me.

...
