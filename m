From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 00/15] ARM: sunxi: Enable Broadcom-based Bluetooth controllers
Date: Mon, 3 Dec 2018 23:51:38 +0800
Message-ID: <CAGb2v64CdrT44H0pf4RYXON4d145kMz0DnWQL-+4hT-MOx935Q@mail.gmail.com>
References: <20181115093603.26729-1-wens@csie.org> <CAGb2v66YJ8tkd8wMsBBHETO3UfQDNdmDtgy6SrUXSYergsSUTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v66YJ8tkd8wMsBBHETO3UfQDNdmDtgy6SrUXSYergsSUTA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Loic Poulain <loic.poulain@gmail.com>, linux-bluetooth@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 12:25 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> On Thu, Nov 15, 2018 at 5:36 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > Hi everyone,
> >
> > This is v2 of my Broadcom-based Bluetooth controllers on Allwinner SoC-
> > based SBCs series.
> >
> > Changes since v1:
> >
> >   - Collected tags
> >   - Re-organize dt binding clocks and clock-names properties
> >   - Simplify check for deferred probe when getting clocks
> >   - Add explanation of Cubietruck's clk_out_a pinmux setting placement
> >     to commit message.
> >   - Add missing "uart-has-rtscts" property to Cubietruck device tree
> >
> > Original cover letter follows.
> >
> >
> > On many Allwinner SBCs / developer boards, there is a WiFi+BT combo
> > module from AMPAK. Inside is either one or two Broadcom chips, depending
> > on the model. This series enables the Bluetooth controllers for AMPAK
> > AP6210, AP6212, and AP6330 found on several boards. More will come later
> > as other SoCs require changes to some other parts. I did not cover the
> > SCO PCM connections from the controller to the SoC's I2S interface. It
> > seems no one is actually doing this, so I was not sure how to proceed.
> > Any suggestions?
> >
> > I deliberately left out the netdev mailing list and Dave Miller, as the
> > only thing that is under net is the binding document. Maybe we should
> > move that out of Documentation/devicetree/bindings/net/ ?
> >
> > Also, I'm not subscribed to the linux-bluetooth ML, so please CC me for
> > any discussions.
> >
> > Patches 1 through 4 are device tree binding changes:
> >
> > 1 - Make the external clock name unambiguous, and add a second entry for
> >     the LPO clock.
> >
> > 2 - Add regulator supply properties for the VBAT and VDDIO power pins.
> >
> > 3 - Add a compatible string for BCM20702A1.
> >
> > 4 - Add a compatible string for BCM4330.
> >
> > Patches 5 through 13 are changes to the driver, either improvements,
> > or updates to handle the updated device tree binding.
> >
> > 5 - Make the driver handle deferred probing for the external clock.
> >
> > 6 - Simplify clock error checking for subsequent clk API calls.
> >
> > 7 - Handle clock-names for the main external clock.
> >
> > 8 - Support a new external clock, the LPO.
> >
> > 9 - Support regulator supplies.
> >
> > 10 - Wait a small amount of time after toggling the GPIO for the device
> >      to settle.
> >
> > 11 - Add support for BCM20702A1, including its default address.
> >
> > 12 - Add BCM4330 compatible string to the driver.
> >
> > 13 - Handle default address for BCM43430A0.
> >
> > 14 - Enable Broadcom-based serdev Bluetooth for multiple Allwinner ARMv7
> >      boards.
> >
> > 15 - Enable Broadcom-based serdev Bluetooth for the Bananapi M64.
> >
> > checkpatch reports an error for both patch 11 and patch 13:
> >
> >     ERROR: space required after that close brace '}'
> >
> > I followed the existing code's style. If this is undesirable, I can send
> > a follow-up patch fixing the entire code block.
> >
> > The first 13 patches should go through the Bluetooth tree, while we, the
> > sunxi maintainers, will take the last 2.
>
> It's been close to two weeks. Any comments or concerns from the Bluetooth
> maintainers? I'd like to see this in 4.22 if possible.

Ugh, I meant 4.21.

ChenYu
