From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: iio: Add bindings for TI TLA202x ADCs
Date: Thu, 28 Mar 2019 13:38:42 -0500
Message-ID: <20190328183842.GA9079@bogus>
References: <1553608583-29006-1-git-send-email-ibtsam.haq.0x01@gmail.com>
 <1553608583-29006-2-git-send-email-ibtsam.haq.0x01@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553608583-29006-2-git-send-email-ibtsam.haq.0x01@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
Cc: jic23@kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 02:56:20PM +0100, Ibtsam Ul-Haq wrote:
> This adds devicetree bindings for TI TLA202x ADCs.
> 
> Signed-off-by: Ibtsam Ul-Haq <ibtsam.haq.0x01@gmail.com>
> ---
>  .../devicetree/bindings/iio/adc/ti-tla2024.txt     | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
> new file mode 100644
> index 0000000..a4934df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/ti-tla2024.txt
> @@ -0,0 +1,45 @@
> +Texas Instruments' TLA2021/TLA2022/TLA2024 12-bit ADC driver
> +
> +Required properties:
> +
> +- compatible: should be one of:
> +  "ti,tla2024"
> +  "ti,tla2022"
> +  "ti,tla2021"
> +
> +- reg: should contain the I2C Address of the device
> +
> +Required subnodes:
> +
> +The ADC channels are configured as subnodes of the ADC.
> +The channels can be single-ended or differential, the input pins are
> +also set in the subnode.
> +
> +Possible channels in TLA2024:
> +  single: <0>, <1>, <2>, <3>
> +  differential: <0 1>, <0 3>, <1 3>, <2 3>
> +
> +In TLA2021/TLA2022 only the differential channel <0 1> is allowed.
> +
> +Example:
> +
> +tla2024_0: adc0@49 {

adc@49

> +	compatible = "ti,tla2024";
> +	reg = <0x49>;
> +
> +	v0@0 {

Unit-address without 'reg' is not valid.

> +		single-channel = <0>;

Look at the common adc binding or adi,ad7124.txt for how to do 
multi-channel with differential channels.

> +	};
> +
> +	v1@1 {
> +		single-channel = <1>;
> +	};
> +
> +	v23@2 {
> +		diff-channels = <2 3>;
> +	};
> +
> +	v01@3 {
> +		diff-channels = <0 1>;
> +	};
> +};
> -- 
> 2.7.4
> 
