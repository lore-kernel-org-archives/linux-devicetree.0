MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1603151657110.24255@linuxheads99>
References: <1456442711-29138-1-git-send-email-atull@opensource.altera.com>
	<1456442711-29138-3-git-send-email-atull@opensource.altera.com>
	<20160305043455.GA19011@rob-hp-laptop>
	<alpine.DEB.2.02.1603151657110.24255@linuxheads99>
Date: Wed, 23 Mar 2016 08:12:34 -0500
Message-ID: <CAL_JsqJ0kMkrHGLDdYzOyMuQ9mSzU9wR+p0daEAegtLhZzY1Ng@mail.gmail.com>
Subject: Re: [PATCH v17 2/6] ARM: socfpga: add bindings document for fpga
 bridge drivers
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: atull <atull@opensource.altera.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alan Tull <delicious.quinoa@gmail.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Matthew Gerlach <mgerlach@altera.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 15, 2016 at 5:04 PM, atull <atull@opensource.altera.com> wrote:
> On Sat, 5 Mar 2016, Rob Herring wrote:
>
>> > +Example:
>> > +   hps_fpgabridge0: fpgabridge@ff400000 {
>>
>> No underscores.
>>
>> fpga-bridge@...
>
> Hi Rob,
>
> The dtc is not letting me compile if I use a hyphen in the label.
> I think we have to use hyphens in the node names and underscores
> in the labels.  So it will end up being:
>
> +       fpga_bridge0: fpga-bridge@ff400000 {
>
> Alan
