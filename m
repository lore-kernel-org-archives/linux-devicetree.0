From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: allow for ATAGS to be configured out when DT
 support is selected
Date: Sun, 2 Sep 2012 16:54:49 +0100
Message-ID: <20120902155449.GF18950@mudshark.cambridge.arm.com>
References: <1346361008-7320-1-git-send-email-nicolas.pitre@linaro.org>
 <1346361008-7320-2-git-send-email-nicolas.pitre@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1346361008-7320-2-git-send-email-nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 30, 2012 at 10:10:08PM +0100, Nicolas Pitre wrote:
> Now that ATAGS support is well contained, we can easily remove it from
> the kernel build if so desired.  It has to explicitly be disabled, and
> only when DT support is selected.
> 
> Note: disabling kernel ATAGS support does not prevent the usage of
> CONFIG_ARM_ATAG_DTB_COMPAT.
> 
> Signed-off-by: Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/Kconfig         | 26 +++++++++++++++++++-------
>  arch/arm/kernel/Makefile |  5 +++--
>  arch/arm/kernel/atags.h  | 11 +++++++++++
>  3 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index c5f9ae5dbd..5c7302e208 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1891,12 +1891,6 @@ config CC_STACKPROTECTOR
>  	  neutralized via a kernel panic.
>  	  This feature requires gcc version 4.2 or above.
>  
> -config DEPRECATED_PARAM_STRUCT
> -	bool "Provide old way to pass kernel parameters"
> -	help
> -	  This was deprecated in 2001 and announced to live on for 5 years.
> -	  Some old boot loaders still use this way.
> -
>  endmenu

Since you're in this area, do we need to carry this forward? If somebody is
using it then obviously we have to keep it but it might be worth asking
around.

Back on topic, this looks good to me:

Acked-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>

Will
