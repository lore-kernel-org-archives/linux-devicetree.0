From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [v2 PATCH 2/3] clk: rockchip: add dclk_vop_frac ids for vop
Date: Fri, 02 Sep 2016 23:14:57 +0200
Message-ID: <3484639.uI2JjBHoTG@diego>
References: <1472786785-2393-1-git-send-email-zyw@rock-chips.com> <4896091.Zax1fNZjS5@diego> <b2d57b28-19dc-c55c-39b7-4b01f9365967@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2d57b28-19dc-c55c-39b7-4b01f9365967-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lin Huang <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 2. September 2016, 13:58:19 schrieb Chris Zhong:
> Hi Heiko
> 
> On 09/02/2016 01:43 PM, Heiko Stübner wrote:
> > Am Donnerstag, 1. September 2016, 20:26:24 schrieb Chris Zhong:
> >> From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> 
> >> Export the dclk_vop_frac out, so we can set the dclk_vop as the
> >> child of dclk_vop_frac, and then we can start to take use of
> >> the fractional dividers.
> >> 
> >> Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > 
> > Yakir is listed as author above, what relationship does Xing have to this
> > patch and the 3rd one?
> 
> Yakir is the author of the [2/3] and [3/3] patch, and Doug is the author
> of [1/3]
> The others are committer, and these tags should be removed.

not all of them ... i.e. your Signed-off needs to stay in, as you are the one 
sending in this set of patches ... I'll drop the Signed-off from Xing though.


Thanks for clarifying
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
