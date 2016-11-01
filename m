From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ul-14x14-evk: add USB dual-role support
Date: Tue, 1 Nov 2016 21:35:58 +0800
Message-ID: <20161101133556.GA9807@dragon>
References: <1470128903-942-1-git-send-email-peter.chen@nxp.com>
 <CAL411-p_T9DP61kVJ8yTf3v5tduAgTgPaKa1dBCPDo+RhP7igw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL411-p_T9DP61kVJ8yTf3v5tduAgTgPaKa1dBCPDo+RhP7igw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 28, 2016 at 05:17:24PM +0800, Peter Chen wrote:
> On Tue, Aug 2, 2016 at 5:08 PM, Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org> wrote:
> > With commit 851ce932242d ("usb: chipidea: otg: don't wait vbus
> > drops below BSV when starts host"), the driver can support
> > enabling vbus output without software control, so this board
> > (control vbus output through ID pin) can support dual-role now.
> >
> > Signed-off-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/imx6ul-14x14-evk.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dts b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> > index e281d50..c5cf942 100644
> > --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> > +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dts
> > @@ -225,7 +225,7 @@
> >  };
> >
> >  &usbotg1 {
> > -       dr_mode = "peripheral";
> > +       dr_mode = "otg";
> >         status = "okay";
> >  };
> >
> 
> Ping....

Applied, thanks.  Sorry for missing the patch in the first place.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
