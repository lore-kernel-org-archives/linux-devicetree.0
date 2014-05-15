From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 4/6] arm: add basic support for Mediatek MT6589 boards
Date: Thu, 15 May 2014 08:00:16 -0500
Message-ID: <CAL_JsqJU9syDFFjjNL9H5o4jBReuidNFbDxYW4HX6HrG7yfNFw@mail.gmail.com>
References: <1399938570-11356-1-git-send-email-matthias.bgg@gmail.com>
 <20140514070038.GG29258@lukather>
 <20140514212612.GK20486@codeaurora.org>
 <4623149.HtC2qgQ8vE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4623149.HtC2qgQ8vE@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@bq.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Florian Vaussard <florian.vaussard@epfl.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 15, 2014 at 2:58 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 14 May 2014 14:26:12 Stephen Boyd wrote:
>> On 05/14, Maxime Ripard wrote:
>> > On Tue, May 13, 2014 at 03:47:32PM -0700, Stephen Boyd wrote:
>> > > On 05/13, Matthias Brugger wrote:
>> > > > +       "mediatek,mt6589",
>> > > > +       NULL,
>> > > > +};
>> > > > +
>> > > > +DT_MACHINE_START(MEDIATEK_DT, "Mediatek Cortex-A7 (Device Tree)")
>> > > > +       .dt_compat      = mediatek_board_dt_compat,
>> > > > +MACHINE_END
>> > >
>> > > You shouldn't need this file at all if the platform is part of
>> > > the multi-platform kernel.
>> >
>> > From a technical point of view, you don't. But it's interesting to
>> > keep it mostly for two things:
>> >   - You get to see the platform name in /proc/cpuinfo
>> >   - If you ever need to add platform quirks, it's already there
>> >
>> > We had a similar discussion two weeks ago for mach-sunxi with Olof and
>> > Arnd, and ended up keeping this minimal machine.
>> >
>>
>> It looks like it's only useful to make /proc/cpuinfo have the
>> platform name because it really isn't that hard to add this file
>> if we need to add platform quirks. The downside is we have to
>> keep adding compatibles when we support new SoCs.
>
> We also still add Kconfig entries for each new platform, and I'd like
> to leave it at that for the time being. In a lot of cases we end
> up adding stuff to the machine descriptor later, e.g. for SMP support
> (hopefully no more thanks to your work though).
>
> Once we have a significant number of machines that are actually
> usable rather than stubs and that we are confident about never
> needing any additional pointers, we can revisit this discussion.
>
> At that point, we should also discuss how to avoid adding a Kconfig
> entry for each new platform, which e.g. involves making the
> clocksource drivers user selectable. That part has been surprisingly
> controversial in the past.

The kconfig part doesn't really worry me. The cpuinfo string is
something we should decide now because it leaks to userspace. There
are 3 possible positions I can think of:

1) The name is part of the ABI and we can never remove/change the string.

2) The name is not an ABI and either:
a) we don't care if it changes with matching a machine desc or not.
b) we still want it to be consistent independent of matching

2a is what we have today. I'm in favor of 2b and therefore should get
the name from DT. It is similar to names in /sys/bus/platform/ which
are not considered part of the ABI. The string already changed moving
platforms to DT and that did not seem to cause any issues that I heard
of.

Rob
