From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 3/3] iio: chemical: sgp30: add device tree support
Date: Sun, 16 Dec 2018 13:35:43 +0000
Message-ID: <20181216133543.5c560f71@archlinux>
References: <20181213144418.24965-1-andreas.brauchli@sensirion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213144418.24965-1-andreas.brauchli@sensirion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Brauchli <a.brauchli@elementarea.net>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Brauchli <andreas.brauchli@sensirion.com>
List-Id: devicetree@vger.kernel.org

On Thu, 13 Dec 2018 15:44:18 +0100
Andreas Brauchli <a.brauchli@elementarea.net> wrote:

> Add device tree support for Sensirion SGP30/SGPC3 gas sensors.
> 
> Signed-off-by: Andreas Brauchli <andreas.brauchli@sensirion.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Note this missed (by about a week) the cut off for the current
cycle, so this will be in the second one of the new year.

Jonathan

> ---
>  .../bindings/iio/chemical/sensirion,sgp30.txt     | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
> new file mode 100644
> index 000000000000..5844ed58173c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,sgp30.txt
> @@ -0,0 +1,15 @@
> +* Sensirion SGP30/SGPC3 multi-pixel Gas Sensor
> +
> +Required properties:
> +
> +  - compatible: must be one of
> +    "sensirion,sgp30"
> +    "sensirion,sgpc3"
> +  - reg: the I2C address of the sensor
> +
> +Example:
> +
> +gas@58 {
> +	compatible = "sensirion,sgp30";
> +	reg = <0x58>;
> +};
