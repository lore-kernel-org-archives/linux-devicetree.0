From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device tree bindings for vibrator
Date: Thu, 23 May 2019 18:20:17 -0700
Message-ID: <20190524012018.1D61B217F9@mail.kernel.org>
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org> <20190522082348.GA15793@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522082348.GA15793@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-05-22 01:23:48)
> On Mon, May 20, 2019 at 07:21:49AM -0700, Stephen Boyd wrote:
> >=20
> > This is inside the multimedia clk controller. The resource reservation
> > mechanism should be complaining loudly here. Is the driver writing
> > directly into clk controller registers to adjust a duty cycle of the
> > camera's general purpose clk?
> >=20
> > Can you add support for duty cycle to the qcom clk driver's RCGs and
> > then write a generic clk duty cycle vibrator driver that adjusts the
> > duty cycle of the clk? That would be better than reaching into the clk
> > controller registers to do this.
>=20
> I don't see any complaints in dmesg about this, however I'll work on a
> new clk duty cycle vibrator driver.
>=20

Ok. Probably no warning because the vibrator driver just creates the io
mapping without trying to reserve it with the io requesting APIs.
