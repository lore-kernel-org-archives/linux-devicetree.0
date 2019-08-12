From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Drop PMU node
Date: Mon, 12 Aug 2019 11:01:51 -0700
Message-ID: <CA+E=qVchsqOF_hVD-qBuKwi7PTMYtUR-LE2dD_mpptFJcWE_yw@mail.gmail.com>
References: <89402d22-d432-9551-e787-c8ede16dbe5f@arm.com>
 <CA+E=qVfh7mirJhRsDTeuAVgG55ia936uFSFVKR0N5Pn4GCF1UA@mail.gmail.com>
 <E1hv5vZ-0000jN-M8@stardust.g4.wien.funkfeuer.at>
 <CA+E=qVdHOtebR6xjpwTY_Whp0cHLtv82YULmxLPSEzdLN9TnVg@mail.gmail.com>
 <36e60078-7dd5-9c07-ffa1-6092d8c70fa8@arm.com>
 <CA+E=qVeAR4AFN99ZVy8EZLW6p_8ucTewOdMis37wnpV3DObaGg@mail.gmail.com>
 <20190807115614.phm7sbyae6yajkug@flea>
 <CA+E=qVdh3MHMsEC9XKe5-7O8fGTHFh76WLOgVf+PZPv7c4JE9w@mail.gmail.com>
 <20190808162628.pthvy3tgf3naj76s@flea>
 <CA+E=qVeiWoRGn05HpMzx_5yidit4GM18tBrziW5MBo00f_-PKQ@mail.gmail.com>
 <20190812080420.saelmqb36vkelxn4@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812080420.saelmqb36vkelxn4@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, "Jared D . McNeill" <jmcneill@netbsd.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Harald Geyer <harald@ccbib.org>, Robin Murphy <robin.murphy@arm.com>, arm-linux <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 1:04 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Aug 08, 2019 at 12:59:07PM -0700, Vasily Khoruzhick wrote:
> > On Thu, Aug 8, 2019 at 9:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Wed, Aug 07, 2019 at 10:36:08AM -0700, Vasily Khoruzhick wrote:
> > > > On Wed, Aug 7, 2019 at 4:56 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > >
> > > > > On Tue, Aug 06, 2019 at 07:39:26PM -0700, Vasily Khoruzhick wrote:
> > > > > > On Tue, Aug 6, 2019 at 2:14 PM Robin Murphy <robin.murphy@arm.com> wrote:
> > > > > > >
> > > > > > > On 2019-08-06 9:52 pm, Vasily Khoruzhick wrote:
> > > > > > > > On Tue, Aug 6, 2019 at 1:19 PM Harald Geyer <harald@ccbib.org> wrote:
> > > > > > > >>
> > > > > > > >> Vasily Khoruzhick writes:
> > > > > > > >>> On Tue, Aug 6, 2019 at 7:35 AM Robin Murphy <robin.murphy@arm.com> wrote:
> > > > > > > >>>>
> > > > > > > >>>> On 06/08/2019 15:01, Vasily Khoruzhick wrote:
> > > > > > > >>>>> Looks like PMU in A64 is broken, it generates no interrupts at all and
> > > > > > > >>>>> as result 'perf top' shows no events.
> > > > > > > >>>>
> > > > > > > >>>> Does something like 'perf stat sleep 1' at least count cycles correctly?
> > > > > > > >>>> It could well just be that the interrupt numbers are wrong...
> > > > > > > >>>
> > > > > > > >>> Looks like it does, at least result looks plausible:
> > > > > > > >>
> > > > > > > >> I'm using perf stat regularly (cache benchmarks) and it works fine.
> > > > > > > >>
> > > > > > > >> Unfortunately I wasn't aware that perf stat is a poor test for
> > > > > > > >> the interrupts part of the node, when I added it. So I'm not too
> > > > > > > >> surprised I got it wrong.
> > > > > > > >>
> > > > > > > >> However, it would be unfortunate if the node got removed completely,
> > > > > > > >> because perf stat would not work anymore. Maybe we can only remove
> > > > > > > >> the interrupts or just fix them even if the HW doesn't work?
> > > > > > > >
> > > > > > > > I'm not familiar with PMU driver. Is it possible to get it working
> > > > > > > > without interrupts?
> > > > > > >
> > > > > > > Yup - you get a grumpy message from the driver, it will refuse sampling
> > > > > > > events (the ones which weren't working anyway), and if you measure
> > > > > > > anything for long enough that a counter overflows you'll get wonky
> > > > > > > results. But for counting hardware events over relatively short periods
> > > > > > > it'll still do the job.
> > > > > >
> > > > > > I tried to drop interrupts completely from the node but 'perf top' is
> > > > > > still broken. Though now in different way: it complains "cycles: PMU
> > > > > > Hardware doesn't support sampling/overflow-interrupts. Try 'perf
> > > > > > stat'"
> > > > >
> > > > > I have no idea if that's the culprit, but what is the state of the
> > > > > 0x09010000 register?
> > > >
> > > > What register is that and how do I check it?
> > >
> > > It's in the CPUX Configuration block, and the bits are labelled as CPU
> > > Debug Reset.
> > >
> > > And if you have busybox, you can use devmem.
> >
> > CPUX configuration block is at 0x01700000 according to A64 user
> > manual, and particular register you're interested in is at 0x01700080,
> > its value is 0x1110110F.
> >
> > Bits 16-19 are not defined in user manual and are not set.
>
> Sorry, I somehow thought this was for the H6...
>
> I don't have any idea then :/

OK, so what should we do? 'perf top'/'perf record' work fine if PMU
node is dropped, but they don't work if PMU node is present (even with
interrupts dropped). I'd prefer to have 'perf top' and 'perf record'
working instead of 'perf stat'

> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
