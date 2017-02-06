MIME-Version: 1.0
In-Reply-To: <20170202070507.GY7139@valkosipuli.retiisi.org.uk>
References: <20170130140628.18088-1-hverkuil@xs4all.nl>
	<20170130140628.18088-9-hverkuil@xs4all.nl>
	<20170201165059.2qw3gnuyornvfl46@rob-hp-laptop>
	<20170202070507.GY7139@valkosipuli.retiisi.org.uk>
Date: Mon, 6 Feb 2017 15:39:52 -0600
Message-ID: <CAL_JsqK9g4A+vSbPTuz7hvr3zJ=Cud8pNvkRU=-jLV-t7GYpqg@mail.gmail.com>
Subject: Re: [PATCHv2 08/16] atmel-isi: document device tree bindings
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Songjun Wu <songjun.wu@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 2, 2017 at 1:05 AM, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> Hi Rob,
>
> On Wed, Feb 01, 2017 at 10:50:59AM -0600, Rob Herring wrote:
>> > +                   remote-endpoint = <&ov2640_0>;
>> > +                   bus-width = <8>;
>> > +                   vsync-active = <1>;
>> > +                   hsync-active = <1>;
>>
>> Which side of the connect is supposed to define these?
>
> Today we have endpoint properties at each endpoint independently of the
> remote endpoint. I guess you could obtain the endpoint properties from the
> remote endpoint as well. There are exceptions though.

The constraints should be at whatever end is imposing them. 

> The configuration might not always be exactly the same. The parallel
> interface is a little bit special: you could conceivably have a transmitter
> with 8 wires but a receiver that could only use 10 or more. The wiring could
> be such that the two most significant bits of the transmitter would be wired
> to the two least significant bits on the receiver side. In this case the
> bus-width property would have different values at each endpoint.

Hopefully that implied wiring is documented somewhere.

> If we were to do something like that, it should be done everywhere and such
> exceptions be handled somehow.
>
> The CSI-2 lane mapping configuration (where supported by the hardware) is
> also specific to an endpoint.
>
> --
> Kind regards,
>
> Sakari Ailus
> e-mail: sakari.ailus@iki.fi     XMPP: sailus@retiisi.org.uk
