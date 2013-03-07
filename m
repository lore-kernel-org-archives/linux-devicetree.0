From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] MXS/i.MX28: prepare different clocking of the
 built-in RTC
Date: Thu, 7 Mar 2013 14:40:54 +0800
Message-ID: <20130307064052.GC5372@S2101-09.ap.freescale.net>
References: <1362405948-12992-1-git-send-email-s.trumtrar@pengutronix.de>
 <1362405948-12992-4-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362405948-12992-4-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2013 at 03:05:42PM +0100, Steffen Trumtrar wrote:
> From: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> Signed-off-by: Juergen Beisert <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/rtc/rtc-stmp3xxx.c |    8 ++++++++
>  1 file changed, 8 insertions(+)

So this is a rtc patch, and should be prefixed with "rtc: stmp3xxx: "
like patches #6~9.

And IMO, all the changes in this patch can just be added together with
the codes that use them.  IOW, it can be merged into patch #4.

> 
> diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
> index 98f0d3c..7311292 100644
> --- a/drivers/rtc/rtc-stmp3xxx.c
> +++ b/drivers/rtc/rtc-stmp3xxx.c
> @@ -53,18 +53,26 @@
>  #define STMP3XXX_RTC_PERSISTENT0		0x60
>  #define STMP3XXX_RTC_PERSISTENT0_SET		0x64
>  #define STMP3XXX_RTC_PERSISTENT0_CLR		0x68
> +#define STMP3XXX_RTC_PERSISTENT0_CLOCKSOURCE	(1 << 0)
>  #define STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE_EN	0x00000002
>  #define STMP3XXX_RTC_PERSISTENT0_ALARM_EN	0x00000004
> +#define STMP3XXX_RTC_PERSISTENT0_XTAL24MHZ_PWRUP (1 << 4)
> +#define STMP3XXX_RTC_PERSISTENT0_XTAL32KHZ_PWRUP (1 << 5)
> +#define STMP3XXX_RTC_PERSISTENT0_XTAL32_FREQ	(1 << 6)
> +
>  #define STMP3XXX_RTC_PERSISTENT0_ALARM_WAKE	0x00000080
>  
>  #define STMP3XXX_RTC_PERSISTENT1		0x70
>  /* missing bitmask in headers */
>  #define STMP3XXX_RTC_PERSISTENT1_FORCE_UPDATER	0x80000000
>  
> +enum clock_source { MXS_UNKNOWN, MXS_OSC_24M, MXS_OSC_32K, MXS_OSC_32K768 };
> +
We generic write it like

enum clock_source {
        MXS_UNKNOWN,
        MXS_OSC_24M,
        MXS_OSC_32K,
        MXS_OSC_32K768
};

Shawn

>  struct stmp3xxx_rtc_data {
>  	struct rtc_device *rtc;
>  	void __iomem *io;
>  	int irq_alarm;
> +	enum clock_source clk_src;
>  };
>  
>  #if IS_ENABLED(CONFIG_STMP3XXX_RTC_WATCHDOG)
> -- 
> 1.7.10.4
> 
