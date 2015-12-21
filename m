From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: sun7i: Enable touchscreen on
 Wexler TAB7200 tablet
Date: Mon, 21 Dec 2015 16:43:42 +0100
Message-ID: <20151221154342.GV30359@lukather>
References: <1450428591-5597-1-git-send-email-mamlinav@gmail.com>
 <1450428710-5653-1-git-send-email-mamlinav@gmail.com>
 <20151218212525.GR30359@lukather>
 <CAF==cZWcY=FH9Sr8RY4j4Ob8iuiYrBGkajZDWpNQzS-t4d074Q@mail.gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MUnXZt0Uv08c1hBe"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBMF44CZQKGQEZCPW6QI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAF==cZWcY=FH9Sr8RY4j4Ob8iuiYrBGkajZDWpNQzS-t4d074Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--MUnXZt0Uv08c1hBe
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Sat, Dec 19, 2015 at 06:11:40PM +0300, Aleksei Mamlin wrote:
> 2015-12-19 0:25 GMT+03:00 Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> 
> > Hi,
> >
> > On Fri, Dec 18, 2015 at 11:51:50AM +0300, Aleksei Mamlin wrote:
> > > Add a node for the Goodix GT911 touchscreen found on the Wexler TAB7200
> > tablet
> > >
> > > Signed-off-by: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > index 239b5d2..ec3b837 100644
> > > --- a/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > +++ b/arch/arm/boot/dts/sun7i-a20-wexler-tab7200.dts
> > > @@ -102,6 +102,18 @@
> > >       pinctrl-names = "default";
> > >       pinctrl-0 = <&i2c2_pins_a>;
> > >       status = "okay";
> > > +
> > > +     gt911: touchscreen@5d {
> > > +             compatible = "goodix,gt911";
> > > +             reg = <0x5d>;
> > > +             interrupt-parent = <&pio>;
> > > +             interrupts = <7 21 IRQ_TYPE_EDGE_FALLING>; /* EINT21
> > (PH21) */
> > > +             pinctrl-names = "default";
> > > +             pinctrl-0 = <&ts_reset_pin>;
> > > +             irq-gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>; /* INT (PH21) */
> >
> > It seems odd that you need both irq-gpios and interrupts. These two
> > are completely redundant, and you should even actually use only one in
> > your driver, since the second request_irq will fail.
> >
> >
> We need both interrupts and irq-gpios because the driver uses the interrupt
> gpio pin as output to reset the device. See bindings documentation [1]
> 
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/dtor/input.git/tree/Documentation/devicetree/bindings/input/touchscreen/goodix.txt?h=goodix

Hmm, indeed, and even the documentation is confusing.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--MUnXZt0Uv08c1hBe--
