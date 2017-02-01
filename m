From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx: Pass 'chosen' and 'memory' nodes
Date: Wed, 1 Feb 2017 14:30:18 +0100
Message-ID: <6d3e9733-bebc-4347-95db-2a1c9018948d@i2se.com>
References: <20170130185444.GF27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130185444.GF27312-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> On Mon, Jan 30, 2017 at 4:54 PM, Russell King - ARM Linux
> <linux@xxxxxxxxxxxxxxx> wrote:
>
> >/We need this regression fixed before 4.10 comes out so systems don't/
> >/break when 4.10 comes out./
>
> It will be fixed in the next rc with the following commit:
>
https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/fixes&id=a971c5545c3d45a1e33fda6e57913bb75aaa20c9
<https://git.kernel.org/cgit/linux/kernel/git/shawnguo/linux.git/commit/?h=imx/fixes&id=a971c5545c3d45a1e33fda6e57913bb75aaa20c9>


i want to report that the combination i.MX28 + imx-bootlets (requires
CONFIG_ARM_APPENDED_DTB since bootlets can't handle DTBs) was also
affected before and fixed by this patch.

Btw are Arnd and Olof informed about this urgent patch?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
