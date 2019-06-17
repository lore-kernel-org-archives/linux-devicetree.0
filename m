From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v4 4/7] regulator: qcom_spmi: Add support for PM8005
Date: Mon, 17 Jun 2019 09:17:21 -0600
Message-ID: <CAOCk7NrwYezbVyLKOZdxgGRVemKtBmHKP+fSO0a2p3bCPNdW3w@mail.gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212553.10541-1-jeffrey.l.hugo@gmail.com> <20190613212553.10541-2-jeffrey.l.hugo@gmail.com>
 <20190617150502.GU5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617150502.GU5316@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 9:05 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 13, 2019 at 02:25:53PM -0700, Jeffrey Hugo wrote:
>
> > +static int spmi_regulator_ftsmps426_set_voltage(struct regulator_dev *rdev,
> > +                                           unsigned selector)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 buf[2];
> > +     int mV;
> > +
> > +     mV = spmi_regulator_common_list_voltage(rdev, selector) / 1000;
> > +
> > +     buf[0] = mV & 0xff;
> > +     buf[1] = mV >> 8;
> > +     return spmi_vreg_write(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> > +}
>
> This could just be a set_voltage_sel(), no need for it to be a
> set_voltage() operation....

This is a set_voltage_sel() in spmi_ftsmps426_ops.  Is the issue because this
function is "spmi_regulator_ftsmps426_set_voltage" and not
"spmi_regulator_ftsmps426_set_voltage_sel"?

>
> > +static int spmi_regulator_ftsmps426_get_voltage(struct regulator_dev *rdev)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 buf[2];
> > +
> > +     spmi_vreg_read(vreg, SPMI_FTSMPS426_REG_VOLTAGE_LSB, buf, 2);
> > +
> > +     return (((unsigned int)buf[1] << 8) | (unsigned int)buf[0]) * 1000;
> > +}
>
> ...or if the conversion is this trivial why do the list_voltage() lookup
> above?

We already have code in the driver to convert a selector to the
voltage.  Why duplicate
that inline in spmi_regulator_ftsmps426_set_voltage?

>
> > +spmi_regulator_ftsmps426_set_mode(struct regulator_dev *rdev, unsigned int mode)
> > +{
> > +     struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> > +     u8 mask = SPMI_FTSMPS426_MODE_MASK;
> > +     u8 val;
> > +
> > +     switch (mode) {
> > +     case REGULATOR_MODE_NORMAL:
> > +             val = SPMI_FTSMPS426_MODE_HPM_MASK;
> > +             break;
> > +     case REGULATOR_MODE_FAST:
> > +             val = SPMI_FTSMPS426_MODE_AUTO_MASK;
> > +             break;
> > +     default:
> > +             val = SPMI_FTSMPS426_MODE_LPM_MASK;
> > +             break;
> > +     }
>
> This should validate, it shouldn't just translate invalid values into
> valid ones.

Validate what?  The other defines are REGULATOR_MODE_IDLE
and REGULATOR_MODE_STANDBY which correspond to the LPM
mode.  Or are you suggesting that regulator framework is going to pass
REGULATOR_MODE_INVALID to this operation?
