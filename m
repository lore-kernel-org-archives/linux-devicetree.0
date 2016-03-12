From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: document NXP LPC1850 DAC driver bindings
Date: Sat, 12 Mar 2016 18:17:41 +0000
Message-ID: <56E45D45.4050605@kernel.org>
References: <1457785817-32328-1-git-send-email-manabian@gmail.com>
 <1457785817-32328-5-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457785817-32328-5-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/03/16 12:30, Joachim Eastwood wrote:
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
A very straight forward binding so I'm happy to apply this without
a devicetree ack (still time if anyone does want to take a look though as
it won't be in my non rebasing tree until probably next weekend now.)

Applied to the togreg branch of iio.git - initially pushed out as testing
for the autobuilders to play with it.

We have unfortunately missed the merge window that will probably open tomorrow
(as IIO stuff must be in a few weeks before that) so this is looking at the
next merge window in 3 months time.  Will be in linux-next in about 3-4 weeks
though after I send a pull request to Greg KH post merge window closing.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/dac/lpc1850-dac.txt      | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
> new file mode 100644
> index 000000000000..7d6647d4af5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/dac/lpc1850-dac.txt
> @@ -0,0 +1,20 @@
> +NXP LPC1850 DAC bindings
> +
> +Required properties:
> +- compatible: Should be "nxp,lpc1850-dac"
> +- reg: Offset and length of the register set for the ADC device
> +- interrupts: The interrupt number for the ADC device
> +- clocks: The root clock of the ADC controller
> +- vref-supply: The regulator supply ADC reference voltage
> +- resets: phandle to reset controller and line specifier
> +
> +Example:
> +dac: dac@400e1000 {
> +	compatible = "nxp,lpc1850-dac";
> +	reg = <0x400e1000 0x1000>;
> +	interrupts = <0>;
> +	clocks = <&ccu1 CLK_APB3_DAC>;
> +	vref-supply = <&reg_vdda>;
> +	resets = <&rgu 42>;
> +	status = "disabled";
> +};
> 
