From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] phy: miphy365x: Add Device Tree bindings for the
 MiPHY365x
Date: Thu, 13 Feb 2014 11:03:14 +0000
Message-ID: <20140213110314.GH32508@lee--X1>
References: <1392220985-28189-1-git-send-email-lee.jones@linaro.org>
 <20140212164019.GE25957@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140212164019.GE25957@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "alexandre.torgue@st.com" <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

> > The MiPHY365x is a Generic PHY which can serve various SATA or PCIe
> > devices. It has 2 ports which it can use for either; both SATA, bot=
h
> > PCIe or one of each in any configuration.
> >=20
> > Cc: devicetree@vger.kernel.org
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@st.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/phy-miphy365x.txt      | 43 ++++++++++=
++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy=
365x.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/phy-miphy365x.tx=
t b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > new file mode 100644
> > index 0000000..fdfa7ca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/phy-miphy365x.txt
> > @@ -0,0 +1,43 @@
> > +STMicroelectronics STi MIPHY365x PHY binding
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This binding describes a miphy device that is used to control PHY =
hardware
> > +for SATA and PCIe.
> > +
> > +Required properties:
> > +- compatible: Should be "st,miphy365x-phy"
> > +- #phy-cells: Should be 2 (See example)
>=20
> The first example has #phy-cells =3D <1>.

Right, will fix. Should be 2.

> What do the cells mean? What are the expected values?

http://www.spinics.net/lists/arm-kernel/msg307209.html

> > +- reg:	      Address and length of the register set for the device
> > +- reg-names:  The names of the register addresses corresponding to=
 the
> > +	      registers filled in "reg".
>=20
> Whenever there is a ${PROP}-names property, there should be a list of
> explicit values, and a description of how it relates to ${PROP}. With=
out
> that it's a bit useless.
>=20
> Please provide an explicit list of expected names here.
>=20
> I assume here what you want is something like:
>=20
> - reg: a list of address + length pairs, one for each entry in reg-na=
mes
> - reg-names: should contain:
>   * "sata0" for the sata0 control registers...
>   * "sata1" ...
>   * "pcie0" ...
>   * "pcie1" ...

Can do.

> > +- st,syscfg : Should be a phandle of the syscfg node.
>=20
> What's this used for?

It's used to gain access to the system configuration
registers. Specifically in this case the bits to choose between PCI or
SATA mode.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
