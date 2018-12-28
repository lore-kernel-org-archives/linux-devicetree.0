Return-Path: <robherring2@gmail.com>
Date: Fri, 28 Dec 2018 17:45:25 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 data lane swapping
Message-ID: <20181228234525.GA30428@bogus>
References: <20181219145941.5173-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181219145941.5173-1-m.felsch@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: richard.leitner@skidata.com, fancer.lancer@gmail.com, kernel@pengutronix.de, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 19, 2018 at 03:59:40PM +0100, Marco Felsch wrote:
> Add optional binding to allow USB differential-pair (D+/D-) data lane
> swapping. The swapping can be specified for each port separately,
> default is no swapping.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> index 168ff819e827..aec93a92870d 100644
> --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -64,6 +64,8 @@ Optional properties :
>   - power-on-time-ms : Specifies the time it takes from the time the host
>  	initiates the power-on sequence to a port until the port has adequate
>  	power. The value is given in ms in a 0 - 510 range (default is 100ms).
> + - sw-dx-lanes-ports : Specifies the ports which will swap the differential-pair
> +	(D+/D-), default is not-swapped.

Perhaps 'swap-dx-ports' would be a more obvious name.

>  
>  Examples:
>  	usb2512b@2c {
> @@ -81,4 +83,6 @@ Examples:
>  		manufacturer = "Foo";
>  		product = "Foo-Bar";
>  		serial = "1234567890A";
> +		/* correct misplaced usb connectors on port 1,2 */
> +		sw-dx-lanes-ports = <1 2>;
>  	};
> -- 
> 2.19.1
> 
