From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 13/14] ARM: STi: DT: STiH410: Add usb2 picophy dt nodes
Date: Thu, 13 Nov 2014 14:54:19 +0000
Message-ID: <20141113145419.GA30296@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1415876417-28728-1-git-send-email-peter.griffin@linaro.org>
 <1415876417-28728-14-git-send-email-peter.griffin@linaro.org>
 <3348806.YN8XP4V4uc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3348806.YN8XP4V4uc@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for reviewing.

On Thu, 13 Nov 2014, Arnd Bergmann wrote:

> On Thursday 13 November 2014 11:00:16 Peter Griffin wrote:
> > +       soc {
> > +               usb2_picophy0: usbpicophy@0 {
> > +                       compatible = "st,stih407-usb2-phy";
> > +                       reg = <0xf8 0x04>,      /* syscfg 5062 */
> > +                             <0xf4 0x04>;      /* syscfg 5061 */
> > 
> 
> I think the node name for the phy should be "phy@f8" instead of usbpicophy@0
> by common convention. I notice that there are some existing instances of
> this, you can probably change them as well. Linux doesn't normally care
> about the node names.

Ok will fix in v3

> 
> It also seems that you have put the node in the wrong place, as the reg
> property apparently refers to a different address space. Did you mean
> to put this under the syscfg_core node?

Your correct in that it refers to the syscfg_core address space.
However I intentionaly didn't put it under the syscfg_core node.

The phy is more unique than most other devices in that in this instance it
is only controlled from two syscfg_core registers which happen to be in the same
sysconf bank.

However most other devices tend to have a combination of some memory mapped
registers and also some sysconfig registers which does then create a conflict
over where the dt node should live.

Currently I can't find an example but there is also no guarentee that a
device will not have some configuration bits in syscfg_core and some
other bits in syscfg_rear/front registers. The phy for example could
have had one register in each, which would make deciding where to put
it difficult.

So to create coherency / conformity we decided to put all the IP blocks under the soc node.

Also its worth pointing if your not already aware that sysconf_core/rear/front isn't
really a device, it's just a regmap abstraction of some memory mapped configuration
registers where a bunch of seemingly random control bits get stuffed.

Of course if you feel strongly about it I can of course change it like you suggested,
but that is the reasoning / rationale of why it was done like this initially.

regards,

Peter.






--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
