Return-Path: <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [Gta04-owner] [PATCH 0/4] UART slave device support - version 4
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20160113191542.GA12086@leverpostej>
Date: Fri, 15 Jan 2016 10:34:51 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CD6CA14-AE4F-444F-A9A2-CF9B9485F2DC@goldelico.com>
References: <20150511013540.5709.93626.stgit@notabene.brown> <CAAObsKD7-02HVUosXVwqcH6HyGEGYJ9jdNepuNhLiiL+ujO5iw@mail.gmail.com> <481E05A9-A192-438D-B092-D7700B30BBC4@goldelico.com> <20160113191542.GA12086@leverpostej>
To: Mark Rutland <mark.rutland@arm.com>
Cc: List for communicating with real GTA04 owners <gta04-owner@goldelico.com>, tomeu@tomeuvizoso.net, NeilBrown <neil@brown.name>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-serial@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, Marek Belisko <marek@goldelico.com>
List-ID: <devicetree@vger.kernel.org>

Hi Mark,

Am 13.01.2016 um 20:15 schrieb Mark Rutland <mark.rutland@arm.com>:

> On Tue, Jan 12, 2016 at 02:28:00PM +0100, H. Nikolaus Schaller wrote:
>> Hi Tomeu,
>>=20
>> Am 12.01.2016 um 14:06 schrieb Tomeu Vizoso <tomeu@tomeuvizoso.net>:
>>=20
>>> On 11 May 2015 at 03:56, NeilBrown <neil@brown.name> wrote:
>>>> Hi all,
>>>> here is version 4 of my "UART slave device" patch set, previously
>>>> known as "tty slave devices".
>>>=20
>>> Hi Neil,
>>>=20
>>> do you (or someone else) have plans to continue this work in the =
short
>>> or medium term?
>>=20
>> yes, there is something in our upstreaming pipeline. This one works =
for us on top of 4.4.0:
>>=20
>> =
<http://git.goldelico.com/?p=3Dgta04-kernel.git;a=3Dshortlog;h=3Drefs/head=
s/work/hns/misc/w2sg-tty-slave2-v4>
>>=20
>> There is one point still to be solved: the exact style of the DT =
bindings.
>>=20
>> We have an idea how a driver can implement two different styles =
(child node AND phandle)
>> so that it is up to the DTS developer to use the one that best fits =
into the existing DTS.
>=20
> =46rom my perspective as a binding maintainer, and as I stated before, =
the
> child node approach made the most sense and was most consistent with =
the

> way we handle other devices.

I simply don't see that this is the most common way other devices are =
handled.

I find many counter-examples which use phandles:
* gpios
* regulators
* iio channels used by other drivers (e.g. iio-hwmon)
* phy devices
* timers
* pwms
* interrupts
* dma
* mcbsp (see e.g. =
http://lxr.free-electrons.com/source/arch/arm/boot/dts/omap3-n900.dts#L127=
)
* mmc-pwr-seq-simple (which does not even describe a physical piece of =
hardware)

All of them define the provider in one node. And refer to it by a =
phandle in another node
where they are used.

So I see a lot of provider-consumer relationships modeled by phandles =
but not by child nodes.

Next, if I look up real world DT sources, child nodes have in a majority =
of cases a
reg =3D <...> or ranges =3D <...> entry to define specific addresses of =
each child node and
to distinguish between them.

This is not always the case (e.g. children of the root node) but often. =
Therefore I assume
the child-node pattern is mainly intended for distinguishing between =
multiple *addressable*
subdevices connected to a single provider, i.e. some sort of "shared =
bus".

In the specific problem I (and Neil) want to solve (GTA04 devices and =
more to come),
the UART is simply a provider of serial data lines and power control =
events (or whatever
the driver implementations want to do with the knowledge about this =
connection).

Although we have multiple such uart-device connections, they are all =
individual point-to-point.

Not a bus structure with multiple clients. So there are several simple =
provider-consumer relations.
Hence there is no urgent need for addresses of multiple child nodes of a =
single UART and
no reg/ranges property.

Of course, with the child node approach it would give the flexibility to =
introduce such
a feature easily in the future - but I don't see a use case. Not even at =
the horizon.

And I wonder how I should implement a driver if a child node provides a =
reg property.
Should I invent and implement a protocol layer to make the UART an =
addressable bus?

But the chip I connect to an UART does not understand that and I can't =
change it.
So it is probably not expected by the uart-slaves story - and I have no =
need for addressability
of multiple subnodes.

So I conclude: the single chip is the consumer of a simple UART provider =
and should therefore
be described as a connection through a phandle. Like in all the other DT =
examples listed
above. The best description is IMHO:

=
https://www.kernel.org/doc/Documentation/devicetree/bindings/iio/iio-bindi=
ngs.txt

At least this is how I see the DT world when going through some device =
tree files
and trying to deduce what the common style is.

This appears to be opposite to what you say: "most consistent with the =
way we
handle other devices". I only find that other devices which understand =
some addressing
scheme are handled that way.

>=20
> I don't understand what the benefit of supporting two styles of
> description would be, relative to the maintenance cost.

Supporting both styles is a proposal to make both of us happy.

And there isn't much to be maintained. It is just a notice in the =
bindings document
of uart-slaves that the phandle is optional, if the node is the single =
child node of an
UART. If it isn't a subnode of an UART, or not at index 0, the phandle =
is needed
to describe the cross-reference. So it can be seen as a simple extension =
to move
the node outside but keep the link.

A rough estimate is that it requires just ~20 lines to implement in our =
driver (unless
we need locks, error handling etc.).

Then, the DT developers (like me) can decide which style better fits =
into the DTS
structure that already exists, when adding a salve device to some UART.

My experience from almost daily work with device trees is that phandles =
give
more flexibility in expressing the hardware structure in DT language. =
And they
allow to better group properties. In this case: "I am connected to =
interface ...".

And the allow to easily modify it by includes and overlays to describe =
small hardware
variants ("I am now connected to a different interface ..."). Moving a =
subnode between
parents is difficult without multiple well designed include files, while =
for phandle
there is a simple idiom:

	#include <existing.dts(i)>
	&child { link =3D <&new-parent>; };

IMHO this is easy to read and understand. And I have used that pattern =
several
times, e.g. for "adding" hardware to some evaluation board without =
touching the
original DTS. So I don't want to miss it in this case.

> Nor do I
> understand your fixation with the phandle approach,

Well, because I don't understand your fixation on the child node =
approach for this
non-addressable point-to-point connection. Why prepare for a feature =
that nobody
really needs and has asked for?

To be more specific:

* I find that the phandle approach better (more flexible) suits the =
problem I want to have solved.
* there is no need for multiple child nodes for a point-to-point =
connection, because UART is rarely used as a bus.
* I see a lot of examples where phandles are intensively used and there =
it appears to be right to do so.

I just know that you conclude "child nodes made the most sense and was =
most consistent".

But I still wonder why. It does not appear to match what I observe in =
arch/arm/boot/dts
and the problem I want to solve.

> given it has been
> repeatedly disagreed with by binding maintainers.

Binding maintainers may sometimes be as wrong as I may be here. This =
needs a discussion
but not a circular argument, that it already has been disagreed =
repeatedly.

I may have missed it, but I am also not aware that there was a technical =
analysis of both
approaches, comparing the pro's and con's. I had received requests to =
show code for the
phandle approach and we provided it.

Coming to different conclusions can happen, if requirements are weighted =
differently. Or
the problem to be solved is not completely understood. But then, the =
requirements and
assumptions should be discussed (which is difficult on a =
patch-review-based discussion list).

On a more general level, the key problem is that *I* have to write and =
maintain a
multitude of board specific DTS files (not all of them in mainline) =
using the style
*you* decide.

A style which I don't feel to be the "right" one, because it is less =
flexible (e.g. swapping
child nodes between parents in board variants).

Summary: your decision gives flexibility for future expansion that I do =
not need (and
probably nobody else) and does not provide the flexibility I need today =
(and others
might appreciate).

So what should I do? Except being fixed on the phandle approach, =
repeating my arguments
and describe requirements. And submitting our code and bindings document =
proposal
every now and then?

Thanks for giving me another chance to explain my PoV,
Nikolaus
