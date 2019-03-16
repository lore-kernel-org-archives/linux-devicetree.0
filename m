From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: iio: light: Document the VCNL4xx0
 device tree bindings
Date: Sat, 16 Mar 2019 17:15:17 +0000
Message-ID: <20190316171517.4c783134@archlinux>
References: <20190315215425.24140-1-angus@akkea.ca>
        <20190315215425.24140-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315215425.24140-3-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomas Novotny <tomas@novotny.cz>, Brian Masney <masneyb@onstation.org>, Robert Eshleman <bobbyeshleman@gmail.com>, Mathieu Othacehe <m.othacehe@gmail.com>, Parthiban Nallathambi <pn@denx.de>, ryang <decatf@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 15 Mar 2019 14:54:25 -0700
"Angus Ainslie (Purism)" <angus@akkea.ca> wrote:

> devicetree hooks where added to the VCNL4xx0 light and proximity
> sensor driver.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Please avoid wild cards in naming. It goes wrong too often.  People can grep
if they want to see if their device is supported by any drivers rather
than try to figure out wildcards.

> ---
>  .../devicetree/bindings/iio/light/vcnl4xx0.txt    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt b/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt
> new file mode 100644
> index 000000000000..d61cf3c121c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/light/vcnl4xx0.txt
> @@ -0,0 +1,15 @@
> +VISHAY VCNL4xx0 -  Ambient Light and proximity sensor
> +
> +This driver supports the VCNL4000/10/20/40 and VCNL4200
> +
> +Required properties:
> +
> +	-compatible: should be "vishay,vcnl4000" or "vishay,vcnl4040"
One per line.

I'd also like to see all the options in the list.  We already seem
to have an undocumented difference between your new part and some
of the older ones.  It's always better for people to use the 'most
correct' part name the can.

> +	-reg: I2C address of the sensor, should be 0x60
> +
> +Example:
> +
> +light-sensor@60 {
> +	compatible = "vishay,vcnl4040";
> +	reg = <0x60>;
> +};
