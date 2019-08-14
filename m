From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 01/22] arm64: dts: qcom: sm8150: add base dts file
Date: Wed, 14 Aug 2019 11:35:51 -0700
Message-ID: <20190814183552.5FF062133F@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-2-vkoul@kernel.org> <20190814165855.098FD2063F@mail.kernel.org> <20190814174439.GE6167@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814174439.GE6167@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Bjorn Andersson (2019-08-14 10:44:39)
> On Wed 14 Aug 09:58 PDT 2019, Stephen Boyd wrote:
>=20
> > Quoting Vinod Koul (2019-08-14 05:49:51)
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/d=
ts/qcom/sm8150.dtsi
> [..]
> > > +       clocks {
> > > +               xo_board: xo-board {
> > > +                       compatible =3D "fixed-clock";
> > > +                       #clock-cells =3D <0>;
> > > +                       clock-frequency =3D <19200000>;
> >=20
> > Is it 19.2 or 38.4 MHz? It seems like lately there are dividers, but I
> > guess it doesn't really matter in the end.
> >=20
>=20
> As with previous platforms, the board's XO feeds the PMIC at 38.4MHz and
> the SoC's CXO_IN pin (i.e. bi_tcxo) is fed from the PMIC's LNBBCLK1,
> which is ticking at 19.2MHz.
>=20
> [..]
> > > +               gcc: clock-controller@100000 {
> > > +                       compatible =3D "qcom,gcc-sm8150";
> > > +                       reg =3D <0x00100000 0x1f0000>;
> > > +                       #clock-cells =3D <1>;
> > > +                       #reset-cells =3D <1>;
> > > +                       #power-domain-cells =3D <1>;
> > > +                       clock-names =3D "bi_tcxo", "sleep_clk";
> > > +                       clocks =3D <&xo_board>, <&sleep_clk>;
>=20
> So this first one should actually be <&rpmhcc LNBBCLK1>.

Hrmm LNBBCLK1 doesn't make any sense to me. That's a buffer that is
technically the net connected to the XO pin on the Soc, but it isn't
really supposed to be used by anything from what I recall. Last time I
tried to use the buffers the RPM team told me I was using the wrong
resource and I should just use the XO resource instead. Doesn't RPMh
expose the other "XO" resource that is supposed to prevent XO shutdown?
Just mark it critical for now so that XO isn't turned off at runtime.

>=20
> But while we now should handle this gracefully in the clock driver I
> think we still have problems with the cascading probe deferral that
> follows - last time I tried to do this the serial driver probe deferred
> past user space initialization and the system crashed as we didn't have
> a /dev/console.

Does the serial driver probe eventually? Maybe you can run agetty when
the device appears based on some uevent for /dev/console. Or we have a
bug where /dev/console is created by devtmpfs when there isn't actually
a console?

>=20
>=20
> So, I think we should s/xo_board/lnbbclk1/ (at 19.2MHz) to make it
> represent the schematics and then once we have rpmhcc and validated that
> the system handles this gracefully we can switch it out.
>=20

Sure, some sort of approach that switches it later on is fine, just want
to make sure that the board clk frequency is accurately reflected in the
DT.
