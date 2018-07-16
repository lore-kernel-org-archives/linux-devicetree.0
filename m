Return-Path: <robherring2@gmail.com>
Date: Mon, 16 Jul 2018 15:17:55 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: usb-xhci: Add r8a77990 support
Message-ID: <20180716211755.GA2679@rob-hp-laptop>
References: <1530615107-7733-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530615107-7733-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jul 03, 2018 at 07:51:47PM +0900, Yoshihiro Shimoda wrote:
> This patch adds r8a77990 xhci support. The driver will use
> the fallback compatible string "renesas,rcar-gen3-xhci".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  After we applied the following patches, the driver will use
> the fallback compatible string "renesas,rcar-gen3-xhci" on
> r8a77990. (If we doesn't apply the patches, the driver cannot
> get the firmware name, and then the probe on r8a77990 failed.)
> 
>  https://patchwork.kernel.org/patch/10503777/
>  https://patchwork.kernel.org/patch/10503781/
> 
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
