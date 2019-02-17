From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Sun, 17 Feb 2019 22:19:49 +0100 (CET)
Message-ID: <1792591325.343876.1550438389249@email.ionos.de>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
 <CAERgokmpHQb2czJdx++qFoogFRmkvXZm=4BNOsVuCz-ZvgTEaw@mail.gmail.com>
 <4ef63671-f58d-3b16-9055-09e69314a0e6@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4ef63671-f58d-3b16-9055-09e69314a0e6-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>, Tony McKahan <tonymckahan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> hat am 17. Februar 2019 um 16:55 geschrieben:
> 
> 
> Stefan Wahren has come up with a minimal patch to hci_h5 for bluetooth, 
> that says the relevant properties can be read from the device tree. This 
> means that acpi is no longer necessary. Thats currently out in testing.
> 

this patch is more a quick hack in order to test bluetooth and don't have all features ( support for baud limitation, host-wake-up ). Also the patch [1] has only been compile tested (i don't have a Tinker Board), so please be aware. I created my patch before this series has been submitted, but Patch #3 doesn't work with this and needs changes.

Stefan

[1] - https://gist.github.com/lategoodbye/79bac99d4f1158a719a48ea3c45eb7f1

> Regards,
> 
> David.
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
