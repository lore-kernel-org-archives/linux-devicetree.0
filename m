From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/3] add support for Firefly-RK3288 and Rayeager PX2 boards
Date: Mon, 26 Jan 2015 02:22:55 +0100
Message-ID: <2137926.nqOiED5bzz@diego>
References: <1422189576-19478-1-git-send-email-naobsd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422189576-19478-1-git-send-email-naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: FUKAUMI Naoki <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. Januar 2015, 21:39:33 schrieb FUKAUMI Naoki:
> This series adds support for following Rockchip SoC based boards.
> 
>  - Firefly, Firefly-RK3288 (both beta and mass production version)
>  - ChipSPARK, Rayeager PX2

I've applied this series with Andy's Tested-by for the Rayeager board and my 
Tested-by for the Firefly.

One caveat, I had to remove the gmac node from the firefly dtsi, as the whole 
gmac series goes through the network tree, so the dtb won't compile either in 
my tree or arm-soc due to the missing core node.

I'll try to see if I can get the separate gmac node in when everything is 
combined in 3.20-rc1.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
