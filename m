From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/4] dt-bindings: iio: humidity: Add bindings for HTU21
 and MS8607 sensors
Date: Sun, 18 Jun 2017 09:05:11 -0500
Message-ID: <20170618140511.kz6nvttypockcrfm@rob-hp-laptop>
References: <1497374443-20935-1-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497374443-20935-1-git-send-email-manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 13, 2017 at 10:50:43PM +0530, Manivannan Sadhasivam wrote:
> Add device tree bindings for Measurement-Specialties HTU21 temperature & humidity sensor and humidity part of MS8607 sensor
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/humidity/htu21.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/humidity/htu21.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/humidity/htu21.txt b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> new file mode 100644
> index 0000000..97d7963
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/humidity/htu21.txt
> @@ -0,0 +1,13 @@
> +*HTU21 - Measurement-Specialties htu21 temperature & humidity sensor and humidity part of MS8607 sensor

The binding should be for the device, not part of it. You should bind 
to a driver for MS8607 and then create 2 child devices for the humidity 
and temp sensors.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
