From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 01/14] ARM: orion: spi: remove enable_clock_fix which is
 not used
Date: Thu, 08 Mar 2012 21:33:19 -0700
Message-ID: <20120309043319.316C93E0903@localhost>
References: <cover.1331090356.git.jason@lakedaemon.net>
 <b0fe0cfb7e76a869a8ba7f7344de75eb122e206c.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <b0fe0cfb7e76a869a8ba7f7344de75eb122e206c.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed,  7 Mar 2012 03:44:42 +0000, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> 
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  drivers/spi/spi-orion.c       |    5 -----
>  include/linux/spi/orion_spi.h |    1 -
>  2 files changed, 0 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
> index 13448c8..e496f79 100644
> --- a/drivers/spi/spi-orion.c
> +++ b/drivers/spi/spi-orion.c
> @@ -359,11 +359,6 @@ static int orion_spi_setup(struct spi_device *spi)
>  
>  	orion_spi = spi_master_get_devdata(spi->master);
>  
> -	/* Fix ac timing if required.   */
> -	if (orion_spi->spi_info->enable_clock_fix)
> -		orion_spi_setbits(orion_spi, ORION_SPI_IF_CONFIG_REG,
> -				  (1 << 14));
> -
>  	if ((spi->max_speed_hz == 0)
>  			|| (spi->max_speed_hz > orion_spi->max_speed))
>  		spi->max_speed_hz = orion_spi->max_speed;
> diff --git a/include/linux/spi/orion_spi.h b/include/linux/spi/orion_spi.h
> index decf6d8..b4d9fa6 100644
> --- a/include/linux/spi/orion_spi.h
> +++ b/include/linux/spi/orion_spi.h
> @@ -11,7 +11,6 @@
>  
>  struct orion_spi_info {
>  	u32	tclk;		/* no <linux/clk.h> support yet */
> -	u32	enable_clock_fix;
>  };
>  
>  
> -- 
> 1.7.3.4
> 

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies,Ltd.
