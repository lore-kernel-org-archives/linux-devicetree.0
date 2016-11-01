From: Noam Camus <noamca-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v3 2/3] clocksource: update "fn" at
 CLOCKSOURCE_OF_DECLARE() of nps400 timer
Date: Tue, 1 Nov 2016 09:07:38 +0000
Message-ID: <DB6PR0501MB251840D45FC427B1A7B7572AAAA10@DB6PR0501MB2518.eurprd05.prod.outlook.com>
References: <1477899468-5494-1-git-send-email-noamca@mellanox.com>
 <1477899468-5494-3-git-send-email-noamca@mellanox.com>
 <alpine.DEB.2.20.1610311137290.8160@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.20.1610311137290.8160@nanos>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Thomas Gleixner [mailto:tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org]=20
> Sent: Monday, October 31, 2016 7:40 PM

>> =20
>>  static unsigned long nps_timer_rate;
>> +static int nps_get_timer_clk(struct device_node *node,
>
>Please don't glue variables and functions together w/o a new line. That's =
horrible to read.
Will be fixed in V4

>> +static int __init nps_setup_clocksource(struct device_node *node)
>>  {
>>  	int ret, cluster;
>> +	struct clk *clk;
>> =20
>>  	for (cluster =3D 0; cluster < NPS_CLUSTER_NUM; cluster++)
>>  		nps_msu_reg_low_addr[cluster] =3D
>>  			nps_host_reg((cluster << NPS_CLUSTER_OFFSET),
>>  				 NPS_MSU_BLKID, NPS_MSU_TICK_LOW);
>> =20
>> -	ret =3D clk_prepare_enable(clk);
>> -	if (ret) {
>> -		pr_err("Couldn't enable parent clock\n");
>> -		return ret;
>> -	}
>> -
>> -	nps_timer_rate =3D clk_get_rate(clk);
>> +	nps_get_timer_clk(node, &nps_timer_rate, clk);

>Why are you ignoring the return code? It was handled before your change ..=
.
Will be fixed in V4

Regards,
Noam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
