From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/8] rtc: sa1100: add OF support
Date: Thu, 1 Mar 2012 09:51:12 +0000
Message-ID: <201203010951.12405.arnd@arndb.de>
References: <1330582228-12424-1-git-send-email-haojian.zhuang@marvell.com>
 <1330582228-12424-4-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1330582228-12424-4-git-send-email-haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 01 March 2012, Haojian Zhuang wrote:
> +#ifdef CONFIG_OF
> +static int sa1100_rtc_probe_dt(struct platform_device *pdev,
> +                              struct sa1100_rtc *info)
> +{
> +       info->irq_alarm = platform_get_irq(pdev, 0);
> +       info->irq_1hz = platform_get_irq(pdev, 1);
> +       if (info->irq_1hz < 0 || info->irq_alarm < 0)
> +               return -ENODEV;
> +       return 0;
> +}
> +#else
> +static int sa1100_rtc_probe_dt(struct platform_device *pdev,
> +                              struct sa1100_rtc *info)
> +{
> +       return 1;
> +}
> +#endif
> +
> +static int sa1100_rtc_probe_irq(struct platform_device *pdev,
> +                               struct sa1100_rtc *info)
> +{
> +       info->irq_1hz = platform_get_irq_byname(pdev, "rtc 1Hz");
> +       info->irq_alarm = platform_get_irq_byname(pdev, "rtc alarm");
> +       if (info->irq_1hz < 0 || info->irq_alarm < 0)
> +               return -ENODEV;
> +       return 0;
> +}

This should not be necessary. I thought we had already added support
for named irq resources coming from the device tree. If not, why not
just make the other ones anonymous as well and just use platform_get_irq()?

	Arnd
