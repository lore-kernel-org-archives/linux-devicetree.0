From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/2] Documentation: Document Hisilicon hix5hd2 sata PHY
Date: Fri, 27 Jun 2014 09:50:46 +0200
Message-ID: <11262017.C011KreL6u@wuerfel>
References: <1403687648-29082-1-git-send-email-zhangfei.gao@linaro.org> <4989178.vejv39dnj8@wuerfel> <53ACE6EE.4050300@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53ACE6EE.4050300-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, haifeng.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, jchxue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 27 June 2014 11:37:18 zhangfei wrote:
> >
> 
> Sorry for the confusion.
> 
> The phy is rather an analog controller, without standard register.
> Instead, the phy interface is just some pin / analog interface.
> The register is in fact hix5hd2 register, controls all the analog 
> output, including reset, power, speed, para tunning.

Ok, thanks for the explanation.

> Even the same phy is used in other soc, they can not share this driver, 
> since the connection must be different, as well as internal soc register 
> layout.
> Only if the same controller & phy are reused in other hisilicon soc, 
> this driver can be shared.
> 
> Since what we control is hix5hd2 controller itself, so it may not 
> suitable to put snps here.

Makes sense.

> And about hix5hd2 name: x is not wildcard.
> 
> Currently hix5hd2 is series of hi3716c v200, hi3719c v100, hi3718c v100.
> They are same soc, except minus pin assembles different.
> 
> However, not all hi37x is in this series, for example hi3716c v100 is a 
> different soc.
> 
> In the future hi3719m, hi3718m may also plan to add to hix5hd2 series.
> The difference will be different cpu core number, different gpu core 
> number. Also use different ethernet controller.

Ah, I think you explained this before, sorry for misremembering it.
 
> So we may still keep "hisilicon,hix5hd2-sata-phy" unchanged.
> What do you think?

Yes, please keep this string, it's good.

Thanks for your patience,

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
