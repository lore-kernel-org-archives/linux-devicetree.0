From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Fri, 07 Nov 2014 18:04:35 +0100
Message-ID: <2501338.EAyTJJ482M@wuerfel>
References: <545BD3EC.6050503@datacom.ind.br> <707686811.tbHdnxXMgE@wuerfel> <545CF546.8090703@datacom.ind.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <545CF546.8090703@datacom.ind.br>
Sender: linux-kernel-owner@vger.kernel.org
To: DATACOM - =?ISO-8859-1?Q?=C9rico?= Nunes <erico.nunes@datacom.ind.br>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 07 November 2014 14:37:26 DATACOM - =C9rico Nunes wrote:
> Hello Arnd and all,
>=20
> On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
> > On Thursday 06 November 2014 18:02:52 DATACOM - =C9rico Nunes wrote=
:
> >> The idea is that "fpga-spi" is a spi_driver which instantiates all=
 of the
> >> "fpga-deviceN" as platform_devices, through the use of
> >> of_platform_populate(dev->of_node, NULL, NULL, dev).
> >>
> >> The visible problem we're facing with this approach is that, as th=
e internal
> >> platform_devices have a "reg" property, of_platform_populate() eve=
ntually
> >> triggers an address translation which is apparently trying to tran=
slate the
> >> addresses of the internal platform_bus to addresses of the process=
or memory
> >> map.
> >> This translation is however not part of our intention, as we inten=
d to have an
> >> internal bus with its own memory map.
> >> This fails when __of_translate_address() reaches the spi-master bo=
undary
> >> because (as it seems to make sense) it isn't possible to translate=
 them past
> >> that.
> >> A KERN_ERR rated message like
> >> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
> >> is thrown by __of_translate_address() and later it is not possible=
 to obtain
> >> the "reg" address with platform_get_resource().
> >>
> >> On this scenario, we have a few questions and, depending on the ou=
tcome of
> >> these, possibly a patch.
> >>
> >> 1. Is it possible to have an internal platform_bus with a differen=
t memory map
> >> as we intended? Or are platform_busses and platform_devices suppos=
ed to always
> >> be mapped on the processor memory map?
> > It's inconsistent. We have some code that assumes that platform dev=
ices
> > are always memory mapped, and some other code that breaks this assu=
mption.
>=20
> By this I take that the platform subsystem could be made generic so i=
t can be
> used in both ways (mapped to processor memory map or mapped to a priv=
ate memory
> map). There seems to be no strict requirement enforcing it to be proc=
essor
> memory map.
>=20
> Is this correct?

It could be, but I'm sure if that is a good idea or not. It might compl=
icate
things elsewhere, so it would at least need careful testing and consens=
us
among a broader group of developers.

> >> 2. If platform_bus and platform_device were actually designed to a=
lways be
> >> mappable to the processor memory map, what would be a different ap=
proach to
> >> this problem?  One alternative considered was to define a new "fpg=
a_bus" and
> >> "fpga_device" but that seemed as an overkill approach to the probl=
em.
> > I think the existing mfd framework should do what you need, when yo=
u call
> > mfd_add_devices() and pass a table of cells with the compatible str=
ings
> > for your devices, it should create the platform devices you want. I=
f not,
> > that can probably be fixed in the mfd core code.
> >
> >
>=20
> Thanks for the tip, we were not aware of the purpose of this mfd fram=
ework and
> we will take a look at this framework now.
> However I'm thinking now that eventually it would fall in the same ca=
se of
> trying to translate the address of any "reg" dts property to the proc=
essor
> memory map, and fail with the same error for the SPI case.
>=20
> Considering this and taking the answer to the first question, do you =
think a
> patch fixing the "error" report by the translation function would be
> acceptable?
> We can prepare/test that under our platform and submit it.

Please try to use the mfd approach first. There are a lot of mfd driver=
s
on the SPI bus, so I'd assume this works fine.

	Arnd
