From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] rtc: mediatek: add driver for RTC on MT7622 SoC
Date: Thu, 19 Oct 2017 10:55:49 +0800
Message-ID: <1508381749.21840.123.camel@mtkswgap22>
References: <cover.1508231935.git.sean.wang@mediatek.com>
         <2f86eebfd380cf932808df3404e2f4a6f2f0f874.1508231935.git.sean.wang@mediatek.com>
         <1508325126.13340.25.camel@mtksdaap41>
         <20171018125743.kqna6b4lgng674om@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018125743.kqna6b4lgng674om-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, both

On Wed, 2017-10-18 at 14:57 +0200, Alexandre Belloni wrote:
> On 18/10/2017 at 19:12:06 +0800, Yingjoe Chen wrote:
> > On Tue, 2017-10-17 at 17:40 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > 
> > > This patch introduces the driver for the RTC on MT7622 SoC.
> > > 
> > > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  drivers/rtc/Kconfig      |  10 ++
> > >  drivers/rtc/Makefile     |   1 +
> > >  drivers/rtc/rtc-mt7622.c | 418 +++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 429 insertions(+)
> > >  create mode 100644 drivers/rtc/rtc-mt7622.c
> > > 
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index e0e58f3..4226295 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -1705,6 +1705,16 @@ config RTC_DRV_MOXART
> > >  	   This driver can also be built as a module. If so, the module
> > >  	   will be called rtc-moxart
> > >  
> > > +config RTC_DRV_MEDIATEK
> > 
> > How about changing this to RTC_DRV_MT7622 or RTC_DRV_MEDIATEK_SOC?
> > It is confusing to have both RTC_DRV_MEDIATEK & RTC_DRV_MT6397 here.
> > 
> 
> Yes, this has to be RTC_DRV_MT7622. It doesn't matter if it support
> future SoCs named differently, it will be less confusing than using
> anything with only mediatek in it.
> 

Agreed on. RTC_DRV_MT7622 will be applied instead to align the usage on
MT6397 and to get rid of such kind of confusion.


> > > +		return -EINVAL;
> > > +
> > > +	/* Keep yr_base used to calculate the calculate year when userspace
> > > +	 * queries and extend the maximum year the RTC can count.
> > > +	 */
> > > +	hw->yr_base[MTK_TC] = tm->tm_year - MTK_RTC_TM_YR_L -
> > > +			      (tm->tm_year % MTK_RTC_HW_YR_LIMIT);
> > 
> > 
> > I'm not sure this worth it.
> > If maximum year it can hold is 99, I'd bet it won't support leap year
> > correctly after 2100. This make the RTC useless after that. 
> > 
> > Also, yr_base is lost after power cycle, so you can't get correct year
> > back anyway.
> > 
> 
> I agree, the best you can do here is to only support 2000 to 2099.
> 

O.K. I will remove those yr_base extension and only consider only
support from 2000 to 2099 because of no much gain we can get from
yr_base.

The only gain is yr_base I thought just allows people have the
opportunity to set up rtc after 2100. However, it appears to not much
practical to foresee these things after 2100 and rtc must be setup again
when either year overflowing or power cycle happens after 2100 as Joe.C
mentioned.

In addition, I also found the rtc hardware would take year == 0 as not
leap year that works for 2100, 2200, 2300, but not for 2000, 2400,
2800,... and thus 2000 is also needed to be excluded in both set_time
and set_alarm if only 2000 to 2099 is supported.


	Sean

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
