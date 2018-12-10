From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 3/3] staging: iio: ad5933: add binding doc for ad5933
Date: Mon, 10 Dec 2018 21:27:02 +0000
Message-ID: <20181210212702.4160ff1f@archlinux>
References: <cover.1544292845.git.marcelo.schmitt1@gmail.com>
        <348cbe2abbe256b66ed830bd1abb9fc50bf4d10e.1544292845.git.marcelo.schmitt1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <348cbe2abbe256b66ed830bd1abb9fc50bf4d10e.1544292845.git.marcelo.schmitt1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, 8 Dec 2018 16:19:59 -0200
Marcelo Schmitt <marcelo.schmitt1@gmail.com> wrote:

> Add a devicetree documentation for the ad5933 and ad5934 impedance
> converter, network analyzer.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Gabriel Capella <gabriel@capella.pro>
> Co-Developed-by: Gabriel Capella <gabriel@capella.pro>
Device tree binding patches need to also go to the DT maintainers and list
for review.

This looks fine to me but they are the specialists in these!

+cc Rob, Mark and DT list.

Jonathan
> ---
>  .../iio/impedance-analyzer/ad5933.txt         | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/impedance-analyzer/ad5933.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/impedance-analyzer/ad5933.txt b/Documentation/devicetree/bindings/iio/impedance-analyzer/ad5933.txt
> new file mode 100644
> index 000000000000..5ff38728ff91
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/impedance-analyzer/ad5933.txt
> @@ -0,0 +1,26 @@
> +Analog Devices AD5933/AD5934 Impedance Converter, Network Analyzer
> +
> +https://www.analog.com/media/en/technical-documentation/data-sheets/AD5933.pdf
> +https://www.analog.com/media/en/technical-documentation/data-sheets/AD5934.pdf
> +
> +Required properties:
> + - compatible : should be one of
> +		"adi,ad5933"
> +		"adi,ad5934"
> + - reg : the I2C address.
> + - vdd-supply : The regulator supply for DVDD, AVDD1 and AVDD2 when they
> +   are connected together.
> +
> +Optional properties:
> +- clocks : external clock reference.
> +- clock-names : must be "mclk" if clocks is set.
> +
> +Example for a I2C device node:
> +
> +	impedance-analyzer@0d {
> +		compatible = "adi,adxl345";
> +		reg = <0x0d>;
> +		vdd-supply = <&vdd_supply>;
> +		clocks = <&ref_clk>;
> +		clock-names = "mclk";
> +	};
