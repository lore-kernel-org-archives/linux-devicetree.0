From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl: Remove leading zeroes from unit addresses
Date: Fri, 22 Sep 2017 10:45:21 -0300
Message-ID: <CAOMZO5B+5Y3f86Uoftb4WKSrVU6XF08axG+dYaryN+nnkBpZZQ@mail.gmail.com>
References: <1506017410-13263-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506017410-13263-1-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWPLiZjB17Co1B2eb7JE58TQ@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marco Antonio Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 21, 2017 at 3:10 PM, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org> wrote:
> The following build warnings are seen with W=1:
>
> Warning (simple_bus_reg): Node /soc/sram@00900000 simple-bus unit
> address format error, expected "900000"
> Warning (simple_bus_reg): Node /soc/aips-bus@02000000 simple-bus unit
> address format error, expected "2000000"
> Warning (simple_bus_reg): Node /soc/aips-bus@02000000/pxp@020f0000
> simple-bus unit address format error, expected "20f0000"
> (...)
>
> Remove the leading zeroes from unit addresses to fix the warnings.
>
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
