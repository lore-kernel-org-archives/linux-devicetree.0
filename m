From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V3 3/3] mfd: stmpe: Update DT support in stmpe driver
Date: Mon, 26 Nov 2012 11:18:45 +0000
Message-ID: <20121126111845.GG12782@gmail.com>
References: <57384ebc52c7d39d1bae31ba3baa6f820b4ac696.1353610436.git.viresh.kumar@linaro.org>
 <7a48ae364663ab3a336251fada9aee07ccd728b8.1353610437.git.viresh.kumar@linaro.org>
 <20121123094132.EFCB73E07BE@localhost>
 <CAKohpomAM2pw9kgB6khtHzQ2WCXKZ9_pi1_sOH2dQToVS8ep4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohpomAM2pw9kgB6khtHzQ2WCXKZ9_pi1_sOH2dQToVS8ep4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, sameo@linux.intel.com, devicetree-discuss@lists.ozlabs.org, spear-devel@list.st.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Viresh Kumar wrote:

> On 23 November 2012 15:11, Grant Likely <grant.likely@secretlab.ca> w=
rote:
> > On Fri, 23 Nov 2012 00:26:20 +0530, Viresh Kumar <viresh.kumar@lina=
ro.org> wrote:
>=20
> >> + - irq-trigger                       : IRQ trigger to use for the=
 interrupt to the host
> >> + - irq-invert-polarity               : bool, IRQ line is connecte=
d with reversed polarity
> >
> > This looks odd. Normally the interrupt polarity should be encoded i=
n the irq
> > specifier flags field.
>=20
> Hi Grant and Lee Jones,
>=20
> This looks odd because stmpe is odd, i am taking the discussion held
> with Lee jones to this thread.

STMPE isn't odd or special in any way. :)

> So, how interrupt stuff works currently in DT..
> We have a interrupt controller IC:
>=20
> 	ic: interrupt-controller@40008000 {
> 		compatible =3D "foo";
> 		interrupt-controller;
> 		#interrupt-cells =3D <2>;
>                 ...
> 	};
>=20
> And we have a user of this IC:
>=20
> 	foo-peripheral@40048000 {
> 		compatible =3D "foo-peripheral";
> 		interrupt-parent =3D <&ic>;
> 		interrupts =3D <39 4>;
> 	};
>=20
> Here first field of "interrupts" gives interrupt line number and the =
second one
> gives polarity, interrupt type etc..

So far so good.

> All is good till now. Now, every interrupt controller supports the fi=
rst
> field, but the second one depends on its capabilities. An interrupt c=
ontroller
> might not have registers to configure interrupt polarity, type, etc o=
f
> the interrupt
> it will service and so the second field wouldn't be available for the=
m.
>=20
> For now just think stmpe is not a MFD and not a interrupt controller
> either. It is
> just a simple device, dev-foo.
>=20
> It will declare values of its interrupts field based on the type of
> interrupt controller
> that will service its interrupt and that can be anything like VIC/GIC=
/GPIO
> controller.
>=20
> Obviously nobody else than the parent IC driver can parse interrupts =
field
> of dev-foo, because only that driver understands the real meaning of
> these fields.
>=20
> Now, stmpe has a special property. It can decide the way its output
> interrupt line
> will work. i.e. its polarity and interrupt type - edle/level, etc..
> This is not commonly
> seen in any peripheral. Now my original bindings and the real questio=
n here is
> about passing this information to stmpe driver.
>=20
> I can't pass it in interrupts field of stmpe node, as that field
> belongs to parent
> interrupt controller of stmpe.
>=20
> I can't pass that from child nodes of stmpe, as we are programming th=
e interrupt
> coming out of stmpe and not the interrupt coming out of stmpe-gpio or
> stmpe-keypad.
>=20
> And that's why i added these bindings. Please suggest me if i am stil=
l missing
> something.

Look into .xlate functions.

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
