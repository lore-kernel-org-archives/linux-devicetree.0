From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 3/4] dt-bindings: rtc: sd3078: add device tree
 documentation
Date: Mon, 12 Nov 2018 16:49:19 +0100
Message-ID: <20181112154919.GB26341@piout.net>
References: <1542001514-8167-1-git-send-email-long17.cool@163.com>
 <1542001514-8167-3-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542001514-8167-3-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zoro <long17.cool@163.com>
Cc: a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This patch should come as 2/4 (BTW, I never got 4/4)

On 12/11/2018 13:45:14+0800, zoro wrote:
> The devicetree documentation for the SD3078 device tree
> binding is added with a short example.
> 
> Signed-off-by: zoro <long17.cool@163.com>
> ---
>  .../devicetree/bindings/rtc/rtc-sd3078.txt         |   15 +++++++++++++++
>  MAINTAINERS                                        |    1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> new file mode 100644
> index 0000000..9b45c8e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> @@ -0,0 +1,15 @@
> +SD3078 Real Time Clock
> +============================
> +
> +Required properties:
> +- compatible: Should contain "whwave,sd3078".
> +- reg: I2C address for chip.
> +
> +Example:
> +
> +sd3078: sd3078@32 {
> +       compatible = "whwave,sd3078";
> +       reg = <0x32>;
> +};
> +
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 002fcd7..50c038d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16130,6 +16130,7 @@ M:	Zoro Li <long17.cool@163.com>
>  L:	linux-rtc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/rtc/rtc-sd3078.c
> +F:	Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
>  

There is no need to list this file here if it is only done to silence
checkpatch.

>  WIIMOTE HID DRIVER
>  M:	David Herrmann <dh.herrmann@googlemail.com>
> -- 
> 1.7.9.5
> 
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
