From: Alan Tull <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v14 0/7] fpga area and fpga bridge framework
Date: Mon, 14 Dec 2015 19:56:59 -0600
Message-ID: <CANk1AXTqN6ExtXXgMXaTAM=aH+0J4D5b2_JSQ_9AuJCj79PR5Q@mail.gmail.com>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
	<CAAtXAHcNqP4ftOUbFYK=0kmpY9XmPgQ1=xAejQUj90N4x4pFng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHcNqP4ftOUbFYK=0kmpY9XmPgQ1=xAejQUj90N4x4pFng@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 11:16 AM, Moritz Fischer
<moritz.fischer@ettus.com> wrote:
> Hi Alan,
>
> On Thu, Dec 10, 2015 at 3:37 PM,  <atull@opensource.altera.com> wrote:
>> From: Alan Tull <atull@opensource.altera.com>
>>
>> For v14 I'm dropping the concept of "simple-fpga-bus" for "fpga-area"
>> with reworked bindings.
>
> I had an offline discussion with Josh Cartwright about his concerns.
> He brought up a good
> point on w.r.t to the way FPGA Area (Bus) deals with things.
>
> Currently we only support complete status = "okay" vs "disabled" kind
> of overlays.
>
> If now you have say a UART in the FPGA that you don't want to go away
> and come back on reload,
> we don't have a good way of expressing this.

Maybe i don't understand what you are saying; could you write out a
sequence you want to be able to do?

If you want suspend/resume functionality that would reload the FPGA
after a suspend powers off the FPGA, that would be simple to add to
the FPGA area code and it wasn't a hack at all.

> Is there a good way to
> express non-mmio FPGA devices?

Is this a separate question/issue from the above?  Are you talking
about acceleration?

>
> I've been toying around with hacking up struct device to include a
> FPGA 'domain', and then, similar
> to power domains allow devices to register suspend() / resume() style
> callbacks (could call them pre_reload() or something like that ...)
>
> I haven't gotten around to think it through. At this point it's just
> an idea and I don't have real code to show.
>
> I realize the issue with that is we'd have to make changes to struct device.

That's interesting.  Usually a FPGA image has many devices in it, so
so way of making that dependency clear would be needed.  If any of the
devices involved are powered up, that FPGA image would need to be
loaded.

Currently I'm trying to get some bindings approved for doing device
tree control of loading the FPGA and probing the devices.  My idea is
that these bindings could be useful for some use cases where we are
loading hardware onto the FPGA that needs to show up in the device
tree. Some of Rob's feedback is that my proposal may be
Altera-specific. If the bindings that I am proposing are useful for at
least some uses with Xilinx parts, that would be valuable feedback at
this point.  If they are Altera-specific, then I may need to add
"altr," to some of the compatible strings like "altr,fpga-bus" and
"altr,fpga-area".  My original intent was to implement something that
you could use also, so I hope that's not the future here.

So my question for you is: is this stuff useful for you?

Alan Tull

>
> Cheers,
>
> Moritz
