From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: watchdog: Add DT binding documentation for jz47xx watchdog timer
Date: Tue, 27 Jan 2015 21:16:45 +0100
Message-ID: <11680810.808F8uDyN0@wuerfel>
References: <1422371490-44402-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422371490-44402-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422371490-44402-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 27 January 2015 15:11:29 Zubair Lutfullah Kakakhel wrote:
> +clocks: phandle to rtcclk
> +clock-names: must be "rtc"
> +
> +Example:
> +
> +watchdog: jz47xx-watchdog@0x10002000 {
> +       compatible = "ingenic,jz4780-watchdog";
> +       reg = <0x10002000 0x100>;
> +
> +       clocks = <&rtclk>;
> +       clock-names = "rtc";
> +};

Why is the name "rtc"? are you sure you are not confusing the output
name of the clock controller with the input of the watchdog device?

It's suspicious that both have similar names.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
