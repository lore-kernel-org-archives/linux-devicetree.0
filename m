From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Subject: Re: [PATCH v4 3/3] dt-bindings: iio: chemical: pms7003: add device
 tree support
Date: Mon, 11 Feb 2019 20:22:14 +0000
Message-ID: <20190211202214.0b6146a5@archlinux>
References: <20190209173609.13220-1-tduszyns@gmail.com>
        <20190209173609.13220-4-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190209173609.13220-4-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, johan@kernel.org
List-Id: devicetree@vger.kernel.org

On Sat,  9 Feb 2019 18:36:09 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add device tree support for Plantower PMS7003 particulate matter sensor.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied to the togreg branch of iio.git and pushed out as testing.

I'll be doing a pull request pretty soon on this given where we are
in the cycle.  If anyone has last minute reviews, there is still a little
time.

Thanks,

Jonathan

> ---
>  .../iio/chemical/plantower,pms7003.txt        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> new file mode 100644
> index 000000000000..7b5f06f324c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> @@ -0,0 +1,20 @@
> +* Plantower PMS7003 particulate matter sensor
> +
> +Required properties:
> +- compatible: must be "plantower,pms7003"
> +- vcc-supply: phandle to the regulator that provides power to the sensor
> +
> +Optional properties:
> +- plantower,set-gpios: phandle to the GPIO connected to the SET line
> +- reset-gpios: phandle to the GPIO connected to the RESET line
> +
> +Refer to serial/slave-device.txt for generic serial attached device bindings.
> +
> +Example:
> +
> +&uart0 {
> +	air-pollution-sensor {
> +		compatible = "plantower,pms7003";
> +		vcc-supply = <&reg_vcc5v0>;
> +	};
> +};
