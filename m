From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] mtd: davinci-nand: disable subpage write for
 keystone-nand
Date: Wed, 30 Apr 2014 15:33:39 -0700
Message-ID: <20140430223339.GF2497@norris-Latitude-E6410>
References: <1395346112-13350-1-git-send-email-ivan.khoronzhuk@ti.com>
 <532B4C36.8060405@ti.com>
 <5343F0D6.2010804@ti.com>
 <20140416070833.GA5512@norris-Latitude-E6410>
 <534E51BF.9050508@ti.com>
 <535E5AF5.2020203@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <535E5AF5.2020203-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org, Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 28, 2014 at 09:43:17AM -0400, Santosh Shilimkar wrote:
> On Wednesday 16 April 2014 05:47 AM, Ivan Khoronzhuk wrote:
> > On 04/16/2014 10:08 AM, Brian Norris wrote:
> >> On Tue, Apr 08, 2014 at 03:51:34PM +0300, Ivan Khoronzhuk wrote:
> >>> Could you pick up subj patch?
> >> Pushed to l2-mtd.git. Is it critical this goes in for 3.15? It's
> >> currently queued for -next (3.16).
> >>
> 
> [..]
> 
> > 
> > This is a critical fix and it should be for 3.15.
> Ping. 3.15-rc3 is already out and I still see this fix merged
> yet.

OK, cherry-picked to linux-mtd.git with the intention of sending to
Linus soon.

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
