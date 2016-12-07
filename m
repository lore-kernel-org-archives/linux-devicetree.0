From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/9] arm64: dts: rockchip: support dwc3 USB for rk3399
Date: Wed, 7 Dec 2016 11:03:02 -0800
Message-ID: <20161207190301.GA107036@google.com>
References: <1480645653-36943-1-git-send-email-briannorris@chromium.org>
 <2947180.ggfADt6cbn@phil>
 <20161207175208.GB87970@google.com>
 <1972184.o3UeJg0tK9@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1972184.o3UeJg0tK9@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 07, 2016 at 08:01:23PM +0100, Heiko Stuebner wrote:
> Am Mittwoch, 7. Dezember 2016, 09:52:08 CET schrieb Brian Norris:
> > But pcie@f8000000 is also out of order then. I guess maybe
> > that's the only one then.
> 
> Yep, pcie is misplaced as sadly sometimes I miss those errors as well.

OK. Do you want me to patch that at the end of my series, or is that
unnecessary churn?

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
