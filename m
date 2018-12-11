From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: rtc: sd3078: add device tree
 documentation
Date: Tue, 11 Dec 2018 15:40:08 -0600
Message-ID: <20181211214008.GA17683@bogus>
References: <1542968084-3982-1-git-send-email-long17.cool@163.com>
 <1542968084-3982-3-git-send-email-long17.cool@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542968084-3982-3-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: zoro <long17.cool@163.com>
Cc: alexandre.belloni@bootlin.com, a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 06:14:44PM +0800, zoro wrote:
> The devicetree documentation for the SD3078 device tree
> binding is added with a short example.
> 
> Signed-off-by: zoro <long17.cool@163.com>
> ---
>  .../devicetree/bindings/rtc/rtc-sd3078.txt         |   13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> new file mode 100644
> index 0000000..676cee8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
> @@ -0,0 +1,13 @@
> +SD3078 Real Time Clock
> +============================
> +
> +Required properties:
> +- compatible: Should contain "whwave,sd3078".
> +- reg: I2C address for chip.

If nothing else you can just add to bindings/rtc/rtc.txt (queued for 
4.21).

> +
> +Example:
> +
> +sd3078: sd3078@32 {

rtc@32

> +       compatible = "whwave,sd3078";
> +       reg = <0x32>;
> +};
> -- 
> 1.7.9.5
> 
> 
