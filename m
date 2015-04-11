From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Sat, 11 Apr 2015 19:36:14 +0300
Message-ID: <20150411193614.83013f345aaa1123ef55ecbf@gmail.com>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
	<20150331144338.GG23664@lukather>
	<20150331223120.10199bf9e3fb41b16f879eca@gmail.com>
	<20150402185008.GC14618@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150402185008.GC14618@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2 Apr 2015 20:50:08 +0200
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Tue, Mar 31, 2015 at 10:31:20PM +0300, Aleksei Mamlin wrote:
> > > > +		compatible = "goodix,gt911";
> > > > +		reg = <0x5d>;
> > > > +		interrupt-parent = <&pio>;
> > > > +		interrupts = <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> > > 
> > > Unfortunately, IRQ_TYPE_NONE is not a valid value for the GIC
> > > bindings.
> > > 
> >
> > Hmm. Which value I must use in this case? IRQ type is set by the
> > touchscreen controller driver, so I think that value must be 0.
> 
> Whatever the hardware is using. Presumably the same value than the
> driver sets.
> 
> > >
> > > You're also not adding a pinctrl group for that pin?
> >
> > No, because it works fine with this DT nodes. It seems that I should
> > first configure pin to work in interrupt mode. Correct?
> 
> You don't have to, since the pio driver will already take care of
> muxing it to the right function, but that will prevent any driver to
> call pinctrl_request on the same pin.
> 
It is still necessary?
I see that you have accepted Hans de Goede's patches: http://www.spinics.net/lists/arm-kernel/msg411142.html
>
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com


-- 
Thanks and regards,
Aleksei Mamlin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
