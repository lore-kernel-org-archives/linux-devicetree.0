From: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/5] arm64: dts: rockchip: Add rk3399 vop and display-subsystem
Date: Mon, 17 Jul 2017 11:44:51 +0800
Message-ID: <CAFLEztTAa8jPMNYO8iAgybGFTerCDBqwLUrjbKOfFqEE++oXhw@mail.gmail.com>
References: <1499875435-23944-1-git-send-email-jacob-chen@iotwrt.com>
 <1499875435-23944-2-git-send-email-jacob-chen@iotwrt.com> <71446982.CYE3jZejiS@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <71446982.CYE3jZejiS@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, long jacob <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi heko,

2017-07-17 1:31 GMT+08:00 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> Hi Jacob,
>
> Am Donnerstag, 13. Juli 2017, 00:03:51 CEST schrieb Jacob Chen:
>> Add devicetree nodes for rk3399 VOP (Video Output Processors), and the
>> top level display-subsystem root node.
>>
>> Later patches add endpoints (eDP, HDMI, MIPI, etc) that attach to the
>> VOPs' output ports.
>>
>> Signed-off-by: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
>
> you might want to reduce the number of Signed-offs a bit :-)
>
> Also authorship needs to be fixed. I.e. first Signed-off for this patch
> is from Mark, so in that case Mark probably also was the original author
> and the patch should reflect that. General rule, topmost Signed-off is
> of course from the original author.
>

OK, get it.

>
> Heiko
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
