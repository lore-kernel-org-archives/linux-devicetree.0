From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH v14 0/7] fpga area and fpga bridge framework
Date: Mon, 14 Dec 2015 09:16:33 -0800
Message-ID: <CAAtXAHcNqP4ftOUbFYK=0kmpY9XmPgQ1=xAejQUj90N4x4pFng@mail.gmail.com>
References: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1449790629-5517-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alan Tull <atull@opensource.altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Josh Cartwright <joshc@ni.com>, Greg KH <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Alan Tull <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

Hi Alan,

On Thu, Dec 10, 2015 at 3:37 PM,  <atull@opensource.altera.com> wrote:
> From: Alan Tull <atull@opensource.altera.com>
>
> For v14 I'm dropping the concept of "simple-fpga-bus" for "fpga-area"
> with reworked bindings.

I had an offline discussion with Josh Cartwright about his concerns.
He brought up a good
point on w.r.t to the way FPGA Area (Bus) deals with things.

Currently we only support complete status = "okay" vs "disabled" kind
of overlays.

If now you have say a UART in the FPGA that you don't want to go away
and come back on reload,
we don't have a good way of expressing this. Is there a good way to
express non-mmio FPGA devices?

I've been toying around with hacking up struct device to include a
FPGA 'domain', and then, similar
to power domains allow devices to register suspend() / resume() style
callbacks (could call them pre_reload() or something like that ...)

I haven't gotten around to think it through. At this point it's just
an idea and I don't have real code to show.

I realize the issue with that is we'd have to make changes to struct device.

Cheers,

Moritz
