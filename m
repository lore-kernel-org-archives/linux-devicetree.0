From: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Tue, 31 Mar 2015 22:31:20 +0300
Message-ID: <20150331223120.10199bf9e3fb41b16f879eca@gmail.com>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
	<20150331144338.GG23664@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331144338.GG23664@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 31 Mar 2015 07:43:38 -0700
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hi,
> 
> On Tue, Mar 31, 2015 at 11:18:17AM +0300, Aleksei Mamlin wrote:
> > This patch adds nodes for the Goodix GT911 touchscreen controller found
> > on the Wexler TAB7200 tablet. Controller uses one of following I2C
> > addresses: 0x5d or 0x14, so just add two nodes.
> 
> In which case are these different addresses encountered? Different
> revisions of the same board?
> 
> > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> > DT support for the Goodix GT911 touchscreen controller has been queued up
> > by Dmitry Torokhov for merging into 4.1:
> > https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/commit/?h=next&id=771d8f1b178e7e09fcc641fccd48852958dbc329
> > 
> > IRQ flags are set by the touchscreen controller driver, so use IRQ_TYPE_NONE.
> > 
> >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > index 2ad3b09..34e2bce 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > @@ -101,6 +101,20 @@
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&i2c2_pins_a>;
> >  	status = "okay";
> > +
> > +	gt911@5d {
> 
> The node name should be the class of the device. touchscreen in this
> case.
> 
Ok, I'll fix it.
>
> > +		compatible = "goodix,gt911";
> > +		reg = <0x5d>;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> 
> Unfortunately, IRQ_TYPE_NONE is not a valid value for the GIC
> bindings.
> 
Hmm. Which value I must use in this case? IRQ type is set by the touchscreen controller driver, so I think that value must be 0.
>
> You're also not adding a pinctrl group for that pin?
>
No, because it works fine with this DT nodes. It seems that I should first configure pin to work in interrupt mode. Correct?
>
> > +	};
> > +
> > +	gt911@14 {
> > +		compatible = "goodix,gt911";
> > +		reg = <0x14>;
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <21 IRQ_TYPE_NONE>; /* EINT21 (PH21) */
> > +	};
> 
> And nodes should be ordered by addresses ascending order.
>
I'll fix it too.
>
> Thanks!
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
