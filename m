From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 13:23:04 +0100
Message-ID: <20140826122304.GA26707@lee--X1>
References: <1408505461-24200-1-git-send-email-zyw@rock-chips.com>
 <20140820092117.GI4266@lee--X1>
 <53FA9D1E.8040202@rock-chips.com>
 <20140826092205.GG9574@lee--X1>
 <53FC5BD1.7030406@rock-chips.com>
 <20140826102036.GJ9574@lee--X1>
 <53FC63EE.6060104@rock-chips.com>
 <20140826112013.GK9574@lee--X1>
 <53FC77F0.4030004@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53FC77F0.4030004@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it, mturquette@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, grant.likely@linaro.org, hl@rock-chips.com, huangtao@rock-chips.com, cf@rock-chips.com, zhangqing@rock-chips.com, xxx@rock-chips.com, dianders@chromium.org, heiko@sntech.de, olof@lixom.net, sonnyrao@chromium.org, dtor@chromium.org, javier.martinez@collabora.co.uk, kever.yang@rock-chips.com
List-Id: devicetree@vger.kernel.org

On Tue, 26 Aug 2014, Chris Zhong wrote:
> On 08/26/2014 07:20 PM, Lee Jones wrote:
> >On Tue, 26 Aug 2014, Chris Zhong wrote:
> >>On 08/26/2014 06:20 PM, Lee Jones wrote:
> >>>On Tue, 26 Aug 2014, Chris Zhong wrote:
> >>>>On 08/26/2014 05:22 PM, Lee Jones wrote:
> >>>>>On Mon, 25 Aug 2014, Chris Zhong wrote:
> >>>>>>On 08/20/2014 05:21 PM, Lee Jones wrote:
> >>>>>>>On Wed, 20 Aug 2014, Chris Zhong wrote:
> >>>>>>>
> >>>>>>>>The RK808 chip is a power management IC for multimedia and ha=
ndheld
> >>>>>>>>devices. It contains the following components:
> >>>>>>>>
> >>>>>>>>- Regulators
> >>>>>>>>- RTC
> >>>>>>>>
> >>>>>>>>The rk808 core driver is registered as a platform driver and =
provides
> >>>>>>>>communication through I2C with the host device for the differ=
ent
> >>>>>>>>components.
> >>>>>>>>
> >>>>>>>>Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> >>>>>>>>---
> >>>>>[...]
> >>>>>
> >>>>>>>>+	rk808->pdata =3D pdata;
> >>>>>>>Remove pdata from 'struct rk808'.  You can obtain it from dev.
> >>>>>>Can I keep this pdata in rk808, because it is used in the regul=
ator driver.
> >>>>>>The one obtain from dev maybe empty.
> >>>>>If the one in dev is empty, you should populate that instead.
> >>>>So, should I malloc a pada, and assign it to client->dev?
> >>>If client->dev.pdata is NULL, yes.
> >>>
> >>>But actually, I have more important questions that need to be answ=
ered
> >>>first.  Ones which I would normally be able to answer myself if th=
e
> >>>patch-set had been sent as one (i.e. threaded) instead of as
> >>>individual patches:
> >>>
> >>>- What are you using pdata for?
> >>For save some properties,
> >>
> >>like "rockchip,system-power-controller" in MFD
> >>and some regulator properties in regulator/rk808...
> >>
> >>>- Where is pdata populated?
> >>It is populated in probe in mfd/rk808.c
> >>
> >>actually, I copy it from tps65910.c
> >>
> >>
> >>>- Where is pdata used?
> >>pdata is used in mfd and regulator
> >I'm still a little confused.  I see it being populated in the MFD
> >driver, then I only see the attributes populated in the MFD driver
> >used in the MFD driver and nowhere else?  I do see other attributes
> >used in the regulator driver i.e. .of_node[], but these are then use=
d
> >only in the regulator driver, thus they shouldn't really be pdata.
> >
> >Let me put it another way:
> >
> >struct rk808_board {
> >+       int irq;
> >+       int irq_base;
> >+       int wakeup;
> >+       bool pm_off;
> >+       struct regulator_init_data *rk808_init_data[rk808_NUM_REGULA=
TORS];
> >+       struct device_node *of_node[rk808_NUM_REGULATORS];
> >+       int pmic_sleep_gpio;
> >+       unsigned int dcdc_slp_voltage[3]; /* buckx_voltage in uV */
> >+       unsigned int ldo_slp_voltage[7];
> >+};
> >
> >For each of the above:
> >
> >- Can it be passed from platform data i.e. arch/<arch>/{plat,mach}-*=
?
> >- Can it use local (not passed from driver to driver) variable inste=
ad?
> >
> >If the answer to the first question is 'no' and/or if the answer to
> >the second question is 'yes', then it shouldn't be platform data.
>=20
> Yes, if we have no dts file, these value can pass from mach-rk***.
>=20
> It can be filled with all user setting of rk808, in a struct.
>=20
> the latest struct is:
>=20
> struct rk808_board {
>=20
>     int wakeup;
>=20
>     bool pm_off;
>=20
>     struct regulator_init_data *rk808_init_data[RK808_NUM_REGULATORS]=
;
>=20
>     struct device_node *of_node[RK808_NUM_REGULATORS];
>=20
>     unsigned int dcdc_slp_voltage[3]; /* buckx_voltage in uV */
>=20
>     unsigned int ldo_slp_voltage[7];
>=20
> };

This version looks much more acceptable.

Although, I am concerned about of_node[].  Isn't that only populated
and used in the regulator driver?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
