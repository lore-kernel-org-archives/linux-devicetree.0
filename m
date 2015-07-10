From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Implement sample time consideration for Vybrid's
 ADC
Date: Fri, 10 Jul 2015 16:47:04 +0800
Message-ID: <20150710084704.GK23464@tiger>
References: <cover.1435134626.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1435134626.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 24, 2015 at 02:03:39PM +0530, Sanchayan Maity wrote:
> Hello,
> 
> This patchset adds a dt binding for specifying sample time
> for the vybrid adc driver and takes this into account for
> sampling frequency calculation and related configuration in
> the driver.
> 
> The patchset is based on top of Stefan's patches here
> http://lkml.iu.edu/hypermail/linux/kernel/1505.3/02043.html
> 
> which got recently applied. Tested with shawn's for-next
> branch.
> 
> Changes since v1:
> 
> Change from a vendor specific fsl,min-sample-time to non vendor
> specific min-sample-time.

What's the reason for that?  Property without vendor prefix would be
the generic one, which should be defined by generic ADC bindings, not
vf610-adc.txt.

Shawn

> 
> Version 1 of the patchset can be found here
> http://lkml.iu.edu/hypermail/linux/kernel/1506.1/00026.html
> 
> - Sanchayan.
> 
> Sanchayan Maity (2):
>   iio: adc: Determine sampling frequencies by using minimum sample time
>   ARM: dts: vfxxx: Add property for minimum sample time
> 
>  .../devicetree/bindings/iio/adc/vf610-adc.txt      |  6 ++
>  arch/arm/boot/dts/vfxxx.dtsi                       |  2 +
>  drivers/iio/adc/vf610_adc.c                        | 74 ++++++++++++++++++++--
>  3 files changed, 78 insertions(+), 4 deletions(-)
> 
> -- 
> 2.4.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
