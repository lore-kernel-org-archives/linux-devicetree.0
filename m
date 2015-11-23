From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for
 dragonboard OTG port
Date: Mon, 23 Nov 2015 10:10:52 +0800
Message-ID: <20151123021051.GB16321@shlinux2>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
 <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com>
 <20151111031445.GA8826@shlinux2>
 <56437F50.6050006@sonymobile.com>
 <20151112091349.GA3402@shlinux2>
 <877flhn9mh.fsf@saruman.tx.rr.com>
 <564FA087.5050807@sonymobile.com>
 <87mvu8b224.fsf@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87mvu8b224.fsf-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, =?iso-8859-1?Q?Andersson=2C_Bj=F6rn?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 20, 2015 at 06:58:59PM -0600, Felipe Balbi wrote:
> 
> Hi,
> 
> Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> writes:
> > On 11/16/2015 09:21 AM, Felipe Balbi wrote:
> >> 
> >> Hi,
> >> 
> >> Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> writes:
> >>> On Wed, Nov 11, 2015 at 09:48:00AM -0800, Tim Bird wrote:
> >>>>
> >>>>
> >>>> On 11/10/2015 07:14 PM, Peter Chen wrote:
> >>>>> On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
> >>>>>> This fixes a bug where if you disconnect and re-connect the USB cable,
> >>>>>> the gadget driver stops working.
> >>>>>>
> >>>>>> Add support for async_irq to wake up driver from low power mode.
> >>>>>> Without this, the power management code never calls resume.
> >>>>>> Also, have the phy driver kick the gadget driver (chipidea otg)
> >>>>>> by having the chipidea driver register with it, for vbus connect
> >>>>>> notifications.
> >>>>>>
> >>>>>> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> >>>>>> ---
> >>>>>>  drivers/usb/chipidea/udc.c    |  6 ++++++
> >>>>>>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
> >>>>>>  include/linux/usb/msm_hsusb.h |  1 +
> >>>>>>  3 files changed, 23 insertions(+)
> >> 
> >> I just wanna know how you guys want this to be handled ? Through my tree
> >> or chipidea's ? Or do we break the dependencies between the changes ?
> >
> > I'm fine with splitting it up.  I'm sending a new series with 3 patches
> > right after this message.  Do both trees go to linux-next?
> 
> I have my fixes and next branches both on next. Not sure about chipidea.
> 

Chipidea's fixes and next branches on next too.


-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
