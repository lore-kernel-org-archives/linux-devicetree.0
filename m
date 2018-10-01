Return-Path: <SRS0=9BQ+=MN=verge.net.au=horms@kernel.org>
Date: Mon, 1 Oct 2018 14:56:37 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: PCI: rcar: Add device tree support for
 r8a7744
Message-ID: <20181001125637.g6isjlpvarylas6q@verge.net.au>
References: <1538051331-14860-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538051331-14860-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 27, 2018 at 01:28:51PM +0100, Biju Das wrote:
> Add internal PCI bridge support for r8a7744 SoC.  The Renesas RZ/G1N
> (R8A7744) internal PCI bridge is identical to the R-Car Gen2 family.
> 
> This doesn't change the driver, so it does nothing by itself.  But it does
> mean that checkpatch won't complain about a future patch that adds
> "renesas,pci-r8a7744" to a DT, which helps ensure that shipped DTs use
> documented compatibility strings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
