From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v3 1/9] staging: iio: ad2s1200: Add kernel docs to
 driver state
Date: Sat, 28 Apr 2018 18:11:05 +0100
Message-ID: <20180428181105.46a6b319@archlinux>
References: <cover.1524432236.git.davidjulianveenstra@gmail.com>
 <b880e7be5b1b70f0805db41dcd41571a50785fab.1524432236.git.davidjulianveenstra@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <b880e7be5b1b70f0805db41dcd41571a50785fab.1524432236.git.davidjulianveenstra@gmail.com>
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

On Mon, 23 Apr 2018 00:02:51 +0200
David Veenstra <davidjulianveenstra@gmail.com> wrote:

> Add missing kernel docs to the ad2s1200 driver state.
> 
> Signed-off-by: David Veenstra <davidjulianveenstra@gmail.com>
Hi David,

Comment inline.

> ---
> Changes in v3:
>  - Added more explanation to mutex lock.
> 
>  drivers/staging/iio/resolver/ad2s1200.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/staging/iio/resolver/ad2s1200.c b/drivers/staging/iio/resolver/ad2s1200.c
> index 357fe3c382b3..17d65cb437fd 100644
> --- a/drivers/staging/iio/resolver/ad2s1200.c
> +++ b/drivers/staging/iio/resolver/ad2s1200.c
> @@ -33,6 +33,15 @@
>  /* clock period in nano second */
>  #define AD2S1200_TSCLK	(1000000000 / AD2S1200_HZ)
>  
> +/**
> + * struct ad2s1200_state - driver instance specific data.
> + * @lock:	protects both the GPIO pins and the rx buffer, to prevent
> + *		concurrent spi transactions.
It isn't actually preventing concurrent spi transactions - that
is done by the spi core itself.  What it is preventing is
concurrent 'actions' with the device - these involve
a mixture of gpio changes and spi transactions.

That would take some considerable explaining and frankly the code
does the job just fine once people know to look.

I'd just leave it as "protects both the GPIO pins and the rx buffer."
Or feel free to see if you can come up with a brief description of
exactly what we need to be 'atomic'.

Thanks,

Jonathan

> + * @sdev:	spi device.
> + * @sample:	GPIO pin SAMPLE.
> + * @rdvel:	GPIO pin RDVEL.
> + * @rx:		buffer for spi transfers.
> + */
>  struct ad2s1200_state {
>  	struct mutex lock;
>  	struct spi_device *sdev;
