From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 03/13] ARM: STi: DT: STiH416: Add DT nodes for the ehci
 and ohci usb controllers.
Date: Wed, 12 Nov 2014 13:44:12 +0000
Message-ID: <20141112134412.GA20187@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-4-git-send-email-peter.griffin@linaro.org>
 <2945908.5UNg8NaKcc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2945908.5UNg8NaKcc@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Thanks for reviewing.

On Fri, 07 Nov 2014, Arnd Bergmann wrote:

> > +               ehci0: usb@0xfe1ffe00 {
> 
> Please drop the '0x' from the unit address in all instances.

Ok, fixed in v2

> 
> > +                       compatible = "st,st-ehci-300x";
> > +                       reg = <0xfe1ffe00 0x100>;
> > +                       interrupts = <GIC_SPI 148 IRQ_TYPE_NONE>;
> > +                       pinctrl-names = "default";
> > +                       pinctrl-0 = <&pinctrl_usb0>;
> > +                       clocks = <&clk_s_a1_ls 0>,
> > +                                <&clockgen_b0 0>;
> > +                       clock-names = "ic", "clk48";
> > +
> > +                       phys = <&usb2_phy>;
> > +                       phy-names = "usb";
> > +                       status = "okay";
> 
> No need to list 'status="okay"', it's the default. It might
> make sense to change this to 'status="disabled"' though, if the ports
> might be unused on some boards.

ok, removed in v2

> 
> >                 mmc0: sdhci@fe81e000 {
> >                         bus-width = <8>;
> >                 };
> > +
> > +               usb0: usb@fe100000 {
> > +                       status = "okay";
> > +               };
> > +
> > +               usb1: usb@fe200000 {
> > +                       status = "okay";
> > +               };
> > +
> > +               usb2: usb@fe300000 {
> > +                       status = "okay";
> > +               };
> 
> I don't understand this part: why do you add extra nodes here that only
> contain a status property?

Good spot, this is a bit of legacy code which I should have removed before submitting.
It's removed in v2.

regards,

Peter.
