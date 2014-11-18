From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 4/5] rtc: s5m: Add the support for S2MPS13 RTC
Date: Tue, 18 Nov 2014 11:01:53 +0100
Message-ID: <1416304913.1301.4.camel@AMDC1943>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-5-git-send-email-cw00.choi@samsung.com>
 <5469CBB0.5070704@samsung.com> <546A9D7D.7040207@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <546A9D7D.7040207-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On wto, 2014-11-18 at 10:14 +0900, Chanwoo Choi wrote:
> Hi Krzysztof,
>=20
> On 11/17/2014 07:19 PM, Krzysztof Koz=C5=82owski wrote:
> > On 17.11.2014 01:42, Chanwoo Choi wrote:
> >> This patch adds only the compatible string for S2MPS13 clock which=
 is identical
> >> with S2MPS14 clock driver.
> >>
> >> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> >> Signed-off-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> ---
> >>  drivers/rtc/rtc-s5m.c | 15 ++++++++++++++-
> >>  1 file changed, 14 insertions(+), 1 deletion(-)
> >=20
> > The RTC block looks exactly the same as S2MPS14. I wonder can S2MPS=
13 be
> > supported without adding all "+ case S2MPS13X:" here? Maybe pass th=
e
> > same ID in s5m_rtc_id? This would reduce number of changes to only =
one line.
>=20
> I tried to use S2MPS14x type without adding S2MPS13X.
> But, there are two method to probe RTC driver probe.
> First, as you comment, use s5m_rtc_id (in drivers/rtc/rtc-s5m.c) to p=
robe S2MPS13 RTC.
> Second, register mfd devcies for s2mps13 RTC(in drivers/mfd/sec-core.=
c) to probe S2MPS13 RTC.
>=20
> We could support S2MPS13 RTC to modify s5m_rtc_id table in first case=
 as you comment,
> But, We could not support S2MPS13 RTC in second case because S2MPS13 =
is different from S2MPS14
> and S2MPS13 must have other type form existing S2MPS14x type.

OK, I'm fine with that. The patch looks good so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof

>=20
> Best Regards,
> Chanwoo Choi
>=20
> >=20
> > Best regards,
> > Krzysztof
> >=20
> >=20
> >>
> >> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
> >> index 8754c33..e5fdfd3 100644
> >> --- a/drivers/rtc/rtc-s5m.c
> >> +++ b/drivers/rtc/rtc-s5m.c
> >> @@ -191,6 +191,7 @@ static inline int s5m_check_peding_alarm_inter=
rupt(struct s5m_rtc_info *info,
> >>  		ret =3D regmap_read(info->regmap, S5M_RTC_STATUS, &val);
> >>  		val &=3D S5M_ALARM0_STATUS;
> >>  		break;
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		ret =3D regmap_read(info->s5m87xx->regmap_pmic, S2MPS14_REG_ST2=
,
> >>  				&val);
> >> @@ -254,6 +255,7 @@ static inline int s5m8767_rtc_set_alarm_reg(st=
ruct s5m_rtc_info *info)
> >>  	case S5M8767X:
> >>  		data &=3D ~S5M_RTC_TIME_EN_MASK;
> >>  		break;
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		data |=3D S2MPS_RTC_RUDR_MASK;
> >>  		break;
> >> @@ -311,7 +313,9 @@ static int s5m_rtc_read_time(struct device *de=
v, struct rtc_time *tm)
> >>  	u8 data[info->regs->regs_count];
> >>  	int ret;
> >> =20
> >> -	if (info->device_type =3D=3D S2MPS14X) {
> >> +	switch (info->device_type) {
> >> +	case S2MPS13X:
> >> +	case S2MPS14X:
> >>  		ret =3D regmap_update_bits(info->regmap,
> >>  				info->regs->rtc_udr_update,
> >>  				S2MPS_RTC_RUDR_MASK, S2MPS_RTC_RUDR_MASK);
> >> @@ -333,6 +337,7 @@ static int s5m_rtc_read_time(struct device *de=
v, struct rtc_time *tm)
> >>  		break;
> >> =20
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		s5m8767_data_to_tm(data, tm, info->rtc_24hr_mode);
> >>  		break;
> >> @@ -359,6 +364,7 @@ static int s5m_rtc_set_time(struct device *dev=
, struct rtc_time *tm)
> >>  		s5m8763_tm_to_data(tm, data);
> >>  		break;
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		ret =3D s5m8767_tm_to_data(tm, data);
> >>  		break;
> >> @@ -406,6 +412,7 @@ static int s5m_rtc_read_alarm(struct device *d=
ev, struct rtc_wkalrm *alrm)
> >>  		break;
> >> =20
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		s5m8767_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
> >>  		alrm->enabled =3D 0;
> >> @@ -454,6 +461,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_i=
nfo *info)
> >>  		break;
> >> =20
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		for (i =3D 0; i < info->regs->regs_count; i++)
> >>  			data[i] &=3D ~ALARM_ENABLE_MASK;
> >> @@ -498,6 +506,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_=
info *info)
> >>  		break;
> >> =20
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		data[RTC_SEC] |=3D ALARM_ENABLE_MASK;
> >>  		data[RTC_MIN] |=3D ALARM_ENABLE_MASK;
> >> @@ -537,6 +546,7 @@ static int s5m_rtc_set_alarm(struct device *de=
v, struct rtc_wkalrm *alrm)
> >>  		break;
> >> =20
> >>  	case S5M8767X:
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		s5m8767_tm_to_data(&alrm->time, data);
> >>  		break;
> >> @@ -641,6 +651,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc=
_info *info)
> >>  		ret =3D regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2=
);
> >>  		break;
> >> =20
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		data[0] =3D (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
> >>  		ret =3D regmap_write(info->regmap, info->regs->ctrl, data[0]);
> >> @@ -678,6 +689,7 @@ static int s5m_rtc_probe(struct platform_devic=
e *pdev)
> >>  		return -ENOMEM;
> >> =20
> >>  	switch (pdata->device_type) {
> >> +	case S2MPS13X:
> >>  	case S2MPS14X:
> >>  		regmap_cfg =3D &s2mps14_rtc_regmap_config;
> >>  		info->regs =3D &s2mps_rtc_regs;
> >> @@ -831,6 +843,7 @@ static SIMPLE_DEV_PM_OPS(s5m_rtc_pm_ops, s5m_r=
tc_suspend, s5m_rtc_resume);
> >> =20
> >>  static const struct platform_device_id s5m_rtc_id[] =3D {
> >>  	{ "s5m-rtc",		S5M8767X },
> >> +	{ "s2mps13-rtc",	S2MPS13X },
> >>  	{ "s2mps14-rtc",	S2MPS14X },
> >>  };
> >> =20
> >>
> >=20
> >=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
