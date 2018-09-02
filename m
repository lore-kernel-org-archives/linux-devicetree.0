From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add entry for fxas21002c gyro
 driver
Date: Sun, 2 Sep 2018 21:51:53 +0100
Message-ID: <20180902215153.6c02e121@archlinux>
References: <20180830211825.12202-1-afonsobordado@az8.co>
        <20180830211825.12202-4-afonsobordado@az8.co>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830211825.12202-4-afonsobordado@az8.co>
Sender: linux-kernel-owner@vger.kernel.org
To: Afonso Bordado <afonsobordado@az8.co>
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Aug 2018 22:18:25 +0100
Afonso Bordado <afonsobordado@az8.co> wrote:

> Add entry for fxas21002c gyroscope driver and add myself as
> maintainer of this driver.
> 
I'll take a final look at V3, once you have tidied up the
various review comments, but this looks nearly ready to
merge to me.

Thanks,

Jonathan

> Signed-off-by: Afonso Bordado <afonsobordado@az8.co>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b7b24b145f0..faf5f41b1465 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5838,6 +5838,13 @@ L:	linuxppc-dev@lists.ozlabs.org
>  S:	Maintained
>  F:	drivers/usb/gadget/udc/fsl*
>  
> +FREESCALE FXAS21002C
> +M:	Afonso Bordado <afonsobordado@az8.co>
> +L:	linux-iio@vger.kernel.org
> +S:	Maintained
> +F:	drivers/iio/gyro/fxas21002.c
> +F:	Documentation/devicetree/bindings/iio/gyroscope/fsl,fxas21002c.txt
> +
>  FREEVXFS FILESYSTEM
>  M:	Christoph Hellwig <hch@infradead.org>
>  W:	ftp://ftp.openlinux.org/pub/people/hch/vxfs
