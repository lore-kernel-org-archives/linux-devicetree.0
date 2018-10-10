Return-Path: <SRS0=+6fA=MW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33443 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbeJJRo6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Oct 2018 13:44:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id o21-v6so3565702lfe.0
        for <devicetree@vger.kernel.org>; Wed, 10 Oct 2018 03:23:27 -0700 (PDT)
Date: Wed, 10 Oct 2018 12:23:24 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-gen3-thermal: document
 R8A77980 bindings
Message-ID: <20181010102324.GZ24305@bigcity.dyn.berto.se>
References: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
 <e53d379f-bb72-51f7-9216-b3eb1bbe04b5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e53d379f-bb72-51f7-9216-b3eb1bbe04b5@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

Thanks for your work.

On 2018-10-09 22:10:14 +0300, Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the Renesas R-Car gen3 thermal
> bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> 
> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Index: linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> ===================================================================
> --- linux-soc-thermal.orig/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ linux-soc-thermal/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -10,6 +10,7 @@ Required properties:
>  			    - "renesas,r8a7795-thermal" (R-Car H3)
>  			    - "renesas,r8a7796-thermal" (R-Car M3-W)
>  			    - "renesas,r8a77965-thermal" (R-Car M3-N)
> +			    - "renesas,r8a77980-thermal" (R-Car V3H)
>  - reg			: Address ranges of the thermal registers. Each sensor
>  			  needs one address range. Sorting must be done in
>  			  increasing order according to datasheet, i.e.
> @@ -19,7 +20,8 @@ Required properties:
>  
>  Optional properties:
>  
> -- interrupts           : interrupts routed to the TSC (3 for H3, M3-W and M3-N)
> +- interrupts		: interrupts routed to the TSC (3 for H3, M3-W, M3-N,
> +			  and V3H)
>  - power-domain		: Must contain a reference to the power domain. This
>  			  property is mandatory if the thermal sensor instance
>  			  is part of a controllable power domain.

-- 
Regards,
Niklas S�derlund
