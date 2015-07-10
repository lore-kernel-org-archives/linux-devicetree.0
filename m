From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: add mt6580 basic support
Date: Fri, 10 Jul 2015 17:01:34 +0200
Message-ID: <2315308.OGuGlIy214@ubix>
References: <1436255771-5367-1-git-send-email-mars.cheng@mediatek.com> <1436255771-5367-3-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436255771-5367-3-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 07, 2015 03:56:11 PM mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> This adds basic chip support for Mediatek 6580.
> 
> Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile         |   1 +
>  arch/arm/boot/dts/mt6580-evbp1.dts |  35 +++++++++++
>  arch/arm/boot/dts/mt6580.dtsi      | 123
> +++++++++++++++++++++++++++++++++++++ 3 files changed, 159 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt6580-evbp1.dts
>  create mode 100644 arch/arm/boot/dts/mt6580.dtsi

Please take into account the comments Mark made on your mt6795 patch set [1].

Apart from that, it looks good to me.

Thanks,
Matthias

[1] https://patchwork.kernel.org/patch/6743921/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
