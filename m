From: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Thu, 06 Dec 2018 13:17:58 +0000
Message-ID: <85973a9cd43c677ffa5c80853e86d79f36a9eb3a.camel@baylibre.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206124347.GA10676@ingrassia.epigenesys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Emiliano Ingrassia <ingrassia@epigenesys.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-12-06 at 13:43 +0100, Emiliano Ingrassia wrote:
> Hi all,

Hi Emiliano,

> thank you for involving me.
> 
> I applied Carlo's patches[0] on a kernel vanilla 4.19.6
> and tested it with kernel packet generator, monitoring
> bandwidth usage with "nload".
> 
> All tests were conducted on an Odroid-C1+ Rev. 0.4-20150930 board
> with a short ethernet cable directly attached to a laptop with
> 1G ethernet interface, with "nload" running on the board.
> 
> The tests I performed are composed by the following steps:
> 
> 1) Start packet generator with "rate 1000M" on laptop;
> 
> 2) Keep packet generator active on the laptop and
>    start the packet generator on the board with "rate 1000M";
> 
> 3) Stop both packet generators;
> 
> 4) Start packet generator on the board;
> 
> 5) Keep packet generator active on the board and
>    start the packet generator on the laptop.

out of curiosity: why do you expect to see something different from
point (2)?

> Test results without Carlo's patches applied:
> 
> 1) "nload" shows an incoming traffic of ~950Mbps;
> 
> 2) "nload" shows an incoming traffic of ~400Mbps
>    and an outgoing traffic of ~250Mbps;
> 
> 3) "nload" shows 0Mbps both for incoming and outgoing traffic;
> 
> 4) "nload" shows an outgoing traffic of ~950Mbps from the board;
> 
> 5) "nload" shows incoming traffic of 0Mbps
>    and an outgoing traffic of ~950Mbps.
> 
> Applying only the first patch (change mac IRQ type) I got the same
> results.

This is expected. The change in the IRQ type is solving an issue that
you can see if the run a stress test involving multiple components for
several hours.

> Applying only the second patch (drop eee-broken-1000t) I got the same
> results!

I am a bit confused here. Wasn't the eee-broken-1000t added to fix a
problem with the ethernet? Are you suggesting that for some reason you
cannot reproduce anymore the problem for which the quirk was
introduced?

> With both patches applied I got the same results but with an incoming
> traffic
> of ~3Mbps on the board.

On all the tests and immediately from the start of the tests?

When you hit the problem con you check in /proc/interrupts if you see
the IRQ counter for the eth0 incrementing or not?

Cheers,

--
Carlo Caione
