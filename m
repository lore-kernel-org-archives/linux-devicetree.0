From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/2] iio: dac: vf610_dac: Add IIO DAC driver for
 Vybrid SoC
Date: Fri, 12 Feb 2016 08:51:00 -0600
Message-ID: <20160212145100.GA12514@rob-hp-laptop>
References: <cover.1454939346.git.maitysanchayan@gmail.com>
 <5a699d45c89d239f3e49fa83d16a9b467016e219.1454939346.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5a699d45c89d239f3e49fa83d16a9b467016e219.1454939346.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2016 at 10:56:06AM +0530, Sanchayan Maity wrote:
> Add driver support for DAC peripheral on Vybrid SoC.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/dac/vf610-dac.txt      |  20 ++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/dac/Kconfig                            |   8 +
>  drivers/iio/dac/Makefile                           |   1 +
>  drivers/iio/dac/vf610_dac.c                        | 302 +++++++++++++++++++++
>  4 files changed, 331 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/vf610-dac.txt
>  create mode 100644 drivers/iio/dac/vf610_dac.c
