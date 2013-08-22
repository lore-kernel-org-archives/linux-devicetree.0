From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Thu, 22 Aug 2013 17:41:02 +0100
Message-ID: <1377189662.2626.4.camel@hornet>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com>
	 <1374501843-19651-3-git-send-email-hector.palacios@digi.com>
	 <520AA3CD.1040008@kernel.org> <1376491467.18617.41.camel@hornet>
	 <52153B8E.7050309@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52153B8E.7050309-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Wed, 2013-08-21 at 23:13 +0100, Alexandre Belloni wrote:
> You are not so wrong. There is indeed actually only one reference
> voltage (and that is 1.85V). But, before feeding the voltage to the A=
DC
> channels, you sometimes have a divider. Then, after the channel muxin=
g,
> you can add a by 2 divider.
>=20
> Mandatory ascii art:
>=20
>             +-----+
>             |     |
>    +-ch1--->|     |
>             |     |
>             |     |
>             |     |     +-----+
>    +-ch2--->|     |     |     |
>             | MUX |++-->| ADC +----------->
>      ch3    |     | |   |     |
>     +----+  |     | |   +-----+
>     |    |  |     | |      |
>   +-> :4 +->|     | |  +---+--+
>     |    |  |     | |  |      |
>     +----+  |     | +->|  :2  |
>             +-----+    |      |
>                        +------+
>=20
>
> So, from my point of view, the divider that is before the mux (the by=
 4
> divider on channel 3 on my drawing) is not part of the the ADC, it is
> not fixed by that IP. And indeed, that changed between the i.mx23 and
> i.mx28 while the IP is the same.

Let me a couple of additional questions, hope you don't mind:

1. Is the channel defined as: input *and* the reference voltage? Or,
does the mux switch both of them at the same time?

2. Is the mux controlled (so the channel selected) by a control registe=
r
"integral" to the ADC?

3. Is the reference voltage generated "inside" the SOC? Or does it come
from an external source?

4. How is the "LRADC" IP actually documented? Does the spec clearly say
that it has 8 voltage reference inputs?

> So, the two solutions you suggest are:
> 1/ using a fixed-regulator phandle per channel
> 2/ hard-coding the dividers in the driver using the compatible string=
 to
> know which divider is on which channel.
>=20
> I feel that solution 2 is less future proof but at the same time, I
> don't believe we will see that IP in another chip in the future.

If we were to follow the spirit of "how is it wired" to the letter, you
should really use 8 supplies, but I appreciate that it can be
troublesome (or maybe not? it's just 2 dtsi files after all ;-). So
maybe, as the compatible values explicitly mention the SOC names, you
just want to hardcode the voltage levels in the driver itself (probably
as data for the match array)? This of course assume that the reference
source is internal. Shortly speaking - I believe that you should have
phandles to regulators or nothing at all there :-) A de-facto-constant
list of SOC-specific numbers seems the worst option.

Thanks!

Pawel

Pawe=C5=82
