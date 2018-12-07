From: Emiliano Ingrassia <ingrassia@epigenesys.com>
Subject: Re: [PATCH 0/2] meson: Fix IRQ trigger type
Date: Fri, 7 Dec 2018 19:33:55 +0100
Message-ID: <20181207183355.GA17435@ingrassia.epigenesys.com>
References: <20181204160447.27869-1-ccaione@baylibre.com>
 <CAFBinCDCE7RP4vgs25bqSZ8vBjrmcuB=qb3U92X6QfpmzeqrBg@mail.gmail.com>
 <20181206124347.GA10676@ingrassia.epigenesys.com>
 <85973a9cd43c677ffa5c80853e86d79f36a9eb3a.camel@baylibre.com>
 <20181206155228.GA15225@ingrassia.epigenesys.com>
 <20181206185158.GA19901@ingrassia.epigenesys.com>
 <44c9eedf4dc2616645c2a49b080f42a493fe03fd.camel@baylibre.com>
 <463139583299c0099c812ad12017fe6d32662db4.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <463139583299c0099c812ad12017fe6d32662db4.camel@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 07, 2018 at 11:03:20AM +0000, Carlo Caione wrote:
> On Fri, 2018-12-07 at 11:49 +0100, Jerome Brunet wrote:
> > On Thu, 2018-12-06 at 19:51 +0100, Emiliano Ingrassia wrote:
> > > Hi Carlo,
> > >
> > > I keep running tests with packet generator,
> > > using nload to show bandwidth usage.
> > >
> > > Here is my test results with packet generators
> > > both running on laptop and board with rate 1 Gbps.
> >
> > Testing in UDP is unlikely to give us clear picture of anything for
> > this sort
> > of fixes.
> >
> > All your test seems in show it the fact the Amlogic SoC usually
> > prioritize the
> > TX traffic over RX, which is something we've known about for a while.
> >
> > It would be helpful if you could provide TCP figures with a traffic
> > generator
> > we can all share an inspect, such as iperf3
>
> For reference you can use something like:
>
> iperf3 -c ${IP} -i ${IPERF_LOGPERIOD} -w 400k -p ${PORT} -t ${DURATION}
>

Thanks Carlo. Just to be consistent, what value did you use for DURATION?

> Cheers,
>
> --
> Carlo Caione
>

Regards,

Emiliano
