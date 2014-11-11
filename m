From: Grant Likely <grant.likely@linaro.org>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Tue, 11 Nov 2014 11:07:57 +0000
Message-ID: <20141111110757.3DFFAC40D48@trevor.secretlab.ca>
References: <545BD3EC.6050503@datacom.ind.br>
	<707686811.tbHdnxXMgE@wuerfel> <545CF546.8090703@datacom.ind.br>
	<2501338.EAyTJJ482M@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2501338.EAyTJJ482M@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, DATACOM - =?iso-8859-1?b?yXJpY28=?= Nunes <erico.nunes@datacom.ind.br>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014 18:04:35 +0100
, Arnd Bergmann <arnd@arndb.de>
 wrote:
> On Friday 07 November 2014 14:37:26 DATACOM - =C3=89rico Nunes wrote:
> > Hello Arnd and all,
> >=20
> > On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
> > > On Thursday 06 November 2014 18:02:52 DATACOM - =C3=89rico Nunes =
wrote:
> > >> The idea is that "fpga-spi" is a spi_driver which instantiates a=
ll of the
> > >> "fpga-deviceN" as platform_devices, through the use of
> > >> of_platform_populate(dev->of_node, NULL, NULL, dev).
> > >>
> > >> The visible problem we're facing with this approach is that, as =
the internal
> > >> platform_devices have a "reg" property, of_platform_populate() e=
ventually
> > >> triggers an address translation which is apparently trying to tr=
anslate the
> > >> addresses of the internal platform_bus to addresses of the proce=
ssor memory
> > >> map.
> > >> This translation is however not part of our intention, as we int=
end to have an
> > >> internal bus with its own memory map.
> > >> This fails when __of_translate_address() reaches the spi-master =
boundary
> > >> because (as it seems to make sense) it isn't possible to transla=
te them past
> > >> that.
> > >> A KERN_ERR rated message like
> > >> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
> > >> is thrown by __of_translate_address() and later it is not possib=
le to obtain
> > >> the "reg" address with platform_get_resource().
> > >>
> > >> On this scenario, we have a few questions and, depending on the =
outcome of
> > >> these, possibly a patch.
> > >>
> > >> 1. Is it possible to have an internal platform_bus with a differ=
ent memory map
> > >> as we intended? Or are platform_busses and platform_devices supp=
osed to always
> > >> be mapped on the processor memory map?
> > > It's inconsistent. We have some code that assumes that platform d=
evices
> > > are always memory mapped, and some other code that breaks this as=
sumption.
> >=20
> > By this I take that the platform subsystem could be made generic so=
 it can be
> > used in both ways (mapped to processor memory map or mapped to a pr=
ivate memory
> > map). There seems to be no strict requirement enforcing it to be pr=
ocessor
> > memory map.
> >=20
> > Is this correct?
>=20
> It could be, but I'm sure if that is a good idea or not. It might com=
plicate
> things elsewhere, so it would at least need careful testing and conse=
nsus
> among a broader group of developers.

I don't think it is a good idea. I would prefer to make the behaviour o=
f
of_platform_populate() generic so it could work for multiple bus
types rather than reusing/abusing platform_device in this way.

If the devices on the FPGA were memory mapped, it would be a different
situation, but being behind an SPI bus where the access to those device=
s
must always be mediated by the SPI controller, it would be better to
have a separate bus type and a separate pool of drivers for those
devices.

g.
