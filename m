From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: new platform for Energy Micro's EFM32 Cortex-M3
 SoCs
Date: Thu, 19 Sep 2013 13:28:12 +0200
Message-ID: <201309191328.12717.arnd@arndb.de>
References: <1379447884-14025-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <201309172245.25367.arnd@arndb.de> <20130918153424.GR24802@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130918153424.GR24802@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Olof Johansson <olof@lixom.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 18 September 2013, Uwe Kleine-K=F6nig wrote:
> On Tue, Sep 17, 2013 at 10:45:25PM +0200, Arnd Bergmann wrote:
> > On Tuesday 17 September 2013, Uwe Kleine-K=F6nig wrote:
> > =

> > You should be able to add NOMMU platforms in combination with
> > CONFIG_MULTIPLATFORM now, which gets rid of most of these files.
> in next ARCH_MULTIPLATFORM still depends on MMU. What am I missing?

Oh, I saw a patch for that for VEXPRESS/Cortex-R7 some time ago. It was app=
arently
not merged. Please try just removing the depdency in Kconfig, I think it sh=
ould
work fine.

> > > +
> > > +void __init efm32_init_time(void)
> > > +{
> > > +	of_clk_init(NULL);
> > > +	clocksource_of_init();
> > > +}
> > =

> > When Sebastian Hesselbarth's patches for of_clk_init() are merged,
> > this function can go away.
> Do you have a link?

http://lmgtfy.com/?q=3Dhesselbarth+of_clk_init ;-)

I've put Sebastian on Cc, I guess he can comment on the status of his
patches, so we can come up with a plan for dealing with the dependency
here.

> > > diff --git a/arch/arm/mach-efm32/include/mach/debug-macro.S b/arch/ar=
m/mach-efm32/include/mach/debug-macro.S
> > > new file mode 100644
> > > index 0000000..c58915c
> > > --- /dev/null
> > > +++ b/arch/arm/mach-efm32/include/mach/debug-macro.S
> > =

> > Please move this to arch/arm/include/debug/ like the other such
> > implementations.
> I don't mind, but I thought this is only for devices that are expected
> to be available on >1 platform.

Well, it's required for multiplatform, since the include/mach/ directory is=
 no
longer visible to the debug code.

> > > diff --git a/arch/arm/mach-efm32/include/mach/entry-macro.S b/arch/ar=
m/mach-efm32/include/mach/entry-macro.S
> > > new file mode 100644
> > > index 0000000..f0c0f7d
> > > --- /dev/null
> > > +++ b/arch/arm/mach-efm32/include/mach/entry-macro.S
> > > @@ -0,0 +1,5 @@
> > > +		.macro	get_irqnr_preamble, base, tmp
> > > +		.endm
> > > +
> > > +		.macro	arch_ret_to_user, tmp1, tmp2
> > > +		.endm
> > =

> > And use set_handle_irq() to register a handler from your irqchip driver
> > to get rid of this one.
> ISTR that I tried that, but I don't remember the details. I will retry.

Maybe you get some spurious interrupt before the irqchip is registered?

	Arndj
