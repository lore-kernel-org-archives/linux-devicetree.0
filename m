From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
Date: Fri, 23 Feb 2018 17:45:17 +0100
Message-ID: <20180223164517.aboazzeuujgtkh7q@verge.net.au>
References: <20180217020756.21474-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUiGAV7r55mqRH549BufDsh8_j8_S-BD_49sCM=aO9hZQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 18, 2018 at 04:07:51PM +0100, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> CC Steve Twiss
> 
> On Sat, Feb 17, 2018 at 3:07 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > Add PMIC nodes to Porter and connect CPU DVFS supply. There is
> > one DA9063 and one DA9210 on Porter, the only difference from
> > the other boards is that DA9063 is at I2C address 0x5a rather
> > than 0x58 .
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm/boot/dts/r8a7791-porter.dts
> > +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> > @@ -354,10 +354,47 @@
> >         clock-frequency = <400000>;
> >  };
> >
> > +&i2c6 {
> > +       status = "okay";
> > +       clock-frequency = <100000>;
> > +
> > +       pmic@5a {
> > +               compatible = "dlg,da9063";
> 
> Does it matter that this is a DA9063L ("Variant 6B")?
> Do we need a new compatible value, or can this be detected at runtime?

Hi Marek,

could you follow up on this?

> > +               reg = <0x5a>;
> > +               interrupt-parent = <&irqc0>;
> > +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> > +               interrupt-controller;
> > +
> > +               rtc {
> > +                       compatible = "dlg,da9063-rtc";
> > +               };
> > +
> > +               wdt {
> > +                       compatible = "dlg,da9063-watchdog";
> > +               };
> > +       };
> > +
> > +       vdd_dvfs: regulator@68 {
> > +               compatible = "dlg,da9210";
> > +               reg = <0x68>;
> > +               interrupt-parent = <&irqc0>;
> > +               interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +               regulator-min-microvolt = <1000000>;
> > +               regulator-max-microvolt = <1000000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +       };
> > +};
> > +
> >  &sata0 {
> >         status = "okay";
> >  };
> >
> > +&cpu0 {
> > +       cpu0-supply = <&vdd_dvfs>;
> > +};
> > +
> >  /* composite video input */
> >  &vin0 {
> >         status = "okay";
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
