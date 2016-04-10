From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/4] support control with using GPIO lines
Date: Sun, 10 Apr 2016 17:12:37 +0200
Message-ID: <20160410151237.GD5377@piout.net>
References: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460300366-25248-1-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 10/04/2016 at 23:59:22 +0900, Akinobu Mita wrote :
> This series adds support access to DS1302 with GPIO lines.
> 
> Recently rtc-ds1302 is rewritten using SPI 3wire mode.  This adds
> another platform driver using GPIO while supporting both modes.
> 
> Thie series first fixes two problems I found while tesing, secondly
> introduces the abstraction layer for the register access which enables
> to share the most code between spi and platform driver, and adds
> the platform driver using GPIO.
> 

Well, isn't spi-gpio fitting for that use case? I'd like to avoid open
coding gpio bitbanging in the driver.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
