From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: iio: chemical: pms7003: add device tree
 support
Date: Fri, 11 Jan 2019 16:15:26 -0600
Message-ID: <20190111221526.GA29234@bogus>
References: <20190106171614.12615-1-tduszyns@gmail.com>
 <20190106171614.12615-4-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190106171614.12615-4-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jan 06, 2019 at 06:16:14PM +0100, Tomasz Duszynski wrote:
> Add device tree support for Plantower PMS7003 particulate matter sensor.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
> ---
>  .../bindings/iio/chemical/plantower,pms7003.txt    | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> new file mode 100644
> index 000000000000..79eb538eb932
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> @@ -0,0 +1,14 @@
> +* Plantower PMS7003 particulate matter sensor
> +
> +Required properties:
> +- compatible: must be "plantower,pms7003"

Looks like this has reset and set GPIO lines as well as Vcc supply. 
Bindings should be complete even if the driver or a platform doesn't use 
some parts.

> +
> +Refer to serial/slave-device.txt for generic serial attached device bindings.
> +
> +Example:
> +
> +&uart@0 {
> +	pms7003 {
> +		compatible = "plantower,pms7003";
> +	};
> +};
> -- 
> 2.20.1
> 
