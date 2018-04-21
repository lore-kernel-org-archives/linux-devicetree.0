From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 05/13] staging: iio: ad2s1200: Add kernel docs to
 driver state
Date: Sat, 21 Apr 2018 17:49:52 +0100
Message-ID: <20180421174952.1e3b5ee0@archlinux>
References: <cover.1524247563.git.davidjulianveenstra@gmail.com>
 <2e083c69b1d249fe05badc94250c39db24d523e0.1524247563.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <2e083c69b1d249fe05badc94250c39db24d523e0.1524247563.git.davidjulianveenstra@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: David Veenstra <davidjulianveenstra@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org, robh+dt@kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, daniel.baluta@nxp.com
List-Id: devicetree@vger.kernel.org

On Fri, 20 Apr 2018 21:30:03 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Add missing kernel docs to the ad2s1200 driver state.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
> ---
>  drivers/staging/iio/resolver/ad2s1200.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index 357fe3c382b3..f07aab7e7a35 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -33,6 +33,14 @@
>  /* clock period in nano second */
>  #define AD2S1200_TSCLK	(1000000000 / AD2S1200_HZ)
>  
> +/**
> + * struct ad2s1200_state - driver instance specific data
> + * @lock:	protect driver state

This doc for locks needs to be more specific.  From a quick
glance I think it does two things.
1) Ensures that we don't have concurrent accesses changing the
gpio control lines.
2) Protects the rx buffer against concurrent accesses.

It doesn't have anything much to do with the rest of this state
structure.

> + * @sdev:	spi device
> + * @sample:	GPIO pin SAMPLE
> + * @rdvel:	GPIO pin RDVEL
> + * @rx:		buffer for spi transfers
> + */
>  struct ad2s1200_state {
>  	struct mutex lock;
>  	struct spi_device *sdev;
