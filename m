From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] MIPS: NI 169445 board support
Date: Wed, 14 Dec 2016 10:48:58 -0600
Message-ID: <CAL_JsqJPkVBbvTonOADsu-uaH0bxtNDBJ3OrzE=7vP5pc92H=Q@mail.gmail.com>
References: <1480693329-22265-1-git-send-email-nathan.sullivan@ni.com>
 <20161209211828.dykl2l4kmthqgq6e@rob-hp-laptop> <20161214163253.GA25341@nathan3500-linux-VM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161214163253.GA25341@nathan3500-linux-VM>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Sullivan <nathan.sullivan@ni.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Mark Rutland <mark.rutland@arm.com>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 14, 2016 at 10:32 AM, Nathan Sullivan
<nathan.sullivan@ni.com> wrote:
> On Fri, Dec 09, 2016 at 03:18:28PM -0600, Rob Herring wrote:
>> On Fri, Dec 02, 2016 at 09:42:09AM -0600, Nathan Sullivan wrote:
>> > Support the National Instruments 169445 board.
>> >
>> > Signed-off-by: Nathan Sullivan <nathan.sullivan@ni.com>
>> > ---
>> > "gpio: mmio: add support for NI 169445 NAND GPIO" and
>> > "devicetree: add vendor prefix for National Instruments" are required for the
>> > NAND on this board to work.

>> > +   ahb@0 {
>> > +           compatible = "simple-bus";
>> > +           #address-cells = <1>;
>> > +           #size-cells = <1>;
>> > +           ranges;
>>
>> If everything is under 0x1f3xxxxx, then add in the ranges here (and the
>> unit address).
>>
>
> I noticed that some systems call out their axi/ahb busses, some do not.  Would
> you prefer that I remove the bus entirely?

Definitely not. IMO, not having a bus node is an error.

Rob
