From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 PATCH 11/14] Documentation: Add st_magn binding documentation
Date: Tue, 01 Oct 2013 17:29:33 +0100
Message-ID: <524AF86D.7010200@kernel.org>
References: <1380299538-22047-1-git-send-email-l.czerwinski@samsung.com> <1380299538-22047-12-git-send-email-l.czerwinski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380299538-22047-12-git-send-email-l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
Cc: denis.ciocca-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/27/13 17:32, Lukasz Czerwinski wrote:
> This patch adds the document for STMicroeletronics Magnetic Sensors driver under
> Documentation/devicetree/bindings/iio/.
> 
> Signed-off-by: Lukasz Czerwinski <l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

So right now we have two different approaches to documenting these bindings.  Lee
proposed doing it on a per device name, here you are proposing a single file
per type.

What is the prefered approach?

Lee/Lukasz why would you two favour one way or the other?

Device tree maintainers, which is preferred?

Do we assume that any sane person looking up bindings will deploy
grep to find where they are documented, or does it want to more
or less be named after the part (in which case we'll get a lot
of repetition).

Also, the question of whether _'s are acceptable in names
to avoid breaking existing ABI for i2c devices is still open?
I'm assuming that given the current situation and the fact
that the word 'prefered' was used, we are better sticking
with _'s? (that doesn't actually effect this patch, but does
on the next two in this series and I'm being lazy).


>  .../bindings/iio/magnetometer/st_magnometer.txt    |   33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt b/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt
> new file mode 100644
> index 0000000..fb4f473
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/magnetometer/st_magnometer.txt
> @@ -0,0 +1,33 @@
> +STMicroelectronics Magnetic Sensors
> +
> +Required properties:
> +
> +  - compatible : value should be one of the following:
> +	(a) "st,lsm303dlhc" for magnetometer in LSM330DLHC
> +	(b) "st,lsm303dlm" for magnetometer in LIS3DH
> +	(c) "st,lis3mdl" for magnetometer in LSM330
> +
> +  - reg : the I2C address of the magnetometer
> +
> +Optional properties:
> +
> +  - st,drdy-int-pin : redirect DRDY on pin INT1 (1) or pin INT2 (2) (u8)
> +
> +  - interrupts : Interrupt numbers for the ST accelerometers, as an array
> +	in case the magnetometer have more interrupt lines:
> +	<DataReady irq>,
> +	<Event irq>;
> +
> +  - interrupt-names : Array of strings associated with the interrupt numbers
> +
> +Example:
> +
> +lis3mdl@1c {
> +	compatible = "st,lis3mdl";
> +	reg = <0x1C>;
> +
> +	st,drdy-int-pin = /bits/ 8 <1>;
> +	interrupt-parent = <&gpf0>;
> +	interrupts = <5 0>, <6 0>;
> +	interrupt-names = "drdy-int", "event-int";
> +};
> 
