From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 4/4] dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1
 device bindings
Date: Mon, 26 Aug 2019 09:10:24 +0100
Message-ID: <20190826091024.50bbf6ba@archlinux>
References: <20190821132520.28225-1-martin.kepplinger@puri.sm>
        <20190821132520.28225-5-martin.kepplinger@puri.sm>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821132520.28225-5-martin.kepplinger@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: lorenzo.bianconi83@gmail.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 21 Aug 2019 15:25:20 +0200
Martin Kepplinger <martin.kepplinger@puri.sm> wrote:

Tweaked to add the -imu plus some text in the patch description to say
why.

Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to ignore.

Thanks,

Jonathan

> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>  Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> index 87407d110bb7..0b0a74d9ab89 100644
> --- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> +++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
> @@ -13,6 +13,7 @@ Required properties:
>    "st,lsm6dsr"
>    "st,lsm6ds3tr-c"
>    "st,ism330dhcx"
> +  "st,lsm9ds1"
>  - reg: i2c address of the sensor / spi cs line
>  
>  Optional properties:
