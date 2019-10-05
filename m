From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add entry for ROHM BH1750 driver
Date: Sat, 5 Oct 2019 13:22:25 +0100
Message-ID: <20191005132225.63019df2@archlinux>
References: <20190916190024.9955-1-tduszyns@gmail.com>
        <20190916190024.9955-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916190024.9955-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 16 Sep 2019 21:00:24 +0200
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add myself as a ROHM BH1750 ambient light sensor driver maintainer.
> 
> Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
Applied.

Thanks,

Jonathan

> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f0c03740b9fb..928059c5cd49 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13792,6 +13792,12 @@ L:	linux-serial@vger.kernel.org
>  S:	Odd Fixes
>  F:	drivers/tty/serial/rp2.*
>  
> +ROHM BH1750 AMBIENT LIGHT SENSOR DRIVER
> +M:	Tomasz Duszynski <tduszyns@gmail.com>
> +S:	Maintained
> +F:	drivers/iio/light/bh1750.c
> +F:	Documentation/devicetree/bindings/iio/light/bh1750.yaml
> +
>  ROHM MULTIFUNCTION BD9571MWV-M PMIC DEVICE DRIVERS
>  M:	Marek Vasut <marek.vasut+renesas@gmail.com>
>  L:	linux-kernel@vger.kernel.org
