From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] ata: ahci_st: Provide DT bindings for ST's SATA
 implementation
Date: Wed, 12 Mar 2014 12:48:35 +0000
Message-ID: <20140312124835.GA22450@lee--X1>
References: <1393328481-7251-1-git-send-email-lee.jones@linaro.org>
 <20140312114257.GA17461@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140312114257.GA17461@e106331-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "DCG_UPD_stlinux_kernel@list.st.com" <DCG_UPD_stlinux_kernel@list.st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

> > +This binding describes a SATA device.
> > +
> > +Required properties:
> > + - compatible	   : Must be "st,ahci"
>=20
> Is there not a more specific name? This is awfully generic.

There isn't one. ST only have one AHCI driver. The driver is named as
generically.

> > + - reg		   : Physical base addresses and length of register sets
> > + - interrupts	   : Interrupt associated with the SATA device
> > + - interrupt-names :   Associated name must be; "hostc"
> > + - resets	   : The power-down and soft-reset lines of SATA IP
> > + - reset-names	   :   Associated names must be; "pwr-dwn" and "sw-=
rst"
>=20
> Get rid of the semicolon, it makes this harder to read. Same for the
> other -names proeprties.

Sure.

> > + - clocks	   : The phandle for the clock
> > + - clock-names	   :   Associated name must be; "ahci_clk"
> > + - phys		   : The phandle for the PHY device
> > + - phy-names	   :   Associated name must be; "ahci_phy"
>=20
> This looks sane, but I'd like to see a more specific description and
> compatible string.

Specific description in what sense?

"This binding describes a SATA device."

to

"This binding describes ST's SATA device." ?

> > +Example:
> > +
> > +	sata0: sata@fe380000 {
> > +		compatible      =3D "st,ahci";
> > +		reg             =3D <0xfe380000 0x1000>;
> > +		interrupts      =3D <GIC_SPI 157 IRQ_TYPE_NONE>;
> > +		interrupt-names =3D "hostc";
> > +		phys	        =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> > +		phy-names       =3D "ahci_phy";
> > +		resets	        =3D <&powerdown STIH416_SATA0_POWERDOWN>,
> > +				  <&softreset STIH416_SATA0_SOFTRESET>;
> > +		reset-names     =3D "pwr-dwn", "sw-rst";
> > +		clocks	        =3D <&CLK_S_ICN_REG_0>;
> > +		clock-names     =3D "ahci_clk";
> > +	};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
