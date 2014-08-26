From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/5] MFD: RK808: Add new mfd driver for RK808
Date: Tue, 26 Aug 2014 12:20:13 +0100
Message-ID: <20140826112013.GK9574@lee--X1>
References: <1408505461-24200-1-git-send-email-zyw@rock-chips.com>
 <20140820092117.GI4266@lee--X1>
 <53FA9D1E.8040202@rock-chips.com>
 <20140826092205.GG9574@lee--X1>
 <53FC5BD1.7030406@rock-chips.com>
 <20140826102036.GJ9574@lee--X1>
 <53FC63EE.6060104@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53FC63EE.6060104-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Aug 2014, Chris Zhong wrote:
> On 08/26/2014 06:20 PM, Lee Jones wrote:
> >On Tue, 26 Aug 2014, Chris Zhong wrote:
> >>On 08/26/2014 05:22 PM, Lee Jones wrote:
> >>>On Mon, 25 Aug 2014, Chris Zhong wrote:
> >>>>On 08/20/2014 05:21 PM, Lee Jones wrote:
> >>>>>On Wed, 20 Aug 2014, Chris Zhong wrote:
> >>>>>
> >>>>>>The RK808 chip is a power management IC for multimedia and hand=
held
> >>>>>>devices. It contains the following components:
> >>>>>>
> >>>>>>- Regulators
> >>>>>>- RTC
> >>>>>>
> >>>>>>The rk808 core driver is registered as a platform driver and pr=
ovides
> >>>>>>communication through I2C with the host device for the differen=
t
> >>>>>>components.
> >>>>>>
> >>>>>>Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >>>>>>---
> >>>[...]
> >>>
> >>>>>>+	rk808->pdata =3D pdata;
> >>>>>Remove pdata from 'struct rk808'.  You can obtain it from dev.
> >>>>Can I keep this pdata in rk808, because it is used in the regulat=
or driver.
> >>>>The one obtain from dev maybe empty.
> >>>If the one in dev is empty, you should populate that instead.
> >>So, should I malloc a pada, and assign it to client->dev?
> >If client->dev.pdata is NULL, yes.
> >
> >But actually, I have more important questions that need to be answer=
ed
> >first.  Ones which I would normally be able to answer myself if the
> >patch-set had been sent as one (i.e. threaded) instead of as
> >individual patches:
> >
> >- What are you using pdata for?
>=20
> For save some properties,
>=20
> like "rockchip,system-power-controller" in MFD
> and some regulator properties in regulator/rk808...
>=20
> >- Where is pdata populated?
>=20
> It is populated in probe in mfd/rk808.c
>=20
> actually, I copy it from tps65910.c
>=20
>=20
> >- Where is pdata used?
>=20
> pdata is used in mfd and regulator

I'm still a little confused.  I see it being populated in the MFD
driver, then I only see the attributes populated in the MFD driver
used in the MFD driver and nowhere else?  I do see other attributes
used in the regulator driver i.e. .of_node[], but these are then used
only in the regulator driver, thus they shouldn't really be pdata.

Let me put it another way:

struct rk808_board {
+       int irq;
+       int irq_base;
+       int wakeup;
+       bool pm_off;
+       struct regulator_init_data *rk808_init_data[rk808_NUM_REGULATOR=
S];
+       struct device_node *of_node[rk808_NUM_REGULATORS];
+       int pmic_sleep_gpio;
+       unsigned int dcdc_slp_voltage[3]; /* buckx_voltage in uV */
+       unsigned int ldo_slp_voltage[7];
+};

=46or each of the above:

- Can it be passed from platform data i.e. arch/<arch>/{plat,mach}-*?
- Can it use local (not passed from driver to driver) variable instead?

If the answer to the first question is 'no' and/or if the answer to
the second question is 'yes', then it shouldn't be platform data.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
