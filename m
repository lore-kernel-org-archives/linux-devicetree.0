From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: r8a779x: Add '#reset-cells' in cpg-mssr
Date: Mon, 20 Nov 2017 10:57:07 +0100
Message-ID: <CAMuHMdXPrv4bwZbGxE=DJp2nufjF5Q6JwFAERDvBFi+UsAXVsA@mail.gmail.com>
References: <1510839357-11450-1-git-send-email-geert+renesas@glider.be> <20171120094957.2seep3qw4j274zrv@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171120094957.2seep3qw4j274zrv-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Nov 20, 2017 at 10:49 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> On Thu, Nov 16, 2017 at 02:35:57PM +0100, Geert Uytterhoeven wrote:
>> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>
>> With the latest dtc, we get many warnings about the missing
>> '#reset-cells' property in these controllers, e.g.:
>>
>> arch/arm/boot/dts/r8a7790-lager.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /can@e6e80000:resets[0])
>> arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/dma-controller@e6700000:resets[0])
>> arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (resets_property): Missing property '#reset-cells' in node /soc/clock-controller@e6150000 or bad phandle (referred from /soc/ethernet@e6800000:resets[0])
>> arch/arm/boot/dts/r8a7793-gose.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /gpio@e6050000:resets[0])
>> arch/arm/boot/dts/r8a7794-alt.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /i2c@e6500000:resets[0])
>> arch/arm/boot/dts/r8a7794-silk.dtb: Warning (resets_property): Missing property '#reset-cells' in node /clock-controller@e6150000 or bad phandle (referred from /interrupt-controller@e61c0000:resets[0])
>>
>> This adds it for the three r8a779x chips that were lacking it. The
>> binding mandates this as <1>, so this is the value I use.
>>
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> [geert: Add fix for r8a7793.dtsi]
>> Fixes: 34fbd2b12761d111 ("ARM: dts: r8a7790: Add reset control properties")
>> Fixes: 6e11a322f1d7505d ("ARM: dts: r8a7792: Add reset control properties")
>> Fixes: 84fb19e1d201ba86 ("ARM: dts: r8a7793: Add reset control properties")
>> Fixes: 615beb759ca494a4 ("ARM: dts: r8a7794: Add reset control properties")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
> Thanks for following up on this, its been fouling up my todo list for a
> while now. Applied for v4.16.

As this is a fix for changes made in v4.15-rc1, don't we want it in v4.15?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
