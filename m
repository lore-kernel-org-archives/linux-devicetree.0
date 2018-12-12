From: Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
Date: Wed, 12 Dec 2018 11:49:24 +0100
Message-ID: <20181212104924.GA2359@ingrassia.epigenesys.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
 <20181207185136.GB17435@ingrassia.epigenesys.com>
 <d318a99306d21023f92a249cb78bec010baf11db.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <d318a99306d21023f92a249cb78bec010baf11db.camel@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Carlo,

On Sat, Dec 08, 2018 at 10:46:17AM +0000, Carlo Caione wrote:
> On Fri, 2018-12-07 at 19:51 +0100, Emiliano Ingrassia wrote:
> > Hi Carlo,
>
> Hi Emiliano,
>
> > tests[0] conducted on an Odroid-C1+ board equipped with a Meson8b SoC
> > have shown an high packet loss (90% and more) during a simple ping
> > test from a laptop to the board.
> > Testing the two patches separately clearly showed that this depends
> > on the
> > removal of the "eee-broken-1000t" flag from the board PHY description
> > in the relative device tree.
> >
> > About the first patch (MAC IRQ type), no tests have shown an evidence
> > that it is needed. I suggest you to conduct some test on real
> > hardware
> > as I do to confirm or disprove my tests.
>
> Let's try to step back a bit and see what we can do to clarify this
> situation.
>

Ok, I'll be glad to help you :)

> First of all for arm64 we are pretty sure that both patches are needed
> because we ran extensive and lengthy tests, especially regarding the
> change in the IRQ trigger type. For arm things are not so clear, so for
> now we decided to merge the arm64 patch and just wait on the arm one.
>
> First of all we can focus on the patch regarding the change in the IRQ
> type.
>
> The problem with the IRQ type is triggered on the arm64 boards we
> tested using the script in [0]. If we run this stress test on the arm64
> boards without the trigger changing patch after a few hours (variable
> from 2h to 6h sometimes more) we can see the connection dropping from
> ~1Gbps to <30Mbps. Jerome gave a nice explanation of the why, but after
> changing the IRQ trigger type we couldn't see the issue anymore. This
> was confirmed not just by BayLibre but also from other different
> sources, so we are pretty confident in this solution.
>
> So my first two points for you to answer are:
>
> 1) Can you reproduce this problem on your board without the patches
> when running this script?
>
> 2) If yes, does only the first patch solve the problem?
>

I ran two tests executing the script you provide on an Odroid-C1+ board
(REV 0.4 20150930) for 6 hours, using my laptop as server.
The kernel I used was compiled from "v4.21/dt64-testing" branch provided by
Kevin Hilman (thank you Kevin!). The results are available in [0].

The first test (no-patch-iperf-20181211000039.log) was run
with none of your patches applied.
The second test (irq-patch-iperf-20181211130953.log) was run
with only the patch about IRQ type applied.

As you can see, I did not experiment exactly the problem you had
but I see a more stable behavior with the IRQ type patch applied.

> This brings us to the second issue, the one regarding the 'eee-broken-
> 1000t' quirk. Since the two issues are strictly related we are
> confident that the change in the IRQ type solves this problem as well
> (and this was confirmed by Jerome as well on the arm64 boards).
>

The problem here is that, without the "eee-broken-1000t" flag, simple ping
tests from an host to the board showed an high packet loss (about ~90%),
even with the IRQ type patch applied.

> For this case I cannot provide a real reproducer so we need only to
> stress test the network with iperf3 trying to reproduce the issue. This
> is also because we think that you approach of using UDP and your packet
> generator probably is not the best way to test the patch given that (1)
> using UDP is not reliable according to our tests, (2) there is an
> asymmetry in TX/RX, (3) the packet loss could be due to the saturation
> on the bandwidth, etc...
>

The tests I ran with the kernel packet generator showed interesting
informations to me. The board dropped all incoming traffic when
transmitting at full rate (~940 Mbps).
Although there is an asymmetry in the transmission FIFOs size
(Rx FIFO is twice as Tx FIFO), I would expect a result more similar
to the one I had in step 2 of TEST 0 [1], after a while.
However, this behavior could be due to the driver and not so
interesting in this discussion ;)

> So AFAIK the best way to test this problem is using iperf3, the same
> way it is done in the script in [0]. I was not involved with this issue
> 1 year and half ago but AFAIK this is the way it was reproduced.
>
> This brings me to more answers for you to answer:
>
> 3) Running iperf3 tests in TX / RX / TX+RX without the 'eee-broken-
> 1000' quirk applied are you able to reproduce the EEE problem?
>
> 4) Any change when the 'eee-broken-1000' quirk is applied?
>
> When testing (3) and (4) also please check the status of the EEE using
> ethtool.
>
> Hopefully this will bring a bit of clarity to the whole situation :)
>
> Cheers,
>
> [0] https://paste.fedoraproject.org/paste/GBFxjAQ0JULsYQlyYO2KOw
>
> --
> Carlo Caione
>

Best reagrds,

Emiliano

[0] https://drive.google.com/drive/folders/1BMe8vkm16KdgijlhFfZH_xph5eDNdkqO?usp=sharing
[1] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009397.html
