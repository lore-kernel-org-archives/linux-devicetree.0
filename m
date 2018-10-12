Return-Path: <SRS0=r2bD=MY=arm.com=lorenzo.pieralisi@kernel.org>
Date: Fri, 12 Oct 2018 17:04:08 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
 r8a7744
Message-ID: <20181012160408.GE23257@e107981-ln.cambridge.arm.com>
References: <1538669267-17576-1-git-send-email-biju.das@bp.renesas.com>
 <20181008073445.ni4doozxflbqaanw@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008073445.ni4doozxflbqaanw@verge.net.au>
To: Simon Horman <horms@verge.net.au>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Oct 08, 2018 at 09:34:45AM +0200, Simon Horman wrote:
> On Thu, Oct 04, 2018 at 05:07:47PM +0100, Biju Das wrote:
> > Add support for r8a7744. The Renesas RZ/G1N (R8A7744) PCIe controller
> > is identical to the R-Car Gen2 family.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Simon, Biju,

I pulled the same binding for rcar2, I would pull this in the PCI tree
too unless you object, please let me know.

Thanks,
Lorenzo
