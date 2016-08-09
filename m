From: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add rk3288-firefly-reload
Date: Tue, 9 Aug 2016 18:06:33 +0800
Message-ID: <C2BE77CA-A59B-4128-8802-E3E36FACDABA@rock-chips.com>
References: <1549971.ctkvOGm2xW@diego> <2868781.4x2gJCRbLH@diego> <413ebccd-e8d6-1401-3065-f9a63b4d66e6@rock-chips.com> <1815189.oGy6GHMbyM@phil> <CAFLEztQ1pa-CCbC8c8+VJ_kg8RyPOb-UHZiKBZffKEw9zyx9Zg@mail.gmail.com> <CAFLEztTROearSEcgzV3EVHFcRcMQpLhAQ6BXP-dDyRDAWybaxg@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
	charset=cp936
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLEztTROearSEcgzV3EVHFcRcMQpLhAQ6BXP-dDyRDAWybaxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?GB2312?B?s8K6wA==?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



從我的 iPad 傳送

> 陈豪 <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 於 2016年8月9日 下午6:02 寫道：
> 
> well，it has already been added....
> 
> The root cause is not act8846. Firefly have a bug with sdmmc and it
> seems they didn't fix it in firefly-reload.
> 
> http://bbs.t-firefly.com/forum.php?mod=viewthread&tid=256
Yes, Jacob is right. Those high speed options need the voltage down to 1.8v. They should be removed.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
