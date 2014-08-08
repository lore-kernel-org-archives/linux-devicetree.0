From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: dts: add rk3288 dwc2 controller support
Date: Fri, 08 Aug 2014 17:53:45 +0200
Message-ID: <1596739.u7ZntKLW7r@diego>
References: <1407470159-14722-1-git-send-email-kever.yang@rock-chips.com> <1407470159-14722-4-git-send-email-kever.yang@rock-chips.com> <CAD=FV=XNSp85H2zVrLPdxDfhokEWFspvwUHjVMWRu8k_wFFm0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=XNSp85H2zVrLPdxDfhokEWFspvwUHjVMWRu8k_wFFm0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Eddie Cai <cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, han jiang <hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Freitag, 8. August 2014, 08:45:16 schrieb Doug Anderson:
> Kever,
> 
> On Thu, Aug 7, 2014 at 8:55 PM, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> 
wrote:
> > rk3288 has two kind of usb controller, this add the dwc2 controller
> > for otg and host1.
> > 
> > Controller can works with usb PHY default setting and Vbus on.
> > 
> > Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> > Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > ---
> > 
> > Changes in v5:
> > - change the sort order of dwc2 in rk3288.dtsi
> > 
> > Changes in v4: None
> > Changes in v3:
> > - EHCI and HSIC move new for version 3.
> > 
> > Changes in v2: None
> > 
> >  arch/arm/boot/dts/rk3288.dtsi | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> 
> IMHO this series is ready to go in for 3.18.  I'm assuming Heiko will
> pick it up once the bindings have landed.  It already has my tags.  ;)

correct ... the dts changes look ok, so I'll take patches 3 and 4 once patches 
1 and 2 are included somewhere.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
