From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/9] dts: versatile: add sysregs nodes
Date: Thu, 15 Jan 2015 16:06:35 +0000
Message-ID: <20150115160635.GA1576@red-moon>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
 <1419967718-26909-6-git-send-email-robherring2@gmail.com>
 <CACRpkdbinR3Uvi5zZmQJFxJgnWfvE6JZouMVxxRRGVtMNXkBQQ@mail.gmail.com>
 <CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKBLx03E1w0NMH8CH+Pm_L8yQvnR6VTTDxqnpOwAoDhXg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 08, 2015 at 11:53:15PM +0000, Rob Herring wrote:
> Adding VExpress maintainers...
> 
> On Thu, Jan 8, 2015 at 1:44 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > On Tue, Dec 30, 2014 at 8:28 PM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> >> From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> The Versatile boards have the same sysregs as other ARM Ltd boards. Add
> >> the nodes in preparation to enable support for 24MHz counter as
> >> sched_clock and MMC card detect and write protect support.
> >>
> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> >> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> ---
> >>  arch/arm/boot/dts/versatile-ab.dts | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/versatile-ab.dts b/arch/arm/boot/dts/versatile-ab.dts
> >> index 27d0d9c..62f04b0 100644
> >> --- a/arch/arm/boot/dts/versatile-ab.dts
> >> +++ b/arch/arm/boot/dts/versatile-ab.dts
> >> @@ -252,6 +252,29 @@
> >>                         #size-cells = <1>;
> >>                         ranges = <0 0x10000000 0x10000>;
> >>
> >> +                       sysreg@0 {
> >> +                               compatible = "arm,vexpress-sysreg";
> >
> > vexpress? No...
> 
> Compatible with yes. Should perhaps be '"arm,versatile-sysreg",
> "arm,vexpress-sysreg"' instead. Kind of backwards, as really the
> versatile came first, but it would work. Or we just need another match
> entry in the kernel.

versatile and vexpress sys registers are not compatible, so they should
not be treated as such.

Actually, versatile regs are not managed by a single entity driver
in the kernel, so basically I really think you should not leave

"arm,vexpress-sysreg"

in the compatible list.

> I copied this whole chunk as is from VExpress and verified these sub
> nodes are all the same hence why it is here.
> 
> > compatible = "syscon";
> 
> maybe? VExpress is missing that then...

vexpress-sysreg is more than a "syscon" interface, so we can't match
on it, it would be wrong.

> 
> >> +                               reg = <0x00000 0x1000>;
> >> +
> >> +                               v2m_led_gpios: sys_led@08 {
> >> +                                       compatible = "arm,vexpress-sysreg,sys_led";
> >> +                                       gpio-controller;
> >> +                                       #gpio-cells = <2>;
> >> +                               };
> >
> > These are not GPIOs. These are LED registers really.
> 
> A register bit that controls an i/o signal sounds like a GPIO to me.

To me too. I agree that definining a gpio-controller for every possible
gpio pin would soon get unwieldy, but hey, the choice made for vexpress
leds makes perfect sense to me, after all they are gpio signals
connected to leds, and there is a driver for that in the kernel:

drivers/leds/leds-gpio.c

we could move this stuff to syscon-leds, but honestly I think is one of those
things we could argue forever about that.

> > see how to use LEDs from drivers/leds/leds-syscon.c and bindings.
> > example in:
> > arch/arm/boot/dts/integrator.dtsi
> >
> > Very straight-forward I think.
> 
> So we have 2 implementations and bindings for roughly the same hardware? Great!

See above.

> >> +                               v2m_mmc_gpios: sys_mci@48 {
> >> +                                       compatible = "arm,vexpress-sysreg,sys_mci";
> >> +                                       gpio-controller;
> >> +                                       #gpio-cells = <2>;
> >> +                               };
> >> +
> >> +                               v2m_flash_gpios: sys_flash@4c {
> >> +                                       compatible = "arm,vexpress-sysreg,sys_flash";
> >> +                                       gpio-controller;
> >> +                                       #gpio-cells = <2>;
> >> +                               };
> >
> > I don't have drivers for these "gpio controllers" and I don't think they are
> > GPIOs either, since they are not general purpose at all.
> 
> They are only general purpose until you connect the i/o lines to
> something. But yes, if we went around making every misc internal
> control line in SOCs a 1-bit GPIO controller that would be pretty
> crazy.
> 
> Anyway, most of this is not actually used ATM on Versatile, but it is
> present in VExpress. I added it only for sched_clock. We need to
> resolve this with VExpress platforms, but it's already in use for MMC
> and LEDs.

I did not get what you meant here, in particular which bits you want us
to fix/change/update on vexpress.

Thanks,
Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
