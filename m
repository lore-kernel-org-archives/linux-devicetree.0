From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: Add mt6755 basic chip support
Date: Mon, 20 Jun 2016 13:33:05 +0800
Message-ID: <1466400785.29789.2.camel@mtkswgap22>
References: <1465870805-10451-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465870805-10451-1-git-send-email-mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Loda Choui <loda.chou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jades Shih <jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, My Chuang <my.chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2016-06-14 at 10:20 +0800, Mars Cheng wrote:
> This patch adds basic support for Mediatek's new 8-core chip, mt6755.
> It is also named as Helio P10. It is based on 4.7-rc1
> 
> Mars Cheng (2):
>   Document: DT: Add bindings for mediatek MT6755 SoC Platform
>   arm64: dts: mediatek: add mt6755 support
> 
>  Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
>  .../interrupt-controller/mediatek,sysirq.txt       |    1 +
>  .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>  arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>  arch/arm64/boot/dts/mediatek/mt6755-phone.dts      |   39 ++++++
>  arch/arm64/boot/dts/mediatek/mt6755.dtsi           |  143 ++++++++++++++++++++
>  6 files changed, 189 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755-phone.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6755.dtsi
> 
Hi Matthias

Would you like to merge this patch? If there is any suggestions or
issues, I will fix them ASAP.

Thanks a lot.
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
