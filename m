From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 6/7] arm: mediatek: enable gpt6 on boot up to make arch
 timer working
Date: Thu, 14 Aug 2014 10:24:25 +0800
Message-ID: <1407983065.3412.8.camel@mtksdaap41>
References: <1406824943-24052-1-git-send-email-matthias.bgg@gmail.com>
 <1406824943-24052-7-git-send-email-matthias.bgg@gmail.com>
 <CACRpkdbRhGE8tcKj+W_4F9-xmcm-fxcYuCmLOqX-ESC+3PAmyA@mail.gmail.com>
 <CABuKBe+Q3tnN0s22EMY-dK_6FeN_xN9SmrsW3dPONR6QDJ+V_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBe+Q3tnN0s22EMY-dK_6FeN_xN9SmrsW3dPONR6QDJ+V_w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "Berg,
 Anders" <anders.berg@lsi.com>, Mike Turquette <mturquette@linaro.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stefan@agner.ch, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infr>
List-Id: devicetree@vger.kernel.org

On Tue, 2014-08-12 at 11:02 +0200, Matthias Brugger wrote:
> 2014-08-11 9:15 GMT+02:00 Linus Walleij <linus.walleij@linaro.org>:
> > On Thu, Jul 31, 2014 at 6:42 PM, Matthias Brugger
> > <matthias.bgg@gmail.com> wrote:
> >
> >> We enable GTP6 which ungates the arch timer clock. Apart we write the
> >> frequency with which the timer is running in the CNTFREQ register.
> >> In the future this should be done in the bootloader.
> >>
> >> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> > (...)
> >
> >> +       if (of_machine_is_compatible("mediatek,mt6589")) {
> >> +               /* set cntfreq register which is not done in bootloader */
> >> +               asm volatile("mcr p15, 0, %0, c14, c0, 0" : : "r" (13000000));
> >
> > I guess this is for something like the ARM arch timer in
> > drivers/clocksource/arm_arch_timer.c
> >
> > Instead of doing this, use the DT property "clock-frequency" on
> > the ARM arch timer node, as that overrides the CP15 setting.
> >
> >> +
> >> +               /* turn on GPT6 which ungates arch timer clocks */
> >> +               gpt_base = ioremap(GPT6_CON_MT65xx, 0x04);
> >> +       }
> >> +
> >> +       /* enabel clock and set to free-run */
> >> +       if (gpt_base)
> >> +               writel(0x31, gpt_base);
> >
> > Why is this not done properly in the GPT driver (I guess
> > in drivers/clocksource/mtk_timer.c) instead of remapping
> > it and fiddling around in the machine?
> 
> I didn't put it in the GPT driver, because that would mean, that you
> need to have the mtk_timer to be able to use the ARM arch timer.
> From my understanding this are two independent blocks in the SoC.
> Apart from that, as stated in the commit message, this patch is a
> workaround until we have a bootloader which does this for us.
> Therefore I thought the init_time function would be the better place to do this.

Can we have a separate node like mt6577-timerfixup then?
I'm preparing patch for mt8127 and mt8135. They all need this and use
same address and. In current form, I'll have to make this check against
a compatible string array.

Joe.C
