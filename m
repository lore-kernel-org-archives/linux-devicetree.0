From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Fri, 07 Nov 2014 11:04:36 +0100
Message-ID: <707686811.tbHdnxXMgE@wuerfel>
References: <545BD3EC.6050503@datacom.ind.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545BD3EC.6050503-rCUF4CxDseZknzVnJbg3IA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DATACOM - =?ISO-8859-1?Q?=C9rico?= Nunes <erico.nunes-rCUF4CxDseZknzVnJbg3IA@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 06 November 2014 18:02:52 DATACOM - =C9rico Nunes wrote:
>=20
> The idea is that "fpga-spi" is a spi_driver which instantiates all of=
 the
> "fpga-deviceN" as platform_devices, through the use of
> of_platform_populate(dev->of_node, NULL, NULL, dev).
>=20
> The visible problem we're facing with this approach is that, as the i=
nternal
> platform_devices have a "reg" property, of_platform_populate() eventu=
ally
> triggers an address translation which is apparently trying to transla=
te the
> addresses of the internal platform_bus to addresses of the processor =
memory
> map.
> This translation is however not part of our intention, as we intend t=
o have an
> internal bus with its own memory map.
> This fails when __of_translate_address() reaches the spi-master bound=
ary
> because (as it seems to make sense) it isn't possible to translate th=
em past
> that.
> A KERN_ERR rated message like
> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
> is thrown by __of_translate_address() and later it is not possible to=
 obtain
> the "reg" address with platform_get_resource().
>=20
> On this scenario, we have a few questions and, depending on the outco=
me of
> these, possibly a patch.
>=20
> 1. Is it possible to have an internal platform_bus with a different m=
emory map
> as we intended? Or are platform_busses and platform_devices supposed =
to always
> be mapped on the processor memory map?

It's inconsistent. We have some code that assumes that platform devices
are always memory mapped, and some other code that breaks this assumpti=
on.

> 2. If platform_bus and platform_device were actually designed to alwa=
ys be
> mappable to the processor memory map, what would be a different appro=
ach to
> this problem?  One alternative considered was to define a new "fpga_b=
us" and
> "fpga_device" but that seemed as an overkill approach to the problem.

I think the existing mfd framework should do what you need, when you ca=
ll
mfd_add_devices() and pass a table of cells with the compatible strings
for your devices, it should create the platform devices you want. If no=
t,
that can probably be fixed in the mfd core code.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
