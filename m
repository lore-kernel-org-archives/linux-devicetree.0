From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 08/12] dt-bindings: iio: resolver: Document AD2S1200
 bindings
Date: Sun, 20 May 2018 12:05:53 +0100
Message-ID: <20180520120553.4b2526c9@archlinux>
References: <cover.1526667118.git.davidjulianveenstra@gmail.com>
 <cbe0f4194cca49c303fbe62b215bfaf0af6e2bbb.1526667118.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cbe0f4194cca49c303fbe62b215bfaf0af6e2bbb.1526667118.git.davidjulianveenstra@gmail.com>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Fri, 18 May 2018 20:22:50 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Add documentation for the device tree bindings of the AD2S1200 resolver.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>

Nothing fundamentally wrong it in here, but a few things to tidy up.

> ---
> Changes in v4:
>  - Added vendor prefix to gpio function name.
>  - Added unit address.
>  - Changed commit subject to be more inline with other dt-bindings
>    commit .
> 
>  .../bindings/iio/resolver/ad2s1200.txt           | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt b/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> new file mode 100644
> index 000000000000..bbf54260c911
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/resolver/ad2s1200.txt
> @@ -0,0 +1,16 @@
> +Analog Devices AD2S1200 and AD2S1205 Resolver-to-Digital Converter
> +
> +Required properties:
> + - compatible : should be "adi,ad2s1200" or "adi,ad2s1205"

One line per entry.  Saves us having to change this substantially when adding
more parts in future.

> + - reg : the SPI chip select number of the device
> + - adi,sample-gpios : The GPIO pin connected to the SAMPLE line of the AD2S1200
> + - adi,rdvel-gpios : The GPIO pin connected to the RDVEL line of the AD2S1200
> +
> +Example:
> +
> +	resolver@0 {

@4 if you are going to have reg = <4> below.

> +		compatible = "adi,ad2s1200";
> +		reg = <4>;
> +		adi,sample-gpios = <&gpio 5 GPIO_ACTIVE_HIGH>;
> +		adi,rdvel-gpios = <&gpio 6 GPIO_ACTIVE_HIGH>;
> +	};
