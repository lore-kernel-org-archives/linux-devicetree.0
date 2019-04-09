From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V5 4/4] rtc: imx-sc: add rtc alarm support
Date: Tue, 9 Apr 2019 03:08:37 +0000
Message-ID: <AM0PR04MB4211C3DA99287071FD102EDB802D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
References: <1552878291-22866-1-git-send-email-Anson.Huang@nxp.com>
 <1552878291-22866-4-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB4211209072B94795A6A04E9A802C0@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <DB3PR0402MB39164EEA38E9A3C239CCA221F52D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39164EEA38E9A3C239CCA221F52D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

[...]

> so I will add another API in imx-scu-irq
> driver to provide function of enabling/disabling irq, each driver can jus=
t call the
> API to enable/disable its own IRQ, ONLY need to pass the corresponding
> arguments:
>=20

That's exactly what I mean.

> >
> > > +	msg.group =3D SC_IRQ_GROUP_RTC;
> > > +	msg.mask =3D SC_IRQ_RTC;
> > > +	msg.enable =3D enable;
> > > +
> > > +	ret =3D imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
> > > +	if (ret) {
> > > +		dev_err(dev, "enable rtc irq failed, ret %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx_sc_rtc_read_alarm(struct device *dev, struct
> > > +rtc_wkalrm
> > > +*alrm) {
> > > +	return 0;
> > > +}
> >
> > Can't avoid define NULL function?
>=20
> We have to implement it as NULL function, as SCFW does NOT provide such
> feature, But rtc alarm ONLY available when .read_alarm ops is implemented=
:
>=20

If the framework mandantorily requires it, then we'd probably better to add
doc before this function and explain why it's safe to be NULL.

> 147 static ssize_t
> 148 wakealarm_store(struct device *dev, struct device_attribute *attr,
> 149                 const char *buf, size_t n)
> 150 {
>=20
> ...
>=20
> 187                 retval =3D rtc_read_alarm(rtc, &alm);
> 188                 if (retval < 0)
> 189                         return retval;
>=20
>=20
> >
> > > +
> > > +static int imx_sc_rtc_set_alarm(struct device *dev, struct
> > > +rtc_wkalrm
> > > +*alrm) {
> > > +	struct imx_sc_msg_timer_rtc_set_alarm msg;
> > > +	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
> > > +	int ret;
> > > +	struct rtc_time *alrm_tm =3D &alrm->time;
> > > +
> > > +	hdr->ver =3D IMX_SC_RPC_VERSION;
> > > +	hdr->svc =3D IMX_SC_RPC_SVC_TIMER;
> > > +	hdr->func =3D IMX_SC_TIMER_FUNC_SET_RTC_ALARM;
> > > +	hdr->size =3D 3;
> > > +
> > > +	msg.year =3D alrm_tm->tm_year + 1900;
> > > +	msg.mon =3D alrm_tm->tm_mon + 1;
> > > +	msg.day =3D alrm_tm->tm_mday;
> > > +	msg.hour =3D alrm_tm->tm_hour;
> > > +	msg.min =3D alrm_tm->tm_min;
> > > +	msg.sec =3D alrm_tm->tm_sec;
> > > +
> > > +	ret =3D imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
> > > +	if (ret) {
> > > +		dev_err(dev, "set rtc alarm failed, ret %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret =3D imx_sc_rtc_alarm_irq_enable(dev, alrm->enabled);
> >
> > Just curious we already have .alarm_irq_enable().
> > Why do we need call it again here?
>=20
> That is because the  set_alarm function  pass alarm time and alarm->enabl=
ed
> argument, it could be to enable alarm or to disable alarm, so we have to
> control the alarm function here, all other rtc drivers also do it this wa=
y.
> The .alarm_irq_enable() callback is for just enable or disable alarm.
>=20

Got it, thanks for the explanation.

Regards
Dong Aisheng

> Thanks,
> Anson
>=20
>=20
> >
> > Regards
> > Dong Aisheng
> >
> > > +	if (ret) {
> > > +		dev_err(dev, "enable rtc alarm failed, ret %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static const struct rtc_class_ops imx_sc_rtc_ops =3D {
> > >  	.read_time =3D imx_sc_rtc_read_time,
> > >  	.set_time =3D imx_sc_rtc_set_time,
> > > +	.read_alarm =3D imx_sc_rtc_read_alarm,
> > > +	.set_alarm =3D imx_sc_rtc_set_alarm,
> > > +	.alarm_irq_enable =3D imx_sc_rtc_alarm_irq_enable, };
> > > +
> > > +static int imx_sc_rtc_alarm_sc_notify(struct notifier_block *nb,
> > > +					unsigned long event, void *group) {
> > > +	/* ignore non-rtc irq */
> > > +	if (!((event & SC_IRQ_RTC) && (*(u8 *)group =3D=3D
> > SC_IRQ_GROUP_RTC)))
> > > +		return 0;
> > > +
> > > +	rtc_update_irq(imx_sc_rtc, 1, RTC_IRQF | RTC_AF);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static struct notifier_block imx_sc_rtc_alarm_sc_notifier =3D {
> > > +	.notifier_call =3D imx_sc_rtc_alarm_sc_notify,
> > >  };
> > >
> > >  static int imx_sc_rtc_probe(struct platform_device *pdev) @@ -73,6
> > > +181,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > +	device_init_wakeup(&pdev->dev, true);
> > > +
> > >  	imx_sc_rtc =3D devm_rtc_allocate_device(&pdev->dev);
> > >  	if (IS_ERR(imx_sc_rtc))
> > >  		return PTR_ERR(imx_sc_rtc);
> > > @@ -87,6 +197,8 @@ static int imx_sc_rtc_probe(struct
> > > platform_device
> > > *pdev)
> > >  		return ret;
> > >  	}
> > >
> > > +	imx_scu_irq_register_notifier(&imx_sc_rtc_alarm_sc_notifier);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > --
> > > 2.7.4
