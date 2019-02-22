From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 2/3] dt-bindings: net: btusb: add QCA6174A IDs
Date: Fri, 22 Feb 2019 21:57:29 +0000
Message-ID: <5efc9f02-eeb8-78cc-0f11-13e0010efd46@arm.com>
References: <20190222003403.128243-1-briannorris@chromium.org>
 <20190222003403.128243-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222003403.128243-2-briannorris@chromium.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Rajat Jain <rajatja@google.com>, Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-02-22 12:34 am, Brian Norris wrote:
> There are two USB PID/VID variations I've seen for this chip, and I want
> to utilize the 'interrupts' property defined here already.
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>   Documentation/devicetree/bindings/net/btusb.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/btusb.txt b/Documentation/devicetree/bindings/net/btusb.txt
> index 37d67926dd6d..43c96c3380a6 100644
> --- a/Documentation/devicetree/bindings/net/btusb.txt
> +++ b/Documentation/devicetree/bindings/net/btusb.txt
> @@ -9,6 +9,9 @@ Required properties:
>   		 (more may be added later) are:
>   
>   		  "usb1286,204e" (Marvell 8997)
> +		  "usb0cf3,e300" (Qualcomm QCA6174A)
> +		  "usb04ca,301a" (Qualcomm QCA6174A (Lite-On))

Nit: the USB device binding states that those leading zeroes in the VIDs 
should be suppressed.

Otherwise, thanks for the tip-off - I hadn't realised that OOB interrupt 
support was fully implemented already. I'll have to give this a go for 
the Realtek module in one of my TV boxes :)

Robin.

> +
>   
>   Also, vendors that use btusb may have device additional properties, e.g:
>   Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
> 
