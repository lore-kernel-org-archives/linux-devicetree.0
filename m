From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] iio: dac: vf610_dac: Add IIO DAC driver for
 Vybrid SoC
Date: Tue, 23 Feb 2016 14:54:37 -0600
Message-ID: <20160223205437.GA27366@rob-hp-laptop>
References: <cover.1456121233.git.maitysanchayan@gmail.com>
 <1a70acdd3ffae273bbfe2f80c5e3952d152921df.1456121233.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1a70acdd3ffae273bbfe2f80c5e3952d152921df.1456121233.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 22, 2016 at 11:48:37AM +0530, Sanchayan Maity wrote:
> Add driver support for DAC peripheral on Vybrid SoC.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/ABI/testing/sysfs-bus-iio-vf610      |   9 +
>  .../devicetree/bindings/iio/dac/vf610-dac.txt      |  20 ++

For the binding:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/dac/Kconfig                            |  10 +
>  drivers/iio/dac/Makefile                           |   1 +
>  drivers/iio/dac/vf610_dac.c                        | 298 +++++++++++++++++++++
>  5 files changed, 338 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/vf610-dac.txt
>  create mode 100644 drivers/iio/dac/vf610_dac.c
