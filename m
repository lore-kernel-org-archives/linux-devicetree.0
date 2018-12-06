From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 18/34] dt-bindings: arm: Convert FSL board/soc
 bindings to json-schema
Date: Thu, 6 Dec 2018 10:31:42 +0800
Message-ID: <20181206023140.GZ3987@dragon>
References: <20181203213223.16986-1-robh@kernel.org>
 <20181203213223.16986-19-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203213223.16986-19-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 03:32:07PM -0600, Rob Herring wrote:
> Convert Freescale SoC bindings to DT schema format using json-schema.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/armadeus.txt      |   6 -
>  Documentation/devicetree/bindings/arm/bhf.txt |   6 -
>  .../bindings/arm/compulab-boards.txt          |  25 --
>  Documentation/devicetree/bindings/arm/fsl.txt | 229 ------------------
>  .../devicetree/bindings/arm/fsl.yaml          | 214 ++++++++++++++++

Rob,

I do have any changes on bindings/arm/fsl.txt queued for 4.21 on my
tree, so please send it via your tree.

Acked-by: Shawn Guo <shawnguo@kernel.org>
