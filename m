From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device tree bindings for vibrator
Date: Thu, 27 Jun 2019 16:49:28 -0700
Message-ID: <20190627234929.B78E520815@mail.kernel.org>
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org> <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com> <20190529101231.GA14540@basecamp> <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com> <20190623105332.GA25506@onstation.org> <CACRpkdYTaM+sBs-bhaXVtAwFtp6+_PWWJ_k9jobd7qB41HubDg@mail.gmail.com> <20190625005434.GA6401@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625005434.GA6401@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-06-24 17:54:34)
> On Tue, Jun 25, 2019 at 12:29:29AM +0200, Linus Walleij wrote:
> > On Sun, Jun 23, 2019 at 12:53 PM Brian Masney <masneyb@onstation.org> w=
rote:
> >=20
> > > 2) Do what Linus suggests above. We can use v1 of this series from la=
st
> > >    September (see below for link) that adds this to the pwm subsystem.
> > >    The locking would need to be added so that it won't conflict with =
the
> > >    clk subsystem. This can be tied into the input subsystem with the
> > >    existing pwm-vibra driver.
> >=20
> > What I imagined was that the clk driver would double as a pwm driver.
> > Just register both interfaces.
> >=20
> > There are already plenty of combines clk+reset drivers for example.
> >=20
> > Otherwise I'm all for this approach (but that's just me).
>=20
> I agree that this makes sense. I especially like that it'll allow us
> to use the existing pwm-vibra driver in the input subsystem with this
> approach.
>=20

This whole discussion is ignoring that clk_set_duty_cycle() exists.
Maybe you can look back on the history of why the duty cycle API was
added to the clk framework to make a strong argument for the replacement
of this API with your proposal of registering to two different
frameworks instead?

Here's the first few parts of the commit text of 9fba738a53dd ("clk: add
duty cycle support"):

    Add the possibility to apply and query the clock signal duty cycle rati=
o.

    This is useful when the duty cycle of the clock signal depends on some
    other parameters controlled by the clock framework.

    For example, the duty cycle of a divider may depends on the raw divider
    setting (ratio =3D N / div) , which is controlled by the CCF. In such c=
ase,
    going through the pwm framework to control the duty cycle ratio of this
    clock would be a burden.

In the case of qcom clks, I seem to recall the frequency of the clk
depends on the duty cycle settings. The duty cycle is constrained by the
M/N values which determine the frequency of the clk after it's
pre-divided. We did some sort of bit trick to set the duty cycle to the
N value inverted or something so that we always got 50% duty cycle.
