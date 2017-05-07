From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 3/3] iio: tools: generic_buffer: increase trigger length
Date: Sun, 7 May 2017 16:03:01 +0100
Message-ID: <c02626ec-4580-ef36-3b38-535e18531473@kernel.org>
References: <1493900000-26220-1-git-send-email-eugen.hristev@microchip.com>
 <1493900000-26220-4-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1493900000-26220-4-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-GH
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Eugen Hristev <eugen.hristev@microchip.com>, nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, linux-iio@vger.kernel.org, lars@metafoo.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ludovic.desroches@microchip.com
List-Id: devicetree@vger.kernel.org

On 04/05/17 13:13, Eugen Hristev wrote:
> Increased trigger length to 64 in order to cope with trigger names
> like fc030000.adc-dev0-external-rising
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Might as well change this now.

Applied to the togreg branch of iio.git.

Thanks,

Jonathan
> ---
>  Changes in v2:
>  - Modified trigger name length to 64
> 
>  tools/iio/iio_utils.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/iio/iio_utils.h b/tools/iio/iio_utils.h
> index 780f201..8b379da 100644
> --- a/tools/iio/iio_utils.h
> +++ b/tools/iio/iio_utils.h
> @@ -13,7 +13,7 @@
>  #include <stdint.h>
>  
>  /* Made up value to limit allocation sizes */
> -#define IIO_MAX_NAME_LENGTH 30
> +#define IIO_MAX_NAME_LENGTH 64
>  
>  #define FORMAT_SCAN_ELEMENTS_DIR "%s/scan_elements"
>  #define FORMAT_TYPE_FILE "%s_type"
> 
