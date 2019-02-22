From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/3] dt-bindings: net: btusb: add QCA6174A IDs
Date: Fri, 22 Feb 2019 10:05:46 -0800
Message-ID: <20190222180546.GB223791@google.com>
References: <20190222003403.128243-1-briannorris@chromium.org>
 <20190222003403.128243-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222003403.128243-2-briannorris@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, Rajat Jain <rajatja@google.com>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 04:34:02PM -0800, Brian Norris wrote:
> There are two USB PID/VID variations I've seen for this chip, and I want
> to utilize the 'interrupts' property defined here already.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/devicetree/bindings/net/btusb.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
> index 37d67926dd6d..43c96c3380a6 100644
> --- a/Documentation/devicetree/bindings/net/btusb.txt
> +++ b/Documentation/devicetree/bindings/net/btusb.txt
> @@ -9,6 +9,9 @@ Required properties:
>  		 (more may be added later) are:
>  
>  		  "usb1286,204e" (Marvell 8997)
> +		  "usb0cf3,e300" (Qualcomm QCA6174A)
> +		  "usb04ca,301a" (Qualcomm QCA6174A (Lite-On))
> +
>  
>  Also, vendors that use btusb may have device additional properties, e.g:
>  Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
