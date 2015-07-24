From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 2/2] mfd: atmel-flexcom: add a driver for Atmel
 Flexible Serial Communication Unit
Date: Fri, 24 Jul 2015 11:16:20 +0100
Message-ID: <20150724101620.GE3436@x1>
References: <cover.1437558598.git.cyrille.pitchen@atmel.com>
 <7639e02fc2b16dc20b19fbe3bbbb986b0f3b9887.1437558598.git.cyrille.pitchen@atmel.com>
 <20150723073217.GT3061@x1>
 <20150723100101.7290242b@bbrezillon>
 <20150723091311.GX3061@x1>
 <20150723145007.099d01c2@bbrezillon>
 <55B1195F.4000104@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55B1195F.4000104@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 23 Jul 2015, Cyrille Pitchen wrote:

> Hi all,
>=20
> Le 23/07/2015 14:50, Boris Brezillon a =C3=A9crit :
> > On Thu, 23 Jul 2015 10:13:11 +0100
> > Lee Jones <lee.jones@linaro.org> wrote:
> >=20
> >> On Thu, 23 Jul 2015, Boris Brezillon wrote:
> >>
> >>> Hi Lee,
> >>>
> >>> On Thu, 23 Jul 2015 08:32:17 +0100
> >>> Lee Jones <lee.jones@linaro.org> wrote:
> >>>
> >>>> On Wed, 22 Jul 2015, Cyrille Pitchen wrote:
> >>>>> +	for_each_child_of_node(np, child) {
> >>>>> +		const char *compatible;
> >>>>> +		int cplen;
> >>>>> +
> >>>>> +		if (!of_device_is_available(child))
> >>>>> +			continue;
> >>>>> +
> >>>>> +		compatible =3D of_get_property(child, "compatible", &cplen);
> >>>>> +		if (!compatible || strlen(compatible) > cplen)
> >>>>> +			continue;
> >>>>> +
> >>>>> +		if (strstr(compatible, "-usart")) {
> >>>>> +			opmode =3D FLEX_MR_OPMODE_USART;
> >>>>> +			break;
> >>>>> +		}
> >>>>> +
> >>>>> +		if (strstr(compatible, "-spi")) {
> >>>>> +			opmode =3D FLEX_MR_OPMODE_SPI;
> >>>>> +			break;
> >>>>> +		}
> >>>>> +
> >>>>> +		if (strstr(compatible, "-i2c")) {
> >>>>> +			opmode =3D FLEX_MR_OPMODE_TWI;
> >>>>> +			break;
> >>>>> +		}
> >>>>> +	}
> >>>>
> >>>> From what I understand Flexcom is a wrapper which can sit above =
any
> >>>> number of SPI, I2C and/or UART devices.  Devices which you don't
> >>>> really have any control over (source code wise).  So wouldn't it=
 be
> >>>> better to match on the details you do have control over i.e. the=
 node
> >>>> name, rather than the compatible string?
> >>>>
> >>>> I would personally match on of_find_node_by_name() to future-pro=
of
> >>>> your implementation.
> >>>
> >>> Actually, I think using compatible strings is more future-proof t=
han
> >>> using the node names, because nothing in the DT bindings doc enfo=
rce the
> >>> node name, and usually what we use to attach a node to a specific
> >>> driver is the compatible string (this one is specified in the bin=
dings
> >>> doc).
> >>
> >> I know what you're saying, but what if someone uses the Flexcom dr=
iver
> >> to wrap a different type of SPI driver where (for instance) the
> >> compatible string used is "<name>-<newtype>".  Then we'd have to k=
eep
> >> adding more lines here to accommodate.
> >>
> >> Whereas if we used the child node name which only pertains to _thi=
s_
> >> driver, we would then have full control and know that (unless it
> >> Flexcom is used for a completely different type of serial controll=
er)
> >> we wouldn't have to keep expanding the code to accommodate.
> >=20
> > You're right about the complexity implied by the compat string
> > maintenance, but I still think using node names to detect the mode =
is
> > a bad idea.
> >=20
> > Let's take another example making both solution unsuitable: what if
> > the flexcom-v2 exposes 2 devices of the same type, they will both h=
ave
> > the same name and the same compatible string, and we'll have no way=
 to
> > detect the appropriate mode. That's why I think none of our suggest=
ion
> > is future-proof.
> >=20
> >>
> >>> Regarding the implementation itself, I would match the child node=
 with
> >>> an of_device_id table rather than trying to find a specific subst=
ring
> >>> in the compatible string, but I think that's only a matter of tas=
te.
> >>
> >> You mean duplicate each of the supported device's compatible strin=
gs
> >> in this driver, then fetch the attributed of_match_device()->data
> >> value?
> >>
> >=20
> > Yes, and that's definitely not a good idea, but I think Cyrille has
> > found a better approach (I'll let him explain).
>=20
> Indeed, what about taking advantage of the "ranges" property?
>=20
> For the Flexcom:
> #address-cells =3D <2>;
> #size-cells =3D <1>;
> ranges =3D <1 0 0xf8034200 0x200    /* opmode 1: USART */
>           2 0 0xf8034400 0x200    /* opmode 2: SPI */
>           3 0 0xf8034600 0x200>;  /* opmode 3: I2C */
>=20
> Then for the single available child (for instance the SPI controller)=
:
> reg =3D <2 0 0x200>;
>=20
> So the Operating Mode to be set into the Flexcom Mode Register is rea=
d from
> the very first u32 of the "reg" property of the child.
>=20
> No need to introduce any new DT property and the mapping remains easy=
 to
> maintain to follow hardware upgrades.

When we do things like this we normally do:

    reg <base base_size>, <mode mode_size>;
    reg-names "base", "mode";

Then use:

     platform_get_resource_byname()

=2E... to fetch them.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
