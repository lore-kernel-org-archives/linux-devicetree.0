From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] iio: accel: Add support for Domintech DMARD06
 accelerometer
Date: Thu, 21 Jul 2016 17:19:59 -0500
Message-ID: <20160721221959.GA25742@rob-hp-laptop>
References: <1469133140-14722-1-git-send-email-mamlinav@gmail.com>
 <1469133191-14812-1-git-send-email-mamlinav@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469133191-14812-1-git-send-email-mamlinav@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aleksei Mamlin <mamlinav@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 21, 2016 at 11:33:11PM +0300, Aleksei Mamlin wrote:
> This patch add support for Domintech DMARD06 accelerometer.
> 
> Domintech DMARD06 is a low-g tri-axial digital accelerometer for
> cost-sensitive consumer application.
> 
> Signed-off-by: Aleksei Mamlin <mamlinav@gmail.com>
> ---
>  .../devicetree/bindings/iio/accel/dmard06.txt      |  17 ++
>  drivers/iio/accel/Kconfig                          |  11 ++
>  drivers/iio/accel/Makefile                         |   1 +
>  drivers/iio/accel/dmard06.c                        | 219 +++++++++++++++++++++
>  4 files changed, 248 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/dmard06.txt
>  create mode 100644 drivers/iio/accel/dmard06.c
> 
> diff --git a/Documentation/devicetree/bindings/iio/accel/dmard06.txt b/Documentation/devicetree/bindings/iio/accel/dmard06.txt
> new file mode 100644
> index 0000000..cc2231a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/accel/dmard06.txt
> @@ -0,0 +1,17 @@
> +Device tree bindings for Domintech DMARD06 acceletometer
> +
> +Required properties:
> + - compatible		: Should be "domintech,dmard06"
> + - reg			: I2C address of the chip. Should be 0x1c

No interrupt? If not, for the binding:

Acked-by: Rob Herring <robh@kernel.org>
