From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/2] phy: rcar-gen3-usb2: Add support for r8a77965
Date: Fri, 2 Mar 2018 13:45:28 +0530
Message-ID: <046ceb88-56a1-56d3-5945-026597822aa0@ti.com>
References: <1519710747-26435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1519710747-26435-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519710747-26435-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On Tuesday 27 February 2018 11:22 AM, Yoshihiro Shimoda wrote:
> This patch adds support for r8a77965 (R-Car M3-N). This SoC has
> dedicated pins.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c                     | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index 99b651b..dbd137c 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -8,6 +8,8 @@ Required properties:
>  	      SoC.
>  	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
>  	      SoC.
> +	      "renesas,usb2-phy-r8a77965" if the device is a part of an
> +	      R8A77965 SoC.

have dt-binding Documentation as a separate patch.

Thanks
Kishon
