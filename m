From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add rk3288-firefly-reload
Date: Tue, 09 Aug 2016 12:58:49 +0200
Message-ID: <13761657.UM4fvlJBBq@diego>
References: <1549971.ctkvOGm2xW@diego> <CAFLEztTROearSEcgzV3EVHFcRcMQpLhAQ6BXP-dDyRDAWybaxg@mail.gmail.com> <C2BE77CA-A59B-4128-8802-E3E36FACDABA@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C2BE77CA-A59B-4128-8802-E3E36FACDABA-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: =?utf-8?B?6ZmI6LGq?= <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 9. August 2016, 18:06:33 schrieb Randy Li:
> 從我的 iPad 傳送
> 
> > 陈豪 <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 於 2016年8月9日 下午6:02 寫道：
> > 
> > well，it has already been added....
> > 
> > The root cause is not act8846. Firefly have a bug with sdmmc and it
> > seems they didn't fix it in firefly-reload.
> > 
> > http://bbs.t-firefly.com/forum.php?mod=viewthread&tid=256

Thanks Jacob for pointing out this issue - I was always wondering why it 
wasn't working :-) .


> Yes, Jacob is right. Those high speed options need the voltage down to 1.8v.
> They should be removed.

Randy, can you provide a follow-up patch that removes these excess properties 
please?


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
