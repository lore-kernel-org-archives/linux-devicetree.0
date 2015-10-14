From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] arm: dts: lpc32xx: fix improper usage of ranges
 property
Date: Wed, 14 Oct 2015 22:07:06 +0200
Message-ID: <19392174.3eZzHlAnnT@wuerfel>
References: <1444694045-22000-1-git-send-email-vz@mleia.com>
 <7163229.YtgKU9kxxJ@wuerfel>
 <CAGhQ9VzKrsAYy=xwEZPD80jaTxmqR5MJj7fXeFTK-A2JnJXPqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAGhQ9VzKrsAYy=xwEZPD80jaTxmqR5MJj7fXeFTK-A2JnJXPqA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 14 October 2015 19:23:09 Joachim Eastwood wrote:
> >
> > /ahb5 {
> >         ranges = <0 0x20000000 0x10000000>;
> >
> >         apb {
> >                 ranges = <0 0x80000 0x20000>;
> >         };
> > };
> > /ahb6 {
> >         ranges = <0 0x30000000 0x10000000>,           /* AHB registers */
> >                  <0x80000000 0x80000000 0x40000000>, /* EMC DYCS0/1 */
> >                  <0xE0000000 0xE0000000 0x04000000>; /* EMC CS0-3 */
> >
> >         memory-controller@1080000 {
> >                 reg = <0x1080000 0x10000>;
> >         };
> > };
> 
> Sorry for hijacking the thread, but I have related question to this.
> 
> What is the advantage of using a hierarchical bus structure in dt?
> I thought the recommendation, at least for new device trees, was to
> keep it flat under a "soc"-node.
> 
> If doesn't offer any advantages why not remove instead of adding the
> ranges property which seems to grow a bit complex now?
> Of course removing it would create a lot of churn because of the
> re-indentation but at least the end result would be simpler.

The general recommendation is to have the DT structure resemble
the hardware as closely as possible. If the chip has a clear
hierarchy and you know it, then it's best to describe it that way.

The reason for having a single 'soc' node in a lot of the modern
dtsi files is that either it's not documented, or they use AXI
'buses' that are not really hierarchical but are point-to-point
connections.

	Arnd
