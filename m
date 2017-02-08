From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/9] arm64: dts: rockchip: support Google Kevin
Date: Tue, 7 Feb 2017 17:03:28 -0800
Message-ID: <20170208010327.GA77920@google.com>
References: <1480645653-36943-1-git-send-email-briannorris@chromium.org>
 <1779025.vjYEOhejf3@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1779025.vjYEOhejf3@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 08, 2017 at 02:01:42AM +0100, Heiko Stuebner wrote:
> Am Donnerstag, 1. Dezember 2016, 18:27:24 CET schrieb Brian Norris:
> > This series adds basic support for Google Kevin, a board in the Gru device
> > family. I do not add a leaf .dts board file for Gru, but I have retained the
> > split between "things that apply to the Gru family" (rk3399-gru.dtsi) and
> > "things that apply to Kevin only" (rk3399-gru-kevin.dtsi).
> 
> do you plan on refreshing these patches against the current kernel and the 
> comments received at some point?

I've fixed up a few locally, but I haven't had the time to
retest/resend. I plan to do so eventually, but not soon.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
