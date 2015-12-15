From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v14 0/7] fpga area and fpga bridge framework
Date: Tue, 15 Dec 2015 10:15:54 -0800
Message-ID: <CAAtXAHcLDjrnx=Ger0i24YesZA_RB16Y1ZXRd9dsLPWSVVTwGQ@mail.gmail.com>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
	<CAAtXAHcNqP4ftOUbFYK=0kmpY9XmPgQ1=xAejQUj90N4x4pFng@mail.gmail.com>
	<CANk1AXTqN6ExtXXgMXaTAM=aH+0J4D5b2_JSQ_9AuJCj79PR5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CANk1AXTqN6ExtXXgMXaTAM=aH+0J4D5b2_JSQ_9AuJCj79PR5Q@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <delicious.quinoa@gmail.com>
Cc: Alan Tull <atull@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Mon, Dec 14, 2015 at 5:56 PM, Alan Tull <delicious.quinoa@gmail.com> wrote:

>> I had an offline discussion with Josh Cartwright about his concerns.
>> He brought up a good
>> point on w.r.t to the way FPGA Area (Bus) deals with things.
>>
>> Currently we only support complete status = "okay" vs "disabled" kind
>> of overlays.

> Maybe i don't understand what you are saying; could you write out a
> sequence you want to be able to do?

Let's say you have a UART in the FPGA. You want to reprogram the FPGA
fabric that includes the UART (assuming proper resets etc happen)

1) Driver gets notified of impending doom, keeps hands off of FPGA
2) FPGA Manager reloads FPGA
3) FPGA Manager lets driver know FPGA is back
4) Driver can continue to function as always

It wouldn't even have to be a UART, on some boards simple SPI lines or UART
lines  go from the processor through the FPGA logic out to a pin.
When you reload the FPGA for a short moment of time that doesn't work,
while after the reload it works just fine. Maybe something like extcon could
be used for that?

> Is this a separate question/issue from the above?  Are you talking
> about acceleration?

I meant stuff like SPI that gets routed through the FPGA, sorry for
being unclear ;-)

>>
>> I've been toying around with hacking up struct device to include a
>> FPGA 'domain', and then, similar
>> to power domains allow devices to register suspend() / resume() style
>> callbacks (could call them pre_reload() or something like that ...)
>>
>> I haven't gotten around to think it through. At this point it's just
>> an idea and I don't have real code to show.
>>
>> I realize the issue with that is we'd have to make changes to struct device.
>
> That's interesting.  Usually a FPGA image has many devices in it, so
> so way of making that dependency clear would be needed.  If any of the
> devices involved are powered up, that FPGA image would need to be
> loaded.

Yeah. That's why I think the power domain model we have has a bunch of
similarities.

> Currently I'm trying to get some bindings approved for doing device
> tree control of loading the FPGA and probing the devices.  My idea is
> that these bindings could be useful for some use cases where we are
> loading hardware onto the FPGA that needs to show up in the device
> tree. Some of Rob's feedback is that my proposal may be
> Altera-specific. If the bindings that I am proposing are useful for at
> least some uses with Xilinx parts, that would be valuable feedback at
> this point.  If they are Altera-specific, then I may need to add
> "altr," to some of the compatible strings like "altr,fpga-bus" and
> "altr,fpga-area".  My original intent was to implement something that
> you could use also, so I hope that's not the future here.
>
> So my question for you is: is this stuff useful for you?

Definitely, I'm pretty happy with what you have so far!
I think the points I mentioned above apply to Altera devices, too.
Maybe we can solve this in two parts, and the first step is getting the
loading bindings accepted ;-)

Cheers,

Moritz
