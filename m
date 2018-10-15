Return-Path: <robherring2@gmail.com>
Date: Mon, 15 Oct 2018 15:18:23 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: rcar-thermal: document
 R8A77970  bindings
Message-ID: <20181015201823.GA5208@bogus>
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
 <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42fe460f-0c2e-ec8c-ecca-15ec5a5a4117@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, 5 Oct 2018 00:01:38 +0300, Sergei Shtylyov wrote:
> Document  the R-Car V3M (R8A77970) SoC in the Renesas R-Car gen2 thermal
> bindings. The hardware is the same as  in the R-Car D3 (R8A77995) plus an
> extra status register.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
