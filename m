From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] usb: usb251xb: Add USB2517/i hub support
Date: Thu, 21 Sep 2017 11:53:29 -0500
Message-ID: <CAL_Jsq+8RqmOzwrH7U=F7Fh9aUHALK-SpJQWfdOR-0J8Pna23g@mail.gmail.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170915233113.17855-2-fancer.lancer@gmail.com> <20170920205235.qhxhq3it6377bjcq@rob-hp-laptop>
 <20170920211517.GA3547@mobilestation>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170920211517.GA3547@mobilestation>
Sender: linux-kernel-owner@vger.kernel.org
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Richard Leitner <richard.leitner@skidata.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Sergey.Semin@t-platforms.ru, Linux USB List <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 20, 2017 at 4:15 PM, Serge Semin <fancer.lancer@gmail.com> wrote:
> On Wed, Sep 20, 2017 at 03:52:35PM -0500, Rob Herring <robh@kernel.org> wrote:
>> On Sat, Sep 16, 2017 at 02:31:09AM +0300, Serge Semin wrote:
>> > USB2517i hubs are very like USB251xb devices series. They have almost
>> > the same configuration registers space except number of ports, led
>> > configurations and lack of battery settings. All these peculiarities
>> > are reflected in this patch.
>> >
>> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
>> > ---
>> >  Documentation/devicetree/bindings/usb/usb251xb.txt |  4 +-
>>
>> Though Greg wants the code split, I want the binding as one change. H/w
>> doesn't gain features one by one.
>>
>> It's preferred to split bindings to a separate patch.
>>
>
> Folks, you are really driving people crazy. When I was reviewing a
> kernel-patchset from a Logan-guy, I asked him to combine some of his patches,
> since in fact their combination represented one solid driver. I was told to go
> very far, and Greg supported him with it. I'm not going to be that rude and will
> do as you asked me to. But really, isn't it possible to have some strict rule
> created so a developer would always follow it thereby not being asked to
> combine/split patches almost everytime?
> The only way I see for now is to know each maintainer personal preferences.

That rule is in Documentation/devicetree/bindings/submitting-patches.txt.

I generally only ask to respin and split bindings if there's other changes.

>> >  drivers/usb/misc/usb251xb.c                        | 84 +++++++++++++++++++---
>> >  2 files changed, 78 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
>> > index 3957d4eda..3d84626d3 100644
>> > --- a/Documentation/devicetree/bindings/usb/usb251xb.txt
>> > +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
>> > @@ -6,7 +6,8 @@ Hi-Speed Controller.
>> >  Required properties :
>> >   - compatible : Should be "microchip,usb251xb" or one of the specific types:
>> >     "microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
>> > -   "microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
>> > +   "microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi",
>> > +   "microchip,usb2517", "microchip,usb2517i"
>> >   - reset-gpios : Should specify the gpio for hub reset
>> >   - reg : I2C address on the selected bus (default is <0x2C>)
>> >
>> > @@ -36,6 +37,7 @@ Optional properties :
>> >     an invalid value is given, the default is used instead.
>> >   - compound-device : indicate the hub is part of a compound device
>> >   - port-mapping-mode : enable port mapping mode
>> > + - speed-led-mode : led speed indiation mode selection (usb2517 only)
>>
>> This is a boolean or has values? What are valid values?
>>
>
> It's boolean. Shall I rename it as:
> "- speed-led-mode : enable led speed indication mode (usb2517 only)"?

Having the the word "boolean" in there would help.

>> This needs a vendor prefix. Somehow the other properties got in without.
>>
>
> Hmm, it's not vendor specific, but device-specific. USB2517 is produced
> by the same vendor - microchip. The new device got almost the same functionality as
> the others, except number or ports, LED feature and battery enable feature.
> The last one isn't configurable by dts. The rest of the properties are the same
> for all the compatible devices. So what properties you are talking about then?

Well, we don't name things after devices. Properties are either common
(either from DT Spec or a class of device (clocks, regulators, USB
device, USB hubs, etc.)) or vendor specific. I haven't looked at which
other ones specifically could be common for hubs or USB devices and
which ones should be MicroChip specific.

Rob
