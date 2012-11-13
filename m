From: =?ISO-8859-1?Q?Per_F=F6rlin?= <per.forlin@stericsson.com>
Subject: Re: [PATCH] dt: platform: Extract device name from device tree blob
Date: Tue, 13 Nov 2012 15:33:51 +0100
Message-ID: <50A25A4F.4090909@stericsson.com>
References: <1352732343-1199-1-git-send-email-per.forlin@stericsson.com> <CACxGe6vjLA3j-bc_048UrdB5Q=8pV8=LPSVUnU_k3anX23vwyw@mail.gmail.com> <50A17E30.7030807@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A17E30.7030807@stericsson.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Linus Walleij <linus.walleij@linaro.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>, Fredrik SODERSTEDT <fredrik.soderstedt@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 11/12/2012 11:54 PM, Per F=F6rlin wrote:
> On 11/12/2012 04:20 PM, Grant Likely wrote:
>> On Mon, Nov 12, 2012 at 2:59 PM, Per Forlin <per.forlin@stericsson.c=
om> wrote:
>>> Add support to extract device name from device tree blob.
>>> If the property "dev-name" is set in the DTS this name will
>>> be used when creating the device.
>>> The auxdata_lookup has precedence and will override
>>> the "dev-name" property.
>>
>> Using a 'dev-name' property has the same problem that the 'cell-inde=
x'
>> properties have in that it is encoding part of the global namespace
>> local to the node and it becomes easy to create collisions. Instead =
of
>> this check to see if one of the properties in /aliases points to the
>> node and use that for the name.
>>
>> g.
>>
> Thanks Grant for your feedback,
>=20
> Extract from exynos5250.dtsi:
> -----------
> 	aliases {
> 		spi0 =3D &spi_0;
> 		spi1 =3D &spi_1;
> 		spi2 =3D &spi_2;
> 	};
>=20
> 	spi_0: spi@12d20000 {
> ...
> 	};
>=20
> 	spi_1: spi@12d30000 {
> ...
> 	};
>=20
> 	spi_2: spi@12d40000 {
> ...
> 	};
> ---------------
>=20
> Alias refers to the device node. The device node is not aware of the =
alias.
>=20
> How to get a device name from the aliases.
> 1. Traverse all aliases for each device node (time consuming if there=
 are many aliases)
> 2. Make a new function of_alias_get_name(), today there is only of_al=
ias_get_id()
> 3. The functionality of setting device_name based on alias name needs=
 to be optional because one may want to use aliases without changing th=
e name of the device.
> All this is feasible but perhaps not optimal.
>=20
> I don't really see how come name space is a big issue in this case. T=
he name space of "dev-name" is local to the device node. A child device=
 node can use the same dev-name as the parent (unless I'm mistaken whic=
h happens quite often). Introducing yet another property name pollutes =
the name space of the device node. Still I think the pros are stronger =
than the cons.
>=20
> Do you still prefer to use the name of the Alias? Could you please el=
aborate a bit more how this can be done in practice?
> I would agree with you if there was a reference from the device node =
to the alias.
>=20
> My dev-name patch can be made smaller by moving read_string to:
> static int of_platform_bus_create(struct device_node *bus,
>                 platform_data =3D auxdata->platform_data;
>         }
> =20
> +       if (!bus_id)
> +               of_property_read_string(bus, "dev-name", &bus_id);
> +
>=20
> It would be nice to add something in the DTS to explicitly enable thi=
s feature to avoid collisions. Default this feature is disabled.
> Any suggestions?
Hi,

I'm starting to feel that this patch is only necessary in case the regu=
lator tree or the clock tree lives out side the DTS. In this case one m=
ust use a specific dev-name to map device and clock.
Are there other reasons for wanting to set a specific device name?

If regulator-tree or clock-tree are defined in the DTS one can simply r=
efer directly to the clock from the device node.

Example:
serial@fff36000 {
			compatible =3D "arm,pl011", "arm,primecell";
			reg =3D <0xfff36000 0x1000>;
			interrupts =3D <0 20 4>;
			clocks =3D <&pclk>;
			clock-names =3D "apb_pclk";
		};

BR
Per
