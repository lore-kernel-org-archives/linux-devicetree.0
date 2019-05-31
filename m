From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] ARM: dts: qcom: msm8974-hammerhead: add device
 tree bindings for vibrator
Date: Fri, 31 May 2019 12:51:38 +0200
Message-ID: <CACRpkdY-TcF7rizbPz=UcHrFvDgPJD68vbovNdcWP-aBYppp=g@mail.gmail.com>
References: <20190516085018.2207-1-masneyb@onstation.org> <20190520142149.D56DA214AE@mail.kernel.org>
 <CACRpkdZxu1LfK11OHEx5L_4kyjMZ7qERpvDzFj5u3Pk2kD1qRA@mail.gmail.com> <20190529101231.GA14540@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529101231.GA14540@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 29, 2019 at 12:12 PM Brian Masney <masneyb@onstation.org> wrote:

> My first revision of this vibrator driver used the Linux PWM framework
> due to the variable duty cycle:

So what I perceive if I get the thread right is that actually a lot of
qcom clocks (all with the M/N/D counter set-up) have variable duty
cycle. Very few consumers use that feature.

It would be a bit much to ask that they all be implemented as PWMs
and then cast into clocks for the 50/50 dutycycle case, I get that.

What about simply doing both?

Export the same clocks from the clk and pwm frameworks and be
happy. Of course with some mutex inside the driver so that it can't
be used from both ends at the same time.

Further Thierry comments
https://lore.kernel.org/lkml/20181012114749.GC31561@ulmo/

> The device itself doesn't seem to be a
> generic PWM in the way that the PWM framework
> expects it.

I don't see why.  I just look at this function from the original
patch series:

+static int msm_vibra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
+ int duty_ns, int period_ns)
+{
+ struct msm_vibra_pwm *msm_pwm = to_msm_vibra_pwm(chip);
+ int d_reg_val;
+
+ d_reg_val = 127 - (((duty_ns / 1000) * 126) / (period_ns / 1000));
+
+ msm_vibra_pwm_write(msm_pwm, REG_CFG_RCGR,
+    (2 << 12) | /* dual edge mode */
+    (0 << 8) |  /* cxo */
+    (7 << 0));
+ msm_vibra_pwm_write(msm_pwm, REG_M, 1);
+ msm_vibra_pwm_write(msm_pwm, REG_N, 128);
+ msm_vibra_pwm_write(msm_pwm, REG_D, d_reg_val);
+ msm_vibra_pwm_write(msm_pwm, REG_CMD_RCGR, 1);
+ msm_vibra_pwm_write(msm_pwm, REG_CBCR, 1);
+
+ return 0;
+}

How is this NOT a a generic PWM in the way that the PWM
framework expects it? It configures the period and duty cycle on
a square wave, that is what a generic PWM is in my book.

Yours,
Linus Walleij
