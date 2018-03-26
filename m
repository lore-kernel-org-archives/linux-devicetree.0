Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:23:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: ifc: Remove "simple-bus" from ifc
 compatible string
Message-ID: <20180326052602.o4gg3fzk2tyatiev@rob-hp-laptop>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
 <1521382651-10256-4-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521382651-10256-4-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 18, 2018 at 11:17:31AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>>
> 
> DTC warnings will be seen if these examples are used in a real dts file
> due to a mismatch in the unit address notation.
> 
> Remove "simple-bus" from the ifc compatible string to fix the warnings.  
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
