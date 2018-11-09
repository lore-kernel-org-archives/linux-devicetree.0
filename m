From: Todor Tomov <todor.tomov@linaro.org>
Subject: Re: [PATCH] dt-bindings: media: i2c: Fix i2c address for OV5645
 camera sensor
Date: Fri, 9 Nov 2018 10:57:14 +0200
Message-ID: <a777f934-9adb-83d7-b0b6-0777563410c0@linaro.org>
References: <20181109075643.17575-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109075643.17575-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, mchehab@kernel.org, robh+dt@kernel.org, hansverk@cisco.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mani,

On  9.11.2018 09:56, Manivannan Sadhasivam wrote:
> The i2c address for the Omnivision OV5645 camera sensor is 0x3c. It is
> incorrectly mentioned as 0x78 in binding. Hence fix that.

The seven bit i2c address of ov5645 is really 0x3c.
Thank you for finding this and sending the fix!

Best regards,
Todor

> 
> Fixes: 09c716af36e6 [media] media: i2c/ov5645: add the device tree binding document
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5645.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> index fd7aec9f8e24..1a68ca5eb9a3 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
> @@ -26,9 +26,9 @@ Example:
>  	&i2c1 {
>  		...
>  
> -		ov5645: ov5645@78 {
> +		ov5645: ov5645@3c {
>  			compatible = "ovti,ov5645";
> -			reg = <0x78>;
> +			reg = <0x3c>;
>  
>  			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
>  			reset-gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
> 
