From: Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: iio: chemical: Add bindings for
 bme680
Date: Wed, 16 Jan 2019 00:15:15 +0530
Message-ID: <20190115184515.GB10186@himanshu-Vostro-3559>
References: <20190114201914.24572-1-sebastien.bourdelin@gmail.com>
 <20190114201914.24572-2-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190114201914.24572-2-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 14, 2019 at 03:19:14PM -0500, Sebastien Bourdelin wrote:
> BME680 is a pressure/temperature/humidity/voc sensor.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> ---
> v2 -> v3:
>   - change i2c address to 0x76 as it seems more reliable: Suggested by Himanshu Jha <himanshujha199640@gmail.com>
>   - rebase on master
> ---
>  .../devicetree/bindings/iio/chemical/bme680.txt       | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/bme680.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/bme680.txt b/Documentation/devicetree/bindings/iio/chemical/bme680.txt
> new file mode 100644
> index 000000000000..7f3827cfb2ff
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
> +bme680@76 {
> +          compatible = "bosch,bme680";
> +          reg = <0x76>;
> +};

Thanks,

	Acked-by: Himanshu Jha <himanshujha199640@gmail.com>

-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
