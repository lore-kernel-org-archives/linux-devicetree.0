From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 5/9] staging: iio: ad2s1200: Add documentation for
 device tree binding
Date: Fri, 27 Apr 2018 09:48:20 -0500
Message-ID: <20180427144820.jfvypgk6tfp2syty@rob-hp-laptop>
References: <cover.1524432236.git.davidjulianveenstra@gmail.com>
 <0aa68c6684c2b45dd0af398c166d6b36c18be1af.1524432236.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <0aa68c6684c2b45dd0af398c166d6b36c18be1af.1524432236.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Veenstra <davidjulianveenstra@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, daniel.baluta@nxp.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 23, 2018 at 12:03:47AM +0200, David Veenstra wrote:
> Add documentation for the added device tree bindings.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
> ---
> Changes in v3:
>  - Documentation is added to Documentation/devicetree/bindings/iio/resolver
>    instead of staging directory.
>  - Add mention to ad2s1205 device.
> 
>  .../devicetree/bindings/iio/resolver/ad2s1200.txt        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt b/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> new file mode 100644
> index 000000000000..46b51db38368
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> @@ -0,0 +1,16 @@
> +Analog Devices AD2S1200 and AD2S1205 Resolver-to-Digital Converter
> +
> +Required properties:
> + - compatible : should be "adi,ad2s1200" or "adi,ad2s1205"
> + - reg : the SPI chip select number of the device
> + - sample-gpios : The GPIO pin connected to the SAMPLE line of the AD2S1200
> + - rdvel-gpios : The GPIO pin connected to the RDVEL line of the AD2S1200

Are these gpios something that would be common to resolvers (whatever 
that is) or specific to this chip. For the latter, you need vendor 
prefixes.

> +
> +Example:
> +
> +	resolver {

Missing unit address.

> +		compatible = "adi,ad2s1200";
> +		reg = <4>;
> +		sample-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
> +		rdvel-gpios = <&gpio 6 GPIO_ACTIVE_HIGH>;
> +	};
> -- 
> 2.16.2
> 
