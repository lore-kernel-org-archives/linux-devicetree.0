From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Mon, 1 Aug 2016 13:36:29 +0100
Message-ID: <20160801123428.GA13179@leverpostej>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
 <20160729131513.GB13080@leverpostej>
 <CACna6rxiPx_7R1AwwvV40Wi6j+X=gUw1ChJY8R=oiXVNK1cDgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACna6rxiPx_7R1AwwvV40Wi6j+X=gUw1ChJY8R=oiXVNK1cDgw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 29, 2016 at 11:24:50PM +0200, Rafał Miłecki wrote:
> On 29 July 2016 at 15:15, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Fri, Jul 29, 2016 at 02:58:32PM +0200, Rafał Miłecki wrote:
> >> From: Rafał Miłecki <rafal@milecki.pl>
> >>
> >> This clock is present on cheaper Northstar devices like BCM53573 or
> >> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
> >> to calculate clock rate and allows using it in a generic (clk_*) way.
> >>
> >> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> >> ---
> >>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  28 ++++
> >>  drivers/clk/bcm/Makefile                           |   1 +
> >>  drivers/clk/bcm/clk-ns-ilp.c                       | 146 +++++++++++++++++++++
> >>  3 files changed, 175 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> >>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> >> new file mode 100644
> >> index 0000000..c4df38e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> >> @@ -0,0 +1,28 @@
> >> +Broadcom Northstar ILP clock
> >> +============================
> >> +
> >> +This binding uses the common clock binding:
> >> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> +
> >> +This binding is used for ILP clock on Broadcom Northstar devices using
> >> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated on
> >> +runtime.
> >> +
> >> +Required properties:
> >> +- compatible: "brcm,ns-ilp"
> >> +- reg: iomem address range of PMU (Power Management Unit)
> >> +- reg-names: "pmu", the only needed & supported reg right now
> >
> > From the commit message and binding description, it sounds like there
> > should be a binding for the PMU, and that should cover the clocks
> > required/exported by the PMU.
> 
> This is a bit of problem, because PMU handles a lot of different stuff
> and is used by various drivers. Some examples of what you can do
> with/find on a PMU:
> 1) Power management
> 2) Watchdog
> 3) Timer
> 4) XTAL
> 5) PLLs
> 6) Control registers for some ARM debugging (whatever it is), UART, JTAG, more

The organisation of subsystems in Libnux shouldn't affect the binding in
this manner.

There'll likely be shared resources (e.g. register ranges), and you need
knowledge of the entire PMU to operate the sub-resources (and their
potentially shared dependencies) without conflict.

While you might one sub-nodes on a larger PMU node, these should
certainly not be entirely separate nodes and/or bindings.

> >> +- clocks: should reference an ALP clock
> >> +- clock-names: "alp", the only needed & supported clock right now
> >> +- #clock-cells: should be <0>
> >
> > How many clocks does the PMU output, including the ILP clock?
> 
> Well, ALP clock (AKA XTAL clock) is definitely part of PMU. It's a
> fixed rate clock with rate specific to the chip.
> 
> I think ILP is also part of PMU (again: I don't have datasheets) as
> PMU has this ALP_PER_4ILP register.

Ok. Is that output from the PMU, or is it strictly internal?

> From Broadcom's SDK I can say they also have "ARM debug unit" on some
> chipsets. It requires enabling "ARM debug clk" to operate which is
> handled by PMU as well.

Likewise?

Thanks,
Mark.
