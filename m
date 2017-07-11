MIME-Version: 1.0
In-Reply-To: <1499693547.6394.17.camel@synopsys.com>
References: <20170703165109.31535-1-Eugeniy.Paltsev@synopsys.com>
	<20170703165109.31535-4-Eugeniy.Paltsev@synopsys.com>
	<20170710004121.m5sp3wlovh7e6wzq@rob-hp-laptop>
	<1499693547.6394.17.camel@synopsys.com>
Date: Tue, 11 Jul 2017 14:07:02 -0500
Message-ID: <CAL_JsqJkCjs-f6m-47--yX5XY9VawBFfSn0JMkJSJ7q2wa1kKQ@mail.gmail.com>
Subject: Re: [PATCH 3/3 v7] ARC: hsdk: initial port for HSDK board
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Jul 10, 2017 at 8:32 AM, Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> Hi Rob,
>
> On Sun, 2017-07-09 at 19:41 -0500, Rob Herring wrote:
>> On Mon, Jul 03, 2017 at 07:51:09PM +0300, Eugeniy Paltsev wrote:
>> >
>> > From: Alexey Brodkin <abrodkin@synopsys.com>
>
> [snip]
>
>> > +           ohci@60000 {
>> > +                   compatible = "generic-ohci";
>>
>> Still, these need to be more specific.
>
> But I guess for that we first need to add your compatible values to
> drivers/usb/host/{o|e}hci-platform.c, right?

Not necessarily. You can leave this one for the driver to match on, but the dts needs a more specific one to ensure any quirks can be handled in the future.

Rob
