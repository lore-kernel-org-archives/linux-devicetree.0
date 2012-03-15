From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2] ARM: SPEAr600: Add device-tree support to SPEAr600
 boards
Date: Thu, 15 Mar 2012 09:41:02 +0100
Message-ID: <201203150941.02822.sr@denx.de>
References: <1331737232-25477-1-git-send-email-sr@denx.de>
 <4F61A62A.3040501@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F61A62A.3040501-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Viresh Kumar <viresh.kumar-qxv4g6HH51o@public.gmane.org>
Cc: "devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org" <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, spear-devel <spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Viresh,

On Thursday 15 March 2012 09:19:54 Viresh Kumar wrote:
> Hi Stefan,
> 
> Thanks for your patch. :)

You are welcome. :)
 
> I have looked carefully at the patch, regarding addresses and irq numbers,
> and they look fine. Just few minor comments below:
> 
> On 3/14/2012 8:30 PM, Stefan Roese wrote:
> > diff --git a/arch/arm/boot/dts/spear600.dtsi
> > b/arch/arm/boot/dts/spear600.dtsi
> > 
> > +       soc {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               compatible = "simple-bus";
> > +               ranges;
> > +
> > 
> > +
> > +               gmac0: ethernet@e0800000 {
> 
> There is no gmac1, so can name it gmac only.

I have no strong preference here. Not sure, what the common practice is. But I 
can remove the numbers on those single instance devices.
 
> > +                       compatible = "st,spear600-gmac";
> > +                       reg = <0xe0800000 0x8000>;
> > +                       interrupt-parent = <&vic1>;
> > +                       interrupts = <24 23>;
> > +                       interrupt-names = "macirq", "eth_wake_irq";
> > +                       mac-address = [000000000000]; /* Filled in by
> > U-Boot */ +               };
> > +
> > 
> > +               fsmc0: flash@d1800000 {
> 
> same.
> 
> > +                       status = "disabled";
> > +                       compatible = "st,spear600-fsmc-nand";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       reg = <0xd1800000 0x1000        /* FSMC Register
> > */ +                              0xd2000000 0x4000>;      /* NAND Base
> > */ +                       reg-names = "fsmc_regs", "nand_data";
> > +               };
> > +
> > +               smi0: flash@fc000000 {
> 
> same
> 
> > +                       status = "disabled";
> > +                       compatible = "st,spear600-smi";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       reg = <0xfc000000 0x1000>;
> > +                       interrupt-parent = <&vic1>;
> > +                       interrupts = <12>;
> > +               };
> > +
> > 
> > diff --git a/arch/arm/mach-spear6xx/spear600_evb.c
> > b/arch/arm/mach-spear6xx/spear600_evb.c index c6e4254..c4949aa 100644
> > --- a/arch/arm/mach-spear6xx/spear600_evb.c
> > +++ b/arch/arm/mach-spear6xx/spear600_evb.c
> > @@ -32,9 +32,6 @@ static void __init spear600_evb_init(void)
> > 
> >  {
> >  
> >         unsigned int i;
> 
> Why don't we remove the devices from arrays above, which are now
> supported by DT?

This is the non-DT file (spear600_evb.c). I wanted to preserve it, so that it 
still can be built. But thinking a bit more about it, the current mainline 
SPEAr600 port only supports UART and GPIO as peripheral devices. And this 
SPEAr600 DT patch also supports those and even more devices.

So why don't we make an even bigger "cut", and remove the non-DT SPEAr600 
files/data completely now? If you give me your ACK on this, I'll squash this 
into my patch as well, resulting in a nice diffstat. ;)
 
> > -       /* call spear600 machine init function */
> > -       spear600_init();
> > -
> > 
> >         /* Add Platform Devices */
> >         platform_add_devices(plat_devs, ARRAY_SIZE(plat_devs));
> > 
> > diff --git a/arch/arm/mach-spear6xx/spear6xx.c
> > b/arch/arm/mach-spear6xx/spear6xx.c
> > 
> > +static const struct of_device_id vic_of_match[] __initconst = {
> > +       { .compatible = "arm,pl190-vic", .data = vic_of_init, },
> > +       { /* Sentinel */ }
> > +};
> > +
> > +static void __init spear6xx_dt_init_irq(void)
> > +{
> > +       of_irq_init(vic_of_match);
> > +}
> > +
> 
> Did you checked this out?

Not yet. Sorry, I missed it. Will check now...

Thanks,
Stefan
