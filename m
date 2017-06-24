From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] dt-bindings: iio: pressure: Add bindings for
 MS5637, MS5805, MS5837 and MS8607 sensors
Date: Sat, 24 Jun 2017 21:53:23 +0100
Message-ID: <20170624215323.2062b2fa@kernel.org>
References: <1497374492-21040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497374492-21040-1-git-send-email-manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Jun 2017 22:51:32 +0530
Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Add device tree bindings for Measurement-Specialties MS5637, MS5805, MS5837 and MS8607 pressure & temperature sensor
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Applied to the togreg branch of iio.git with some white space cleanup at the end
of the file.

Thanks,

Jonathan
> ---
>  .../devicetree/bindings/iio/pressure/ms5637.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/pressure/ms5637.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/pressure/ms5637.txt b/Documentation/devicetree/bindings/iio/pressure/ms5637.txt
> new file mode 100644
> index 0000000..c0f3f8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/pressure/ms5637.txt
> @@ -0,0 +1,18 @@
> +* MS5637 - Measurement-Specialties MS5637, MS5805, MS5837 and MS8607 pressure & temperature sensor
> +
> +Required properties:
> +
> +	-compatible: should be one of the following
> +		meas,ms5637
> +		meas,ms5805
> +		meas,ms5837
> +		meas,ms8607-temppressure
> +	-reg: I2C address of the sensor
> +
> +Example:
> +
> +ms5637@76 {
> +	compatible = "meas,ms5637";
> +	reg = <0x76>;
> +};
> +	
