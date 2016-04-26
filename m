From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/18] ARM: multi_v7_defconfig: Enable STi FDMA driver
Date: Tue, 26 Apr 2016 11:42:53 +0100
Message-ID: <20160426104253.GB2984@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-9-git-send-email-peter.griffin@linaro.org>
 <5937696.Zdx8BrBD6K@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5937696.Zdx8BrBD6K@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Thu, 21 Apr 2016, Arnd Bergmann wrote:

> On Thursday 21 April 2016 12:04:25 Peter Griffin wrote:
> > This DMA controller is found on all STi chipsets.
> > 
> > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/configs/multi_v7_defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> > index 2823490..61008a0 100644
> > --- a/arch/arm/configs/multi_v7_defconfig
> > +++ b/arch/arm/configs/multi_v7_defconfig
> > @@ -727,6 +727,7 @@ CONFIG_DMA_OMAP=y
> >  CONFIG_QCOM_BAM_DMA=y
> >  CONFIG_XILINX_VDMA=y
> >  CONFIG_DMA_SUN6I=y
> > +CONFIG_ST_FDMA=y
> >  CONFIG_STAGING=y
> >  CONFIG_SENSORS_ISL29018=y
> >  CONFIG_SENSORS_ISL29028=y
> > -- 
> 
> Is this needed for booting? If not, make it a loadable module.

No it isn't required for booting. Will fix in v4.

Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
