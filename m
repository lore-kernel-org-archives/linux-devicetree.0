From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Date: Wed, 22 May 2019 04:23:48 -0400
Message-ID: <20190522082348.GA15793@basecamp>
References: <20190516085018.2207-1-masneyb@onstation.org>
 <20190520142149.D56DA214AE@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190520142149.D56DA214AE@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, May 20, 2019 at 07:21:49AM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2019-05-16 01:50:18)
> > @@ -306,6 +307,36 @@
> >                                 input-enable;
> >                         };
> >                 };
> > +
> > +               vibrator_pin: vibrator {
> > +                       pwm {
> > +                               pins = "gpio27";
> > +                               function = "gp1_clk";
> > +
> > +                               drive-strength = <6>;
> > +                               bias-disable;
> > +                       };
> > +
> > +                       enable {
> > +                               pins = "gpio60";
> > +                               function = "gpio";
> > +                       };
> > +               };
> > +       };
> > +
> > +       vibrator@fd8c3450 {
> > +               compatible = "qcom,msm8974-vibrator";
> > +               reg = <0xfd8c3450 0x400>;
> 
> This is inside the multimedia clk controller. The resource reservation
> mechanism should be complaining loudly here. Is the driver writing
> directly into clk controller registers to adjust a duty cycle of the
> camera's general purpose clk?
> 
> Can you add support for duty cycle to the qcom clk driver's RCGs and
> then write a generic clk duty cycle vibrator driver that adjusts the
> duty cycle of the clk? That would be better than reaching into the clk
> controller registers to do this.

I don't see any complaints in dmesg about this, however I'll work on a
new clk duty cycle vibrator driver.

Brian
