From: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Fri, 07 Dec 2018 11:49:15 +0100
Message-ID: <44c9eedf4dc2616645c2a49b080f42a493fe03fd.camel@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
 <85973a9cd43c677ffa5c80853e86d79f36a9eb3a.camel@baylibre.com>
 <20181206155228.GA15225@ingrassia.epigenesys.com>
 <20181206185158.GA19901@ingrassia.epigenesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206185158.GA19901@ingrassia.epigenesys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emiliano Ingrassia <ingrassia@epigenesys.com>, Carlo Caione <ccaione@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 19:51 +0100, Emiliano Ingrassia wrote:
> Hi Carlo,
> 
> I keep running tests with packet generator,
> using nload to show bandwidth usage.
> 
> Here is my test results with packet generators
> both running on laptop and board with rate 1 Gbps.

Testing in UDP is unlikely to give us clear picture of anything for this sort
of fixes.

All your test seems in show it the fact the Amlogic SoC usually prioritize the
TX traffic over RX, which is something we've known about for a while.

It would be helpful if you could provide TCP figures with a traffic generator
we can all share an inspect, such as iperf3

Finally, Your test do not show the original issue regarding EEE. So the work
around we put (yes, it was never considered a solution) for it should not be
kept IHMO. Your numbers for EEE may be due to the way the traffic is generated
and the PHY entering LPI and taking a bit of time to exit it. Again UDP is not
very helpful to characterize this.

> 
> TEST 0: no patch applied.
> 
> 1) Start packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |     ~940 Mbps    |       0 Mbps
> -----------------------------------------------------
> nload (laptop)|       0 Mbps     |     ~940 Mbps
> =====================================================
> 
> 2) Start packet generator on board:
> 
>               | incoming traffic  | outgoing traffic
> ==============+===================+==================
> nload (board) |     ~460 Mbps     |     ~256 Mbps
> --------------+-------------------+------------------
> nload (laptop)|     ~256 Mbps     |     ~940 Mbps
> =====================================================
> 
> 3) Stop packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |       0 Mbps     |    ~940 Mbps
> -----------------------------------------------------
> nload (laptop)|       ~940 Mbps  |      0 Mbps
> =====================================================
> 
> 4) Restart packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |     ~0 Mbps      |     ~940 Mbps
> -----------------------------------------------------
> nload (laptop)|     ~940 Mbps    |     ~940 Mbps
> =====================================================
> 
> In the last case the "ifconfig" statistics about RX packets
> remain fixed which probably indicates that the incoming traffic
> to the board is effectively being dropped.
> 
> The eth0 interrupt counter keeps incrementing.
> Simple ping test works correctly.
> 
> 
> TEST 1: IRQ type patch applied
> 
> Same results as TEST 0.
> 
> 
> TEST 2: eee-broken-1000t flag removed
> 
> 1) Start packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |      ~3Mbps      |       0 Mbps
> -----------------------------------------------------
> nload (laptop)|       0 Mbps     |     ~940 Mbps
> =====================================================
> 
> 2) Start packet generator on board:
> 
>               | incoming traffic  | outgoing traffic
> ==============+===================+==================
> nload (board) |     ~0 Mbps       |     ~940 Mbps
> --------------+-------------------+------------------
> nload (laptop)|     ~940 Mbps     |     ~940 Mbps
> =====================================================
> 
> 3) Stop packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |       0 Mbps     |    ~940 Mbps
> -----------------------------------------------------
> nload (laptop)|       ~940 Mbps  |      0 Mbps
> =====================================================
> 
> 4) Restart packet generator on laptop:
> 
>               | incoming traffic | outgoing traffic
> =====================================================
> nload (board) |     ~0 Mbps      |     ~940 Mbps
> -----------------------------------------------------
> nload (laptop)|     ~940 Mbps    |     ~940 Mbps
> =====================================================
> 
> In the first case the "ifconfig" statistics about RX packets
> are incremented consistently with the incoming traffic value
> showed by the nload (board side).
> 
> In the last case the "ifconfig" statistics about RX packets
> remain fixed which probably indicates that the incoming traffic
> to the board is effectively being dropped.
> 
> The eth0 interrupt counter keeps incrementing.
> Simple ping test from laptop to board shows a packet loss
> of 90% and more while no packet loss achieved pinging
> the laptop from the board.
> 
> 
> TEST 3: both patches applied.
> 
> Same results as TEST 2.
> 
> 
> From the results obtained from these tests,
> which are more accurate than the previous one,
> I can say that the second patch (remove eee-broken-1000t flag)
> should NOT be applied.
> 
> About the first one (change MAC IRQ type), I would like
> to do other tests with other tools like iperf3.
> With these results only, I would say to not apply it
> because nothing changed but if your stress test failed on
> long running and this patch fix it I would like to test it more deeply.
> 
> As final thought, the conducted tests clearly show that if the board
> transmits at full rate, all the incoming traffic is dropped.
> I think that this behaviour should be fixed but don't know if
> it depends on the driver or device tree description.
> I'll keep investigating.
> 
> Regards,
> 
> Emiliano
> 
> On Thu, Dec 06, 2018 at 04:52:28PM +0100, Emiliano Ingrassia wrote:
> > Hi Carlo,
> > 
> > thanks for the answer.
> > 
> > On Thu, Dec 06, 2018 at 01:17:58PM +0000, Carlo Caione wrote:
> > > On Thu, 2018-12-06 at 13:43 +0100, Emiliano Ingrassia wrote:
> > > > Hi all,
> > > 
> > > Hi Emiliano,
> > > 
> > > > thank you for involving me.
> > > > 
> > > > I applied Carlo's patches[0] on a kernel vanilla 4.19.6
> > > > and tested it with kernel packet generator, monitoring
> > > > bandwidth usage with "nload".
> > > > 
> > > > All tests were conducted on an Odroid-C1+ Rev. 0.4-20150930 board
> > > > with a short ethernet cable directly attached to a laptop with
> > > > 1G ethernet interface, with "nload" running on the board.
> > > > 
> > > > The tests I performed are composed by the following steps:
> > > > 
> > > > 1) Start packet generator with "rate 1000M" on laptop;
> > > > 
> > > > 2) Keep packet generator active on the laptop and
> > > >    start the packet generator on the board with "rate 1000M";
> > > > 
> > > > 3) Stop both packet generators;
> > > > 
> > > > 4) Start packet generator on the board;
> > > > 
> > > > 5) Keep packet generator active on the board and
> > > >    start the packet generator on the laptop.
> > > 
> > > out of curiosity: why do you expect to see something different from
> > > point (2)?
> > > 
> > 
> > I did not expect it indeed, I tried and got different results.
> > 
> > > > Test results without Carlo's patches applied:
> > > > 
> > > > 1) "nload" shows an incoming traffic of ~950Mbps;
> > > > 
> > > > 2) "nload" shows an incoming traffic of ~400Mbps
> > > >    and an outgoing traffic of ~250Mbps;
> > > > 
> > > > 3) "nload" shows 0Mbps both for incoming and outgoing traffic;
> > > > 
> > > > 4) "nload" shows an outgoing traffic of ~950Mbps from the board;
> > > > 
> > > > 5) "nload" shows incoming traffic of 0Mbps
> > > >    and an outgoing traffic of ~950Mbps.
> > > > 
> > > > Applying only the first patch (change mac IRQ type) I got the same
> > > > results.
> > > 
> > > This is expected. The change in the IRQ type is solving an issue that
> > > you can see if the run a stress test involving multiple components for
> > > several hours.
> > > 
> > 
> > OK, did you use "stress-ng" tool for tests?
> > 
> > > > Applying only the second patch (drop eee-broken-1000t) I got the same
> > > > results!
> > > 
> > > I am a bit confused here. Wasn't the eee-broken-1000t added to fix a
> > > problem with the ethernet? Are you suggesting that for some reason you
> > > cannot reproduce anymore the problem for which the quirk was
> > > introduced?
> > > 
> > 
> > Problems without the "eee-broken-1000t" flags were experimented
> > one and a half years ago on a Amlogic development kernel from [0],
> > probably a 4.14 version.
> > Many patches about Meson8b SoC, dwmac-meson8b and dwmac driver
> > were introduced so yes, the "eee-broken-1000t" was added
> > to fix a problem with the ethernet (one and a half years ago),
> > but new tests are needed to say if it still necessary.
> > 
> > > > With both patches applied I got the same results but with an incoming
> > > > traffic
> > > > of ~3Mbps on the board.
> > > 
> > > On all the tests and immediately from the start of the tests?
> > > 
> > 
> > Yes, in all the 5 steps immediately from the start.
> > 
> > I also tried to execute "nload" on both sides to see the bandwidth
> > usage.
> > 
> > With bot patches applied, after starting kernel packet generator
> > on my laptop with 1Gbps rate, "nload" on the laptop side shows me
> > an outgoing traffic of ~940Mbps while "nload" on the board side shows
> > me an incoming traffic of ~3Mbps.
> > 
> > Also consider that a pinging test from my laptop to the board shows
> > a packet loss of about 90%.
> > 
> > > When you hit the problem con you check in /proc/interrupts if you see
> > > the IRQ counter for the eth0 incrementing or not?
> > > 
> > 
> > The eth0 IRQ counter is incremented during the test.
> > 
> > > Cheers,
> > > 
> > > --
> > > Carlo Caione
> > > 
> > > 
> > 
> > I would like to conduct other tests with iperf3 to be sure about
> > the obtained results. What do you think?
> > Should I apply your patches on the latest Amlogic development kernel?
> > 
> > Regards,
> > 
> > Emiliano
> > 
> > [0] 
> > https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git/
> 
> Cheers,
> 
> Emiliano
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
