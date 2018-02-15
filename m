From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] rtc: isl1208: Fix unintended clear of SR bits
Date: Thu, 15 Feb 2018 09:30:28 +0100
Message-ID: <20180215083028.GH8219@piout.net>
References: <20180123121801.4214-1-m.grzeschik@pengutronix.de>
 <20180123121801.4214-2-m.grzeschik@pengutronix.de>
 <20180214202610.GD8219@piout.net>
 <1518679666.5448.4.camel@diehl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1518679666.5448.4.camel-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis OSTERLAND <denis.osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
Cc: "m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, "linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org" <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jdelvare-IBi9RG/b67k@public.gmane.org" <jdelvare-IBi9RG/b67k@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15/02/2018 at 07:27:47 +0000, Denis OSTERLAND wrote:
> Am Mittwoch, den 14.02.2018, 21:26 +0100 schrieb Alexandre Belloni:
> > On 23/01/2018 at 13:17:58 +0100, Michael Grzeschik wrote:
> > > 
> > > From: Denis Osterland <Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
> > > 
> > > After successful
> > > sr = isl1208_i2c_set_regs(client, 0, regs, ISL1208_RTC_SECTION_LEN);
> > > sr will be 0.
> > > As a result
> > > sr = i2c_smbus_write_byte_data(client, ISL1208_REG_SR,
> > > 			sr & ~ISL1208_REG_SR_WRTC);
> > > is equal to
> > > sr = i2c_smbus_write_byte_data(client, ISL1208_REG_SR, 0);
> > > which clears all flags in SR.
> > > 
> > > Add an additional read of SR, to have value of SR in sr again.
> > > 
> > > Signed-off-by: Denis Osterland <Denis.Osterland-85mDkmTllUAAvxtiuMwx3w@public.gmane.org>
> > > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > ---
> > >  drivers/rtc/rtc-isl1208.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > Applied, thanks.
> > 
> You are welcome.
> 
> One question, shall we avoid resent this patch in v2 of this series?
> I ask because we are pretty far with the suggested changes.
> 

No need to resend. If necessary, you can base v2 on top of rtc-next.


-- 
Alexandre Belloni, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
