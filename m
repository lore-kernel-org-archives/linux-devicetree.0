Return-Path: <robherring2@gmail.com>
Date: Mon, 30 Jul 2018 17:16:06 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Message-ID: <20180730231606.GA9190@rob-hp-laptop>
References: <20180727165333.60598-1-chris.brandt@renesas.com>
 <20180727165333.60598-3-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180727165333.60598-3-chris.brandt@renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 27, 2018 at 11:53:33AM -0500, Chris Brandt wrote:
> Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.
> Also document new option for "renesas,bsid"
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
> * added "or Boundary Scan ID Register" to description
> v2:
>  * added Reviewed-by
>  * added renesas,bsid comment
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
