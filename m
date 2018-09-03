From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1] arm64: dts: dwc3: Add description of
 'configure-gfladj'
Date: Mon, 3 Sep 2018 09:19:33 +0800
Message-ID: <20180903011931.GB3850@dragon>
References: <20180829073324.36866-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180829073324.36866-1-yinbo.zhu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yinbo Zhu <yinbo.zhu@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, xiaobo.xie@nxp.com, Ran Wang <ran.wang_1@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, festevam@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Aug 29, 2018 at 03:33:24PM +0800, Yinbo Zhu wrote:
> This patch is to add description of 'configure-gfladj' to binding
> so that configuring devicetree
> 
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>

Ah, okay.  You just started documenting the binding.  So please send me
dts patch only after the corresponding bindings and driver code are
accepted.

Shawn

> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> index 3e4c38b..40c6568 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -101,6 +101,7 @@ Optional properties:
>  			When just one value, which means INCRX burst mode enabled. When
>  			more than one value, which means undefined length INCR burst type
>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> + - configure-gfladj: determine whether frame length adjustment is required or not.
>  
>   - in addition all properties from usb-xhci.txt from the current directory are
>     supported as well
> -- 
> 1.7.1
> 
