From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv4 3/6] ARM: dts: Add initial LS1021A TWR board dts support
Date: Wed, 24 Sep 2014 17:54:43 +0200
Message-ID: <3598074.CpE7Waa9La@wuerfel>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com> <4264466.HtkUxyxBW8@wuerfel> <bb122a232a1c40559e84a058f3d003b4@BL2PR03MB467.namprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bb122a232a1c40559e84a058f3d003b4-AZ66ij2kwab4MB1ZSnT4iOO6mTEJWrR4XA4E9RH9d+qIuWR1G4zioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Shengchao Guo <Shawn.Guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "B46807-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <B46807-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 24 September 2014 11:00:34 Jingchang Lu wrote:
> 
> We also do the phy-handle fixup on our PowerPC platform based on the aliases,
> and so I adopt the same way to make these fixup consistent between SoCs.
> And the u-boot fdt fixup code base on the aliases has been upstreamed, so may
> we keep this aliases unchanged?

I don't see a strong reason to change it, it just seemed strange to me.

> BTW, find a node by alias is easily, could you give me some clue on finding a node
> by a label directly, Thanks.

I haven't used libfdt in this way myself, so I don't know how it would
be done. However, the idea is that the labels in dts files end up as
ELF symbols in the dtb, so you can look them up by following the ELF
headers.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
