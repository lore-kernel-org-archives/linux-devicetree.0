From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 7/7] iio: Fix typos in ABI documentation
Date: Sat, 8 Aug 2015 19:39:05 +0100
Message-ID: <55C64CC9.3020109@kernel.org>
References: <1438174469-19054-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1438174661-19371-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438174661-19371-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/07/15 13:57, Vladimir Barinov wrote:
> Fix typos in ABI documentation
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Applied to the togreg branch of iio.git

Did take me a while to work out what the first one was ;)
git diff --word-diff-regex=. HEAD~1

Turns out to be a handy addition to the armoury!

Jonathan 


> ---
> Changes in version 3:
> - initially added
> 
>  Documentation/ABI/testing/sysfs-bus-iio | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
> index 65bf49e..71a48b7 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -488,7 +488,7 @@ Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>  Description:
>  		Specifies the output powerdown mode.
>  		DAC output stage is disconnected from the amplifier and
> -		1kohm_to_gnd: connected	to ground via an 1kOhm resistor,
> +		1kohm_to_gnd: connected to ground via an 1kOhm resistor,
>  		6kohm_to_gnd: connected to ground via a 6kOhm resistor,
>  		20kohm_to_gnd: connected to ground via a 20kOhm resistor,
>  		100kohm_to_gnd: connected to ground via an 100kOhm resistor,
> @@ -498,9 +498,9 @@ Description:
>  		outX_powerdown_mode_available. If Y is not present the
>  		mode is shared across all outputs.
>  
> -What:		/sys/.../iio:deviceX/out_votlageY_powerdown_mode_available
> +What:		/sys/.../iio:deviceX/out_voltageY_powerdown_mode_available
>  What:		/sys/.../iio:deviceX/out_voltage_powerdown_mode_available
> -What:		/sys/.../iio:deviceX/out_altvotlageY_powerdown_mode_available
> +What:		/sys/.../iio:deviceX/out_altvoltageY_powerdown_mode_available
>  What:		/sys/.../iio:deviceX/out_altvoltage_powerdown_mode_available
>  KernelVersion:	2.6.38
>  Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 
