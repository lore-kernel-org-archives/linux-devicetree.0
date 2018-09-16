Return-Path: <robherring2@gmail.com>
Message-ID: <5b9f3f5d.1c69fb81.bca6d.cdee@mx.google.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: egalax-ts: add support for wakeup event
 action
References: <1536139607-16848-1-git-send-email-Anson.Huang@nxp.com>
 <1536139607-16848-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536139607-16848-2-git-send-email-Anson.Huang@nxp.com>
Date: Sun, 16 Sep 2018 17:54:33 -0500
To: Anson Huang <Anson.Huang@nxp.com>
Cc: dmitry.torokhov@gmail.com, mark.rutland@arm.com, marco.franchi@nxp.com, fabio.estevam@nxp.com, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 05, 2018 at 05:26:47PM +0800, Anson Huang wrote:
> Add support for wakeup event action, this would allow the device
> to configure whether to be a wakeup source of system suspend.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> index 92fb262..296a9cd 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> @@ -6,6 +6,7 @@ Required properties:
>  - interrupts: touch controller interrupt
>  - wakeup-gpios: the gpio pin to be used for waking up the controller
>    and also used as irq pin

If the wakeup gpio is the same as the irq, then this should be removed 
since wakeup-source replaces it.

> +- wakeup-source: boolean, touch screen can wake-up the system
>  
>  Example:
>  
> @@ -15,4 +16,5 @@ Example:
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <9 2>;
>  		wakeup-gpios = <&gpio1 9 0>;
> +		wakeup-source;
>  	};
> -- 
> 2.7.4
> 
