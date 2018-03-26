Return-Path: <robherring2@gmail.com>
Date: Mon, 26 Mar 2018 17:23:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] Revert "dt-bindings: ifc: Fix the unit address
 format in the examples"
Message-ID: <20180326052444.cxkp6wkjdd247bzv@rob-hp-laptop>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
 <1521382651-10256-3-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521382651-10256-3-git-send-email-festevam@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Mar 18, 2018 at 11:17:30AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> This reverts commit 4e017f1419397473cf3db6e9fa020013998b1aa4.
> 
> As explained by Rob Herring:
> 
> "This "fix" is wrong. Memory controllers with chip selects should have
> the chip select in the unit-address. The correct fix here is you should drop
> "simple-bus"."
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
