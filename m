From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 11:21:13 +0100
Message-ID: <e7483b9c-4e1e-47ff-d044-fd4853b96e94@gmail.com>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <20180214060547.bf6upib2mbgoexas@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180214060547.bf6upib2mbgoexas@katana>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/14/2018 07:05 AM, Wolfram Sang wrote:
>> +	chosen {
>> +		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
>> +		stdout-path = "serial0:38400n8";
> 
> Hmm, that would be our first board to not have 115200, or? We already
> have some other boards upstream where UBoot has 38400 and Linux 115200.
> I'd prefer consistency here a little, but no strong opinion and asking
> for other opinions.

The vendoruboot is wired to 38400 (sigh), I'm planning to set mainline
uboot to 115200 though.

>> +	vcc_sdhi0: regulator-vcc-sdhi0 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "SDHI0 Vcc";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&gpio5 24 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
> 
> Just double checking: No 1.8V for SDR50/104?

Nope, the SD card slot is hard-wired to 3V3.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
