From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v12] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Thu, 14 Jul 2016 19:21:13 -0700
Message-ID: <20160715022113.GA144623@google.com>
References: <1467100099-6172-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160714011331.GE54628@google.com>
 <57883BC5.7060600@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <57883BC5.7060600-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Binquan Peng <pengbinquan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 15, 2016 at 09:26:29AM +0800, Jiancheng Xue wrote:
> On 2016/7/14 9:13, Brian Norris wrote:
> > Pushed to l2-mtd.git, with the following diff due to API changes. Please
> > review to be sure it looks OK to you.
> > 
> 
> The changes are OK to me. Thanks!

Thanks for double checking.

> > Also, please base changes on l2-mtd.git or linux-next.git in the future.
> > 
> 
> The l2-mtd.git can't be accessed through http protocol now. The git protocol
> is forbidden in our office.

Hmm, that's too bad. I could probably bug the infradead.org admin to
change that...

At worst, you can at least check out the gitweb. e.g.:

http://git.infradead.org/l2-mtd.git/commitdiff/e523f11141bdc24f65775f0b1fa4a7ed404e68cc

> I will generate patch based on linux-next.git.

That will usually work just fine too. Although there can be some small
delay between linux-next updates (ranging from about a day, up to a week
or two (?) around the merge window).

Regards,
Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
