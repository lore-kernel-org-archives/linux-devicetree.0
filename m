From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC v2 PATCH 13/14] Documentation: Add st_pressure binding
 documentation
Date: Mon, 21 Oct 2013 12:23:00 +0100
Message-ID: <20131021112300.GD8144@kartoffel>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com>
 <1380299538-22047-14-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380299538-22047-14-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org" <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, "denis.ciocca-qxv4g6HH51o@public.gmane.org" <denis.ciocca-qxv4g6HH51o@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2013 at 05:32:17PM +0100, Lukasz Czerwinski wrote:
> This patch adds the document for STMicroeletronics Pressure Sensors
> driver under Documentation/devicetree/bindings/iio/.
> 
> Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../bindings/iio/barometer/st_barometer.txt        |   38 ++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/barometer/st_barometer.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt b/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt
> new file mode 100644
> index 0000000..5ce4bfa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/barometer/st_barometer.txt
> @@ -0,0 +1,38 @@
> +STMicroelectronics Pressure Sensors
> +
> +Required properties:
> +
> +  - compatible : value should be:
> +	(a) "st,lps331ap" for barometer in LPS331AP

When you say "for the barometer in LPS331AP", is the LPS331AP a multi function
device? Or only a barometer?

> +	(b) "st,lps001wp" for barometer in LPS001WP
> +
> +  - reg : the I2C address of the barometer
> +
> +Optional properties:
> +
> +  - st,drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
> +
> +  - interrupts : Interrupt numbers for the ST barometer, as an array
> +	in case the barometer have more interrupt lines:
> +	<DataReady irq>,
> +	<Event irq>;
> +
> +  - interrupt-names : Array of strings associated with the interrupt numbers

The comments from patch 11 apply here too.

> +
> +  - vdd-supply: Phandle to the Vdd supply regulator
> +
> +  - vddio-supply: Phandle to the Vdd-IO supply regulator

These seem fine.

Thanks,
Mark.
