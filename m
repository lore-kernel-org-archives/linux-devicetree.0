From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 07/15] ndings: clock: milbeaut: add Milbeaut clock description
Date: Wed, 13 Feb 2019 10:07:55 -0800
Message-ID: <155008127539.115909.8938099989804942@swboyd.mtv.corp.google.com>
References: <1549628823-31388-1-git-send-email-sugaya.taichi@socionext.com> <155008053444.115909.15767350529461671558@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155008053444.115909.15767350529461671558@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Sugaya Taichi <sugaya.taichi@socionext.com>, Michael Turquette <mturquette@baylibre.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2019-02-13 09:55:34)
> The subject seems to have been cut off? "ndings"?
>=20
> Quoting Sugaya Taichi (2019-02-08 04:27:03)
> > diff --git a/Documentation/devicetree/bindings/clock/milbeaut-clock.txt=
 b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
> > new file mode 100644
> > index 0000000..bcfc5df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/milbeaut-clock.txt
> > @@ -0,0 +1,49 @@
> > +Milbeaut SoCs Clock Controller Binding
> > +----------------------------------------
> > +Milbeaut SoCs Clock controller is an integrated clock controller, which
> > +generates and supplies to all modules.
> > +
> > +This binding uses common clock bindings
> > +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +
> > +Required properties:
> > +- compatible: should be one of the following:
> > +    "socionext,milbeaut-m10v-ccu" - for M10V SoC
> > +- reg: shall contain base address and length of clock registers
> > +- #clock-cells: shall be 1
> > +- clocks: shall be an external clock
> > +
> > +Example: Clock controller node:
> > +
> > +       clk: m10v-clk-ctrl@1d021000 {
> > +               compatible =3D "socionext,milbeaut-m10v-clk-ccu";
>=20
> I thought there was some length limit on compatible string names. 32
> bytes? Just barely under!
>=20

Ah I'm wrong. Compatible is 128. Good.

Seems I was thinking of DT property names.
