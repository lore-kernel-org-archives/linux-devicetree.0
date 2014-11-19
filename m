From: arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org (Arnaud Ebalard)
Subject: Re: [PATCHv4 04/10] arm: mvebu: move Armada 370/XP pinctrl node definition armada-370-xp.dtsi
Date: Wed, 19 Nov 2014 09:35:49 +0100
Message-ID: <87lhn7vb8a.fsf@natisbad.org>
References: <cover.1416351425.git.arno@natisbad.org>
	<f4b15c942f543b0c0becd7c82bce07e9e0b603cf.1416351426.git.arno@natisbad.org>
	<20141119080323.GS27002@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141119080323.GS27002-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> ("Uwe \=\?utf-8\?Q\?Klein\?\=
 \=\?utf-8\?Q\?e-K\=C3\=B6nig\=22's\?\=
	message of "Wed, 19 Nov 2014 09:03:23 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Uwe,

Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:

> On Wed, Nov 19, 2014 at 12:02:11AM +0100, Arnaud Ebalard wrote:
>> +
>> +	sdio_pins: sdio-pins {
>> +		marvell,pins =3D "mpp30", "mpp31", "mpp32",
>> +			       "mpp33", "mpp34", "mpp35";
>> +		marvell,function =3D "sd0";
>> +	};
>> +};
>> \ No newline at end of file
> IMHO you should add this \n at the end.

Ack. I'll fix that in v5.

a+
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
