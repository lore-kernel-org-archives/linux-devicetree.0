From: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Subject: Re: [PATCHv6 10/10] arm: mvebu: add .dts file for Synology DS414
Date: Sat, 22 Nov 2014 13:10:21 +1000
Message-ID: <546FFE9D.2000502@killerwolves.net>
References: <cover.1416613429.git.arno@natisbad.org> <5b678d6d1f2f42f4bf0d087878b9d8024d463ea7.1416613429.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5b678d6d1f2f42f4bf0d087878b9d8024d463ea7.1416613429.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/11/14 09:46, Arnaud Ebalard wrote:
> +
> +	syno_id_bit0_pin: syno-id-bit0-pin {
> +		marvell,pins = "mpp26";
> +		marvell,function = "gpio";
> +	};
> +
> +	pmx_syno_id_bit1: syno-id-bit1-pin {
> +		marvell,pins = "mpp28";
> +		marvell,function = "gpio";
> +	};
> +
> +	pmx_syno_id_bit2: syno-id-bit2-pin {
> +		marvell,pins = "mpp29";
> +		marvell,function = "gpio";
> +	};
> +
> +	pmx_fan1_alarm: fan1-alarm-pin {
> +		marvell,pins = "mpp33";
> +		marvell,function = "gpio";
> +	};

It looks like you forgot to replace pmx_* with *_pin here.

> +
> +	fan2_alarm_pin: fan2-alarm-pin {
> +		marvell,pins = "mpp32";
> +		marvell,function = "gpio";
> +	};
> +};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
