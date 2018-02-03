From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: imx: Add memory node unit name
Date: Fri, 2 Feb 2018 22:03:07 -0200
Message-ID: <CAOMZO5AfEon8mGLZyYQav_TjZ5h7KMVvE8ks4Ruw4xyj48wofA@mail.gmail.com>
References: <1516800134-5018-1-git-send-email-marcofrk@gmail.com> <1516800134-5018-3-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516800134-5018-3-git-send-email-marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 24, 2018 at 11:22 AM, Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Fix the following warnings from dtc by adding the unit name to memory
> nodes:
>
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
>
> Converted using the following command:
>
> perl -p0777i -e 's/memory \{\n\t\treg = \<0x+([0-9a-f])/memory\@$1$\0000000 \{\n\t\treg = <0x$1/m' `find ./arch/arm/boot/dts -name "imx*"`
>
> The files below were manually fixed:
> -imx1-ads.dts
> -imx1-apf9328.dts
> -imx6q-pistachio.dts
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
