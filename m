From: Noam Camus <noamca@mellanox.com>
Subject: RE: [PATCH v2 2/3] clocksource: update "fn" at
 CLOCKSOURCE_OF_DECLARE() of nps400 timer
Date: Mon, 31 Oct 2016 15:19:15 +0000
Message-ID: <DB6PR0501MB251813BC85607D91B0847D53AAAE0@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477224748-25223-1-git-send-email-noamca@mellanox.com>
 <1477224748-25223-3-git-send-email-noamca@mellanox.com>
 <20161031102814.GC1506@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161031102814.GC1506@mai>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]=20
> Sent: Monday, October 31, 2016 12:28 PM

>> From: Noam Camus <noamca@mellanox.com>
>>=20
>> nps_setup_clocksource() should take node as only argument i.e.:
>> replace
>> int __init nps_setup_clocksource(struct device_node *node, struct clk=20
>> *clk) with int __init nps_setup_clocksource(struct device_node *node)
>>=20
>> This is also serve as preperation for next patch which adds support
>
>s/preperation/preparation/
Thanks, will fix in V4 of this patch set
...

>> +static int nps_get_timer_clk(struct device_node *node,
>> +			     unsigned long *timer_freq,
>> +			     struct clk *clk)
>
>This function prototype does not make sense. A pointer to a clock is passe=
d for nothing here.
Thanks, I passed *clk in order for one to do rollback on error (pass clk to=
 clk_disable_unprepare).
I will change prototype to **clk.

>> +{
>> +	int ret;
>> +
>> +	clk =3D of_clk_get(node, 0);
>> +	if (IS_ERR(clk)) {
>> +		pr_err("timer missing clk");
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	ret =3D clk_prepare_enable(clk);
>> +	if (ret) {
>> +		pr_err("Couldn't enable parent clk\n");
>> +		return ret;
>> +	}
>> +
>> +	*timer_freq =3D clk_get_rate(clk);
>> +
>
>	timer_freq check.
>
>	rollback on error.
Thanks, will fix at V4

...
>> -	if (ret) {
>> -		pr_err("Couldn't enable parent clock\n");
>> -		return ret;
>> -	}
>> -
>> -	nps_timer_rate =3D clk_get_rate(clk);
>> +	nps_get_timer_clk(node, &nps_timer_rate, clk);

>Return code check ?
Thanks, will fix at V4
 =20
-Noam
