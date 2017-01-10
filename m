From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: mt7623: Add initial Geek Force support
Date: Tue, 10 Jan 2017 08:00:16 +0100
Message-ID: <91f5ec74-1aa1-f2ad-24e9-14267cbe8498@phrozen.org>
References: <20170108133100.10428-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170108133100.10428-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Paul Lai <paul-37fROp6E04DQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 08/01/2017 14:30, Andreas Färber wrote:
> 
> Andreas Färber (4):
>   Documentation: devicetree: Add vendor prefix for AsiaRF
>   Documentation: devicetree: arm: mediatek: Add Geek Force board
>   ARM: dts: mt7623: Add Geek Force config
>   MAINTAINERS: Extend ARM/Mediatek SoC support section
> 

Hi,

i need to NAK this series. the asiarf board is nothing more than the
official MTK EVB with AsiaRF written on it. this board is already
supported by linux (arch/arm/boot/dts/mt7623-evb.dts) please extend the
EVB dts file nstead of adding a duplicate and letting the original bitrot.

	John

>  Documentation/devicetree/bindings/arm/mediatek.txt |  3 +
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  MAINTAINERS                                        |  2 +
>  arch/arm/boot/dts/Makefile                         |  1 +
>  arch/arm/boot/dts/mt7623-geekforce.dts             | 77 ++++++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 arch/arm/boot/dts/mt7623-geekforce.dts
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
