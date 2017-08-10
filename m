From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/3] usb: gadget: udc: renesas_usb3: add support for
 R-Car M3-W
Date: Thu, 10 Aug 2017 12:42:21 -0500
Message-ID: <20170810174221.ovyl7bd64s6mjvyw@rob-hp-laptop>
References: <1501813018-6116-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1501813018-6116-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501813018-6116-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: balbi@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 04, 2017 at 11:16:58AM +0900, Yoshihiro Shimoda wrote:
> This patch adds support for R-Car M3-W. This patch also adds R-Car
> Gen3 generic version's compatible and changes ".compatible" in
> the usb3_of_match from "renesas,r8a7796-usb3-peri" to
> "renesas,rcar-gen3-usb3-peri".
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usb3.txt | 16 +++++++++++++---
>  drivers/usb/gadget/udc/renesas_usb3.c                  |  2 +-
>  2 files changed, 14 insertions(+), 4 deletions(-)

Binding looks fine, but...

> diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> index aa2b185..b1e166c 100644
> --- a/drivers/usb/gadget/udc/renesas_usb3.c
> +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> @@ -2503,7 +2503,7 @@ static void renesas_usb3_init_ram(struct renesas_usb3 *usb3, struct device *dev,
>  
>  static const struct of_device_id usb3_of_match[] = {
>  	{
> -		.compatible = "renesas,r8a7795-usb3-peri",
> +		.compatible = "renesas,rcar-gen3-usb3-peri",

You need to keep the existing string for compatibility with existing 
dtbs.

>  		.data = &renesas_usb3_priv_gen3,
>  	},
>  	{ },
> -- 
> 1.9.1
> 
