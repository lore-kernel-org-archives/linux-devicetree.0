From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: imx: Add Y Soft IOTA Draco, Hydra and Ursa boards
Date: Tue, 8 Jan 2019 08:53:18 -0600
Message-ID: <CAL_Jsq+k3BvjP=oY=yGRiHgvy+yXjnzfT6H8V9HjVGf8MOQAYA@mail.gmail.com>
References: <1545144107-88378-1-git-send-email-michal.vokac@ysoft.com>
 <20181228232556.GA14277@bogus> <49371bd4-6ab9-31c3-dd48-800becac17e3@ysoft.com>
 <353b8f62-e265-c3c1-e352-d33c204eb6dc@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <353b8f62-e265-c3c1-e352-d33c204eb6dc@ysoft.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Vm9rw6HEjSBNaWNoYWw=?= <Michal.Vokac@ysoft.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 8, 2019 at 8:25 AM Vok=C3=A1=C4=8D Michal <Michal.Vokac@ysoft.c=
om> wrote:
>
> On 8.1.2019 12:43, Vok=C3=A1=C4=8D Michal wrote:
> > On 29.12.2018 00:25, Rob Herring wrote:
> >> On Tue, Dec 18, 2018 at 02:42:11PM +0000, Vok=C3=A1=C4=8D Michal wrote=
:
> [...]
> >>> +&i2c3 {
> >>> +   clock-frequency =3D <100000>;
> >>> +   pinctrl-names =3D "default";
> >>> +   pinctrl-0 =3D <&pinctrl_i2c3>;
> >>> +   status =3D "disabled";
> >>> +
> >>> +   gpio_oled: gpio@41 {
> >>> +           compatible =3D "nxp,pca9536";
> >>> +           gpio-controller;
> >>> +           #gpio-cells =3D <2>;
> >>> +           reg =3D <0x41>;
> >>> +           vcc-supply =3D <&sw2_reg>;
> >>> +           status =3D "disabled";
> >>> +   };
> >>> +
> >>> +   oled: oled@3d {
> >>> +           compatible =3D "solomon,ssd1305fb-i2c";
> >>
> >> Not documented.
> >
> > OK, I will send a separate patch for that.
>
> Rob, I double checked that and it actually is already documented.
> Not in a way that you would find the whole compatible string though..
>
> See https://elixir.bootlin.com/linux/v5.0-rc1/source/Documentation/device=
tree/bindings/display/ssd1307fb.txt#L4
>
> Are you OK with that as it is?

Ah, okay. It's fine.

Rob
