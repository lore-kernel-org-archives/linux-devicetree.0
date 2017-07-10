From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: sram: Document renesas,smp-sram
Date: Sun, 9 Jul 2017 20:08:27 -0500
Message-ID: <20170710010827.qj2vw3fqalbzspfj@rob-hp-laptop>
References: <1499182903-31339-1-git-send-email-geert+renesas@glider.be>
 <1499182903-31339-2-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499182903-31339-2-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 04, 2017 at 05:41:35PM +0200, Geert Uytterhoeven wrote:
> Document reserved SRAM for the SMP jump stub on Renesas R-Car Gen2 and
> RZ/G1 SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/sram/renesas,smp-sram.txt  | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sram/renesas,smp-sram.txt

Acked-by: Rob Herring <robh@kernel.org>
