From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v12 3/6] fpga: add simple-fpga-bus
Date: Wed, 28 Oct 2015 23:04:32 -0500
Message-ID: <CAL_JsqJY=yHij0eEHErADY8N0p6t9q-O3vBbiepPUFmVTzBdcA@mail.gmail.com>
References: <1445983755-24007-1-git-send-email-atull@opensource.altera.com>
 <1445983755-24007-4-git-send-email-atull@opensource.altera.com>
 <20151028100714.GB7779@jcartwri.amer.corp.natinst.com> <CAAtXAHcaSZaKhYtVFbUEuO+boMh_PgUaOGVtjO_5MDkpcLcmWA@mail.gmail.com>
 <20151028161859.GJ8245@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20151028161859.GJ8245@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: Moritz Fischer <moritz.fischer@ettus.com>, Alan Tull <atull@opensource.altera.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 28, 2015 at 11:18 AM, Josh Cartwright <joshc@ni.com> wrote:
> On Wed, Oct 28, 2015 at 08:37:51AM -0700, Moritz Fischer wrote:
>> On Wed, Oct 28, 2015 at 3:07 AM, Josh Cartwright <joshc@ni.com> wrote:
>> > On Tue, Oct 27, 2015 at 05:09:12PM -0500, atull@opensource.altera.com wrote:
>> >> From: Alan Tull <atull@opensource.altera.com>
>> >>
>> >> The Simple FPGA bus uses the FPGA Manager Framework and the
>> >> FPGA Bridge Framework to provide a manufactorer-agnostic
>> >> interface for reprogramming FPGAs that is Device Tree
>> >> Overlays-based.
>> >
>> > Do you intend the "simple-fpga-bus" to be used on Zynq as well?  The
>> > whole concept of the socfpga's "FPGA Bridge" doesn't map to the Zynq at
>> > all, from what I can tell.
>>
>> For Zynq the zynq-fpga driver takes care of the level shifters on full
>> reconfiguration,
>> and doesn't for partial reconfiguration. Now depending on which parts
>> of the fabric
>> are partial reconfigured (say AXI masters), one might run into issues
>> with a setup like that.
>>
>> My first plan was to counter that by using zynq-reset to hold the
>> reset high during
>> reconfiguration of that part of the FPGA.
>>
>> I'm happy to rethink that part and maybe redo the level shifters and
>> resets together in a bridge
>> driver under devicetree control gives finer grained control.
>
> There is already a framework which is used to describe and manipulate
> level shifting/other IO properties, and that is pinctrl, and if we
> wanted to use an appropriate abstraction, I think pinctrl would be the
> best bet.

I'm not all that familiar with FPGAs, but using pinctrl seems like
overkill to me. We're talking about isolating things while doing
reconfiguration, right? That seems more similar to power domain
controls than I/O pin control to me.

> Implementing the FPGA Bridge interface in the Zynq driver because it's
> what the core expects is just backwards.  It's an abstraction inversion.

+1

Rob
