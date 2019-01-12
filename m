From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: iio: chemical: Add bindings for
 bme680
Date: Sat, 12 Jan 2019 18:28:37 +0000
Message-ID: <20190112182837.4cc42743@archlinux>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
        <20190111205359.14158-2-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190111205359.14158-2-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, himanshujha199640@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Fri, 11 Jan 2019 15:53:59 -0500
Sebastien Bourdelin <sebastien.bourdelin@gmail.com> wrote:

> BME680 is a pressure/temperature/humidity/voc sensor.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>

Hmm. We could add the VDD and VDIO regulators perhaps.
Driver assumes they are on currently but we'll get a board where control
is needed sooner or later.  I'm not that fussed about this though.

Jonathan

> ---
>  .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/bme680.txt b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
> new file mode 100644
> index 000000000000..885a1b918340
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
> @@ -0,0 +1,11 @@
> +Bosch Sensortec BME680 pressure/temperature/humidity/voc sensors
> +
> +Required properties:
> +- compatible: must be "bosch,bme680"
> +
> +Example:
> +
> +bme680@77 {
> +          compatible = "bosch,bme680";
> +          reg = <0x77>;
> +};
