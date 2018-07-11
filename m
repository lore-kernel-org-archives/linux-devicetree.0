Return-Path: <SRS0=mxhv=J4=axentia.se=peda@kernel.org>
Date: Wed, 11 Jul 2018 20:35:27 +0200
In-Reply-To: <20180711191212.3855bb25@bbrezillon>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com> <20180330074751.25987-2-boris.brezillon@bootlin.com> <CAK8P3a1aZXf2sQW2mgwJScycKPhdoOAwxRjm5cQG83513uc3fg@mail.gmail.com> <20180711164120.3e32fb08@bbrezillon> <CAK8P3a2EZB_tMS_47wv6M2Qpm79ZocxxhG5zLxXsBM_YjZgkyA@mail.gmail.com> <20180711191212.3855bb25@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 01/10] i3c: Add core I3C infrastructure
From: Peter Rosin <peda@axentia.se>
Message-ID: <23432E47-794E-4A5A-80FE-844E8A1DED2E@axentia.se>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Przemyslaw Sroka <psroka@cadence.com>, Arkadiusz Golec <agolec@cadence.com>, Alan Douglas <adouglas@cadence.com>, Bartosz Folta <bfolta@cadence.com>, Damian Kos <dkos@cadence.com>, Alicja Jurasik-Urbaniak <alicja@cadence.com>, Cyprian Wronka <cwronka@cadence.com>, Suresh Punnoose <sureshp@cadence.com>, Rafal Ciepiela <rafalc@cadence.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitor Soares <Vitor.Soares@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linus
List-ID: <devicetree@vger.kernel.org>

On July 11, 2018 7:12:12 PM GMT+02:00, Boris Brezillon <boris=2Ebrezillon@b=
ootlin=2Ecom> wrote:
>On Wed, 11 Jul 2018 17:39:56 +0200
>Arnd Bergmann <arnd@arndb=2Ede> wrote:
>
>> On Wed, Jul 11, 2018 at 4:41 PM, Boris Brezillon
>> <boris=2Ebrezillon@bootlin=2Ecom> wrote:
>> > On Wed, 11 Jul 2018 16:01:56 +0200 Arnd Bergmann <arnd@arndb=2Ede>
>wrote: =20
>> >> > - the bus element is a separate object and is not implicitly
>described
>> >> >   by the master (as done in I2C)=2E The reason is that I want to
>be able
>> >> >   to handle multiple master connected to the same bus and
>visible to
>> >> >   Linux=2E
>> >> >   In this situation, we should only have one instance of the
>device and
>> >> >   not one per master, and sharing the bus object would be part
>of the
>> >> >   solution to gracefully handle this case=2E
>> >> >   I'm not sure we will ever need to deal with multiple masters
>> >> >   controlling the same bus and exposed under Linux, but
>separating the
>> >> >   bus and master concept is pretty easy, hence the decision to
>do it
>> >> >   like that=2E
>> >> >   The other benefit of separating the bus and master concepts is
>that
>> >> >   master devices appear under the bus directory in sysfs=2E =20
>> >>
>> >> I'm not following here at all, sorry for missing prior discussion
>if this
>> >> was already explained=2E What is the "multiple master" case? Do you
>> >> mean multiple devices that are controlled by Linux and that each
>talk
>> >> to other devices on the same bus, multiple operating systems that
>> >> have talk to are able to own the bus with the kernel being one of
>> >> them, a controller that controls multiple independent buses,
>> >> or something else? =20
>> >
>> > I mean several masters connected to the same bus and all exposed to
>the
>> > same Linux instance=2E In this case, the question is, should we have
>X
>> > I3C buses exposed (X being the number of masters) or should we only
>> > have one?
>> >
>> > Having a bus represented as a separate object allows us to switch
>to
>> > the "one bus : X masters" representation if we need too=2E =20
>> =2E=2E=2E
>> >>
>> >> This feels a bit odd: so you have bus_type that can contain
>devices
>> >> of three (?) different device types: i3c_device_type,
>i3c_master_type
>> >> and i3c_busdev_type=2E
>> >>
>> >> Generally speaking, we don't have a lot of subsystems that even
>> >> use device_types=2E I assume that the i3c_device_type for a
>> >> device that corresponds to an endpoint on the bus, but I'm
>> >> still confused about the other two, and why they are part of
>> >> the same bus_type=2E =20
>> >
>> > i3c_busdev is just a virtual device representing the bus itself=2E
>> > i3c_master is representing the I3C master driving the bus=2E The
>reason
>> > for having a different type here is to avoid attaching this device
>to a
>> > driver but still being able to see the master controller as a
>device on
>> > the bus=2E And finally, i3c_device are all remote devices that can be
>> > accessed through a given i3c_master=2E
>> >
>> > This all comes from the design choice I made to represent the bus
>as a
>> > separate object in order to be able to share it between different
>> > master controllers exposed through the same Linux instance=2E Since
>> > master controllers are also remote devices for other controllers,
>we
>> > need to represent them=2E =20
>>=20
>> Ok, so I think this is the most important question to resolve: do we
>> actually need to control multiple masters on a single bus from one OS
>> or not?
>>=20
>> The problem that I see is that it breaks the tree abstraction that
>> we use in the dtb interface, in the driver model and in sysfs=2E
>> If we need to deal with a hardware bus structure like
>>=20
>>               cpu
>>              /   \
>>             /     \
>>        platdev   platdev
>>            |        |
>>      i3c-master   i3c-master
>>             \      /
>>              \    /
>>             i3c-bus
>>              /    \
>>          device   device
>>=20
>> then that abstraction no longer holds=2E Clearly you could build
>> a system like that, and if we have to support it, the i3c
>infrastructure
>> should be prepared for it, since we wouldn't be able to retrofit
>> it later=2E
>
>Exactly=2E For the DT representation I thought we could have the primary
>master hold the device nodes, and then have secondary masters reference
>the main master with a phandle (i3c-bus =3D <&main_i3c_master>;)=2E For t=
he
>sysfs representation, it would be the same=2E Only one of the master
>would create the i3c_bus object and the other masters would just
>reference it=2E
>
>>=20
>> What would be the point of building such a system though?
>
>This, I don't know=2E But as you said, if we go for a "one bus per
>master" representation, going back will be difficult=2E
>
>> Is this for performance, failover, or something else?
>
>No, I don't think so, especially since the mastership handover
>operation is not free=2E So keeping the same master in control is
>probably better in term of perfs=2E
>
>One case I can think of is when the primary master does not have enough
>resources to address all devices on the bus, and let the secondary
>master handle all transactions targeting those devices=2E
>
>> IOW, what feature would we lose if we were to declare that
>> setup above invalid (and ensure you cannot represent it in DT)?
>
>That's exactly the sort of discussion I wanted to trigger=2E Maybe we
>shouldn't care and expose this use case as if it was X different I3C
>buses (with all devices present on the bus being exposed X times to the
>system)=2E

For I2C, this multiple masters for one bus case was retrofitted in the i2c=
-demux-pinctrl driver=2E It's a huge kludge with a number of limitations=2E=
 I don't know it the circumstances for this I2C driver applies for I3C, but=
 with that in mind I'd definitely go with the proposed extra bus object=2E

Cheers,
Peter
