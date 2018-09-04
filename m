From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 4/4] MAINTAINERS: add entry for fxas21002c gyro driver
Date: Tue, 4 Sep 2018 22:16:53 +0300
Message-ID: <CAHp75Vf5w+UhAvH_cufhv9EBrgC2bcUaFc3R0iZwpWrXUm2eRQ@mail.gmail.com>
References: <20180904200434.10442-1-afonsobordado@az8.co> <20180904200434.10442-4-afonsobordado@az8.co>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904200434.10442-4-afonsobordado@az8.co>
Sender: linux-kernel-owner@vger.kernel.org
To: afonsobordado@az8.co
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 4, 2018 at 10:07 PM Afonso Bordado <afonsobordado@az8.co> wrote:
>
> Add entry for fxas21002c gyroscope driver and add myself as
> maintainer of this driver.
>
> Signed-off-by: Afonso Bordado <afonsobordado@az8.co>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b7b24b145f0..faf5f41b1465 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5838,6 +5838,13 @@ L:       linuxppc-dev@lists.ozlabs.org
>  S:     Maintained
>  F:     drivers/usb/gadget/udc/fsl*
>
> +FREESCALE FXAS21002C
> +M:     Afonso Bordado <afonsobordado@az8.co>
> +L:     linux-iio@vger.kernel.org
> +S:     Maintained
> +F:     drivers/iio/gyro/fxas21002.c
> +F:     Documentation/devicetree/bindings/iio/gyroscope/fsl,fxas21002c.txt
> +

Must be sorted. I bet F followed by U, not otherwise.

>  FREEVXFS FILESYSTEM
>  M:     Christoph Hellwig <hch@infradead.org>
>  W:     ftp://ftp.openlinux.org/pub/people/hch/vxfs
> --
> 2.18.0
>
>


-- 
With Best Regards,
Andy Shevchenko
