From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] devicetree: ad7303: Updated documentation
Date: Wed, 12 Feb 2014 12:21:37 +0000
Message-ID: <20140212122137.GA25957@e106331-lin.cambridge.arm.com>
References: <1392206903-1662-1-git-send-email-paul.cercueil@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392206903-1662-1-git-send-email-paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 12:08:23PM +0000, Paul Cercueil wrote:
> Added documentation about the "adi,use-external-reference"
> property.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/dac/ad7303.txt |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/ad7303.txt b/Documentation/devicetree/bindings/iio/dac/ad7303.txt
> index 914610f..de6b32f 100644
> --- a/Documentation/devicetree/bindings/iio/dac/ad7303.txt
> +++ b/Documentation/devicetree/bindings/iio/dac/ad7303.txt
> @@ -7,6 +7,9 @@ Required properties:
>  	- Vdd-supply: Phandle to the Vdd power supply
>  
>  Optional properties:
> +	- adi,use-external-reference: If set, the external reference voltage
> +	  supply is used. Otherwise, the internal reference voltage supply is
> +	  used.

As I asked for the ad5064 binding document, when would you want to do
this, and why can't the driver decide?

Cheers,
Mark.
