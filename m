From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/2] Add device tree binding documentation for
 MAX44009
Date: Sat, 26 Jan 2019 21:04:11 +0000
Message-ID: <20190126210411.1efcde38@archlinux>
References: <3de73cb366285113e0e7c2e1938d15b7c3981891.1548529751.git.bobbyeshleman@gmail.com>
        <7201ee3e0e1c119fa521ed33793be96eaa0eb159.1548529751.git.bobbyeshleman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7201ee3e0e1c119fa521ed33793be96eaa0eb159.1548529751.git.bobbyeshleman@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Eshleman <bobbyeshleman@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 26 Jan 2019 11:16:21 -0800
Robert Eshleman <bobbyeshleman@gmail.com> wrote:

> Signed-off-by: Robert Eshleman <bobbyeshleman@gmail.com>
Looks good to me.  As we are going for a v3 due to patch 1, plenty
of time for others to comment.

Thanks,

Jonathan
> ---
>  .../bindings/iio/light/max44009.txt           | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/max44009.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/max44009.txt b/Documentation/devicetree/bindings/iio/light/max44009.txt
> new file mode 100644
> index 000000000000..b287d7732e37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/max44009.txt
> @@ -0,0 +1,25 @@
> +* MAX44009 Ambient Light Sensor
> +
> +Required properties:
> +
> +- compatible: should be "maxim,max44009"
> +- reg: the I2C address of the device (default is <0x4a>)
> +
> +Optional properties:
> +
> +- interrupts: interrupt mapping for GPIO IRQ. Should be configured with
> +  IRQ_TYPE_EDGE_FALLING.
> +
> +Refer to interrupt-controller/interrupts.txt for generic interrupt client
> +node bindings.
> +
> +Example:
> +
> +max44009: max44009@4a {
> +	compatible = "maxim,max44009";
> +	reg = <0x4a>;
> +
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> +};
> +
