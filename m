From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 14/36] mtd: st_spi_fsm: Add device-tree binding
 documentation
Date: Mon, 2 Dec 2013 11:03:04 +0000
Message-ID: <20131202110304.GB31626@lee--X1>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-15-git-send-email-lee.jones@linaro.org>
 <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaWXBchz78Yby11VpveBDtn6FrmupS=cnNYhvHgFJsBUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, angus.clark@st.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > +Optional properties:
> > +  - st,syscfg          : Phandle to boot-device system configurati=
on registers
> > +  - st,boot-device-reg : Address of the aforementioned boot-device=
 register(s)
> > +  - st,boot-device-spi : Expected boot-device value if booted via =
this device
> > +
> > +Example:
> > +       spifsm: spifsm@fe902000{
> > +               compatible         =3D "st,spi-fsm";
> > +               reg                =3D  <0xfe902000 0x1000>;
> > +               reg-names          =3D "spi-fsm";
> > +               pinctrl-0          =3D <&pinctrl_fsm>;
> > +               st,syscfg          =3D <&syscfg_rear>;
> > +               st,boot-device-reg =3D <0x958>;
> > +               st,boot-device-spi =3D <0x1a>;
>=20
> I don't think we should encode any register offsets whatsoever in dev=
ice
> tree but maybe that's just me. (Yes, Stephen will beat me up about
> pin control single, but I consider that a special case.)
>=20
> I would just put the last two things as #defines into the driver file=
(s)
> or - if it's related to other syscfg registers and varies with SoC in=
carnation,
> as a #define in a shared header for that syscfg thing.

No can do. This isn't _this_ device's register offset, this is a
syscfg register offset which a) there is no driver to apply specific
register offsets to and b) are liable to change oversubsequent SoCs.

> The syscfg phandle is elegant though, really like that.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
