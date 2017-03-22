From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: setup DMA-channels for mmc0 and emmc for rk3188
Date: Wed, 22 Mar 2017 17:35:08 +0100
Message-ID: <1719178.VTn5J36Jb3@phil>
References: <1490109227-4006-1-git-send-email-al.kochet@gmail.com> <11123239.Wc863F7R2R@phil> <C2BC0A84-EF69-42E3-84FA-A873B8A7187A@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C2BC0A84-EF69-42E3-84FA-A873B8A7187A-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Kochetkov <al.kochet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Mittwoch, 22. März 2017, 19:20:56 CET schrieb Alexander Kochetkov:
> Hello, Heiko!
> 
> > 22 марта 2017 г., в 18:54, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> написал(а):
> I have working settings for eMMC for radxa rock. What do you think, is it
> good idea to add them to the kernel DT? As Radxa Rock doesn’t come with
> eMMC, but eMMC can be soldered manually.

No, the Rock comes with a nand flash, which we hopefully will support at some 
point in the future. And in the mainline kernel we want to support the stock 
boards as people can buy them, not something people have soldered around on.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
