From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH 2/5] media: dt-bindings: Add binding for si470x radio
Date: Fri, 7 Dec 2018 12:33:10 +0100
Message-ID: <2c8bb6ef-5f37-69ef-6829-a9e9ad04579b@xs4all.nl>
References: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com>
 <20181205154750.17996-3-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205154750.17996-3-pawel.mikolaj.chmiel@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Please combine 2/5 with 5/5. No need to have two patches for these bindings.

Regards,

	Hans

On 12/05/2018 04:47 PM, Paweł Chmiel wrote:
> Add device tree bindings for si470x family radio receiver driver.
> 
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
> ---
>  .../devicetree/bindings/media/si470x.txt      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/si470x.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/si470x.txt b/Documentation/devicetree/bindings/media/si470x.txt
> new file mode 100644
> index 000000000000..9294fdfd3aae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/si470x.txt
> @@ -0,0 +1,24 @@
> +* Silicon Labs FM Radio receiver
> +
> +The Silicon Labs Si470x is family of FM radio receivers with receive power scan
> +supporting 76-108 MHz, programmable through an I2C interface.
> +Some of them includes an RDS encoder.
> +
> +Required Properties:
> +- compatible: Should contain "silabs,si470x"
> +- reg: the I2C address of the device
> +
> +Optional Properties:
> +- interrupts : The interrupt number
> +
> +Example:
> +
> +&i2c2 {
> +        si470x@63 {
> +                compatible = "silabs,si470x";
> +                reg = <0x63>;
> +
> +                interrupt-parent = <&gpj2>;
> +                interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +        };
> +};
> 
