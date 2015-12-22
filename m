From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] rtc: support DS1302 RTC on ICP DAS LP-8x4x
Date: Tue, 22 Dec 2015 12:16:41 -0600
Message-ID: <CAL_JsqKxEkuvQ=7=zmb0pkNNyUe9aKzKics43QasUBDM2rmrwA@mail.gmail.com>
References: <397668667-27328-3-git-send-email-ynvich@gmail.com>
 <1450201525-9137-1-git-send-email-ynvich@gmail.com> <20151220033815.GD9883@rob-hp-laptop>
 <1450613656.15911.62.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450613656.15911.62.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alessandro Zummo <a.zummo@towertech.it>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <rtc-linux@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 20, 2015 at 6:14 AM, Sergei Ianovich <ynvich@gmail.com> wrote:
> On Sat, 2015-12-19 at 21:38 -0600, Rob Herring wrote:
>> On Tue, Dec 15, 2015 at 08:45:23PM +0300, Sergei Ianovich wrote:

[...]

>> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
>> > b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
>> > new file mode 100644
>> > index 0000000..810613b
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1302.txt
>> > @@ -0,0 +1,14 @@
>> > +* Dallas Semiconductor DS-1302 RTC
>> > +
>> > +Simple device which could be used to store date/time between
>> > reboots.
>> > +
>> > +Required properties:
>> > +- compatible : Should be "dallas,rtc-ds1302"
>> > +- reg : Should be address and size of IO memory region
>>
>> This device is a SPI (or SPI like?) interface. So you have some sort
>> of
>> of FPGA logic in between the cpu and ds1302. The DT should have a node
>> for the controller and then the ds1302 as a child of it. A full blown
>> SPI driver may be overkill here, but that's a separate discussion from
>> the DT binding.
>
> Below is the quote from the actual DT of LP-8x4x:
>>                 fpga@5 {
>>                         compatible = "simple-bus";
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>>                         ranges = <0 5 0x3000000 0x10000>;
>>                         interrupt-parent = <&fpgairq>;
>>
>>                         rtc@901c {
>>                                 compatible = "dallas,rtc-ds1302";

This node should have a LP-8x4x specific compatible and then have a
child node for ds1302 that follows the SPI binding.

>>                                 reg = <0x901c 0x1>;
>>                                 status = "okay";
>>                         };
>
> You are right about the topology. ds1302 is a half-duplex SPI device.
> Does this mean I should rewrite the driver to handle the chip as a slave
> SPI device, and then provide a master SPI functionality at the FPGA?

Well, the binding should reflect that, whether the driver needs to be
re-written is somewhat a separate question. That should probably have
been done for the DS1302 driver originally and it is not too fair for
the 2nd person to fix it. You could just have a single driver bound to
the controller node which is aware of the DS1302 being the slave
device (ignoring that part of the DT for now).

Rob
