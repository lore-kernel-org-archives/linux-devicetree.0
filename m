Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Jun 2018 13:28:13 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: Renesas R-Car Gen3 PCIe PHY
 bindings
Message-ID: <20180612192813.GA13278@rob-hp-laptop>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
 <9293ae00-8684-962a-346e-13cb12e5cddb@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9293ae00-8684-962a-346e-13cb12e5cddb@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sun, Jun 10, 2018 at 09:22:46PM +0300, Sergei Shtylyov wrote:
> This PHY is  still  mostly undocumented --  the only documented registers
> exist on R-Car V3H (R8A77980) SoC.  Add the corresponding device tree
> bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - split from the big driver/bindings patch;
> - got rid of the generic R-Car gen3 "compatible" prop value.
> 
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt |   24 +++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
