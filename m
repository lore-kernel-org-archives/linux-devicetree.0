From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 02/14] dt-bindings: display, renesas,du: Document cmms
 property
Date: Tue, 27 Aug 2019 15:29:45 -0500
Message-ID: <20190827202945.GA3488@bogus>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-3-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-3-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org, horms@verge.net.au, uli@fpond.eu, airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp, VenkataRajesh.Kalakodima@in.bosch.com, Harsha.ManjulaMallikarjun@in.bosch.com, linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Sun, Aug 25, 2019 at 03:51:42PM +0200, Jacopo Mondi wrote:
> Document the newly added 'cmms' property which accepts a list of phandle
> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index c97dfacad281..c2265e2a1af2 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -45,6 +45,10 @@ Required Properties:
>      instance that serves the DU channel, and the channel index identifies the
>      LIF instance in that VSP.
> 
> +  - cmms: A list of phandles to the CMM instances present in the SoC, one
> +    for each available DU channel. The property shall not be specified for
> +    SoCs that do not provide any CMM (such as V3M and V3H).

renesas,cmms

Perhaps define what CMM is.

> +
>  Required nodes:
> 
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -91,6 +95,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
>  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +		cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
> 
>  		ports {
>  			#address-cells = <1>;
> --
> 2.22.0
> 
