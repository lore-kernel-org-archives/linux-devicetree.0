From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Date: Thu, 5 Feb 2015 17:33:31 -0800
Message-ID: <20150206013331.GE30781@ld-irv-0074>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <20141130090853.GG3608@norris-Latitude-E6410>
 <548987D3.3060407@gmail.com>
 <20141217062333.GD7112@brian-ubuntu>
 <5491638B.5090403@gmail.com>
 <20150113041701.GM9759@ld-irv-0074>
 <54C06E05.9050205@hisilicon.com>
 <20150122084529.GC3268@brian-ubuntu>
 <54C4A71F.30200@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54C4A71F.30200-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Iwo Mergler <Iwo.Mergler-/K5RfY/kUqoaXkdz0Xzl5EEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 25, 2015 at 04:19:43PM +0800, Zhou Wang wrote:
> On 2015/1/22 16:45, Brian Norris wrote:
> > Perhaps you can switch between ECC mode and non-ECC mode?
> 
> I also tried to swith to non-ECC mode to implement raw_write, and it is easy to do this.
> 
> But, event we do this, it will bring me little help. The reason to implement raw_write is to
> run mtd_nandbiterrs correctly as the discussion above. However, this NAND controller writes
> data and ECC code to flash using different layouts in different modes.

Ugh, that's no fun. GPMI seems to do a similarly silly thing.

> So we should also read data
> and ECC code from flash, change related bits, then rewrite the data and ECC code to flash in none-ECC
> mode to run mtd_nandbiterrs. It is not easy to do this.
> 
> So my plan is not to implement raw_write hook if this function is just used in test.

OK. There may eventually be good reasons to do this still, but it's not
important right now.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
