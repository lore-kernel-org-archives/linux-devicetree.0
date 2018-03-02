From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/2] phy: rcar-gen3-usb3: Add binding for r8a77965
Date: Fri, 2 Mar 2018 13:44:37 +0530
Message-ID: <6df55c1d-8855-7aff-af13-cf0f43cc5f8b@ti.com>
References: <1519710747-26435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1519710747-26435-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519710747-26435-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Tuesday 27 February 2018 11:22 AM, Yoshihiro Shimoda wrote:
> This patch adds binding for r8a77965 (R-Car M3-N).

$subject should be  dt-bindings: rcar-gen3-phy-usb3: Add binding for r8a77965

Thanks
Kishon
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> index f94cea4..47dd296 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb3.txt
> @@ -11,6 +11,8 @@ Required properties:
>  	      SoC.
>  	      "renesas,r8a7796-usb3-phy" if the device is a part of an R8A7796
>  	      SoC.
> +	      "renesas,r8a77965-usb3-phy" if the device is a part of an
> +	      R8A77965 SoC.
>  	      "renesas,rcar-gen3-usb3-phy" for a generic R-Car Gen3 compatible
>  	      device.
>  
> 
