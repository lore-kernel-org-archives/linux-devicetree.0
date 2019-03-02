From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: maxbotix,i2cxl: Add MaxBotix i2c
 ultrasonic rangers
Date: Sat, 2 Mar 2019 18:26:39 +0000
Message-ID: <20190302182639.48e73885@archlinux>
References: <20190301134225.susjgtck4iktkbeg@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190301134225.susjgtck4iktkbeg@arbad>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

On Fri, 1 Mar 2019 14:42:27 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> Add doc for dt binding maxbotix,i2cxl. This binding is for MaxBotix
> I2CXL-MaxSonar ultrasonic rangers which share a common i2c interface.

I'm a bit confused on the naming. Certainly the binding should have
separate entries for each supported part, rather than a group one
for their i2cxl naming.  Having said that they do have a wide
range of parts with only the one datasheet.

Rob, what do you think?  Go with this i2cxl naming
or list the individual supported parts?

mb1202, mb1212, mb1222, mb1232, mb1242, mb7040, 
mb7137?

I'm loving that the last one is called the trashsonar ;)

A few minor bits inline.

Thanks,

Jonathan
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  .../bindings/iio/proximity/maxbotix,i2cxl.txt       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt b/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
> new file mode 100644
> index 000000000000..528f428fc583
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
> @@ -0,0 +1,21 @@
> +* MaxBotix I2CXL-MaxSonar ultrasonic distance sensor of type mb12x2 using
> +  the i2c interface for ranging
> +
> +Required properties:
> + - compatible:		Should be "maxbotix,i2cxl"
> +
> + - reg:			i2c address of the device
A cross reference to the i2c docs is always nice.
> +
> +Optional properties:
> + - status-gpios:	Status gpio (input) used to announce the preceding
> +			reading request has finished and that data is
> +			available. If no status gpio is specified the
> +			device driver falls back to wait until data can be
> +			retrieved.
This isn't a standard gpio name - it's purpose is definitely device
specific so give it a vendor prefix.

maxbotix,status-gpios

> +
> +Example:
> +proximity@70 {
> +	compatible = "maxbotix,i2cxl";
> +	reg = <0x70>;
> +	status-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
> +};
