From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6: Specify 'anatop-enable-bit' where appropriate
Date: Tue, 10 Jan 2017 15:28:22 -0200
Message-ID: <CAOMZO5CnwrPcney0qzQgex_aFXCrksmEocZ28nf54Kvcm2dq-w@mail.gmail.com>
References: <20170110163015.22444-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170110163015.22444-1-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 2:30 PM, Andrey Smirnov
<andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> ENABLE_LINREG bit is implemented by 3P0, 1P1 and 2P5 regulators on
> i.MX6. This property is present in similar code in Fresscale BSP and
> made its way upstream in imx6ul.dtsi, so this patch adds this property
> to the rest of i.MX6 family for completness.

Please see:
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/patch/arch/arm/boot/dts/imx6ul.dtsi?id=27958ccdf29e9971732e02494b48be54b0691269
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
