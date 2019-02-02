From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: iio: chemical: pms7003: add device
 tree support
Date: Sat, 2 Feb 2019 17:12:47 +0000
Message-ID: <20190202171247.0d0fc122@archlinux>
References: <20190201215759.14569-1-tduszyns@gmail.com>
        <20190201215759.14569-4-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201215759.14569-4-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, johan@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri,  1 Feb 2019 22:57:59 +0100
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add device tree support for Plantower PMS7003 particulate matter sensor.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Hi Tomasz,

Sorry, I clearly didn't look at this in enough detail on earlier versions.
I think the set gpio is rather device specific so should have a vendor
prefix.

I would also like to get an opinion on the generic name from the devicetree
maintainers before we start to standardise on it.

Thanks,

Jonathan

> ---
>  .../iio/chemical/plantower,pms7003.txt        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
> new file mode 100644
> index 000000000000..cbad95480e04
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
> +- set-gpios: phandle to the GPIO connected to the SET line

Hmm. This is a somewhat 'unusual' one so should probably have a vendor prefix.

> +- reset-gpios: phandle to the GPIO connected to the RESET line

reset is common and clear in meaning, so vendor prefix probably not appropriate.
> +
> +Refer to serial/slave-device.txt for generic serial attached device bindings.
> +
> +Example:
> +
> +&uart0 {
> +	air-pollution-sensor {
> +		vcc-supply = <&reg_vcc5v0>;
> +		compatible = "plantower,pms7003";
> +	};
> +};
