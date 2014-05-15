From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 4/6] arm: add basic support for Mediatek MT6589 boards
Date: Thu, 15 May 2014 09:58:30 +0200
Message-ID: <4623149.HtC2qgQ8vE@wuerfel>
References: <1399938570-11356-1-git-send-email-matthias.bgg@gmail.com>
 <20140514070038.GG29258@lukather> <20140514212612.GK20486@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140514212612.GK20486@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, gregory.clement@free-electrons.com, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, daniel.lezcano@linaro.org, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, robh+dt@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, Maxime Ripard <maxime.ripard@free-electrons.com>, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 14 May 2014 14:26:12 Stephen Boyd wrote:
> On 05/14, Maxime Ripard wrote:
> > On Tue, May 13, 2014 at 03:47:32PM -0700, Stephen Boyd wrote:
> > > On 05/13, Matthias Brugger wrote:
> > > > +	"mediatek,mt6589",
> > > > +	NULL,
> > > > +};
> > > > +
> > > > +DT_MACHINE_START(MEDIATEK_DT, "Mediatek Cortex-A7 (Device Tree)")
> > > > +	.dt_compat	= mediatek_board_dt_compat,
> > > > +MACHINE_END
> > > 
> > > You shouldn't need this file at all if the platform is part of
> > > the multi-platform kernel.
> > 
> > From a technical point of view, you don't. But it's interesting to
> > keep it mostly for two things:
> >   - You get to see the platform name in /proc/cpuinfo
> >   - If you ever need to add platform quirks, it's already there
> > 
> > We had a similar discussion two weeks ago for mach-sunxi with Olof and
> > Arnd, and ended up keeping this minimal machine.
> > 
> 
> It looks like it's only useful to make /proc/cpuinfo have the
> platform name because it really isn't that hard to add this file
> if we need to add platform quirks. The downside is we have to
> keep adding compatibles when we support new SoCs.

We also still add Kconfig entries for each new platform, and I'd like
to leave it at that for the time being. In a lot of cases we end
up adding stuff to the machine descriptor later, e.g. for SMP support
(hopefully no more thanks to your work though).

Once we have a significant number of machines that are actually
usable rather than stubs and that we are confident about never
needing any additional pointers, we can revisit this discussion.

At that point, we should also discuss how to avoid adding a Kconfig
entry for each new platform, which e.g. involves making the
clocksource drivers user selectable. That part has been surprisingly
controversial in the past.

	Arnd
