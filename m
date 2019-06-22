From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 2/2] MAINTAINERS: add entry for sensirion sps30 driver
Date: Sat, 22 Jun 2019 09:49:40 +0100
Message-ID: <20190622094940.3f869029@archlinux>
References: <20190620195011.30942-1-tduszyns@gmail.com>
        <20190620195011.30942-3-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620195011.30942-3-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Duszynski <tduszyns@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 20 Jun 2019 21:50:11 +0200
Tomasz Duszynski <tduszyns@gmail.com> wrote:

> Add myself as a sensirion sps30 driver maintainer.
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
> index 1eb971608ac4..dafa02ba161c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14172,6 +14172,12 @@ S:	Maintained
>  F:	drivers/misc/phantom.c
>  F:	include/uapi/linux/phantom.h
>  
> +SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER
> +M:	Tomasz Duszynski <tduszyns@gmail.com>
> +S:	Maintained
> +F:	drivers/iio/chemical/sps30.c
> +F:	Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.yaml
> +
>  SERIAL DEVICE BUS
>  M:	Rob Herring <robh@kernel.org>
>  L:	linux-serial@vger.kernel.org
