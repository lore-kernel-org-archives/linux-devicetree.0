From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: imx: add SMP support for i.MX7D
Date: Fri, 26 Aug 2016 10:59:11 +0200
Message-ID: <3283479.PKRDjkX0Md@wuerfel>
References: <1472209971-32469-1-git-send-email-Anson.Huang@nxp.com> <1472209971-32469-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472209971-32469-4-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, August 26, 2016 7:12:51 PM CEST Anson Huang wrote:
> i.MX7D has 2 cortex-a7 ARM core, add support for
> booting up SMP kernel with 2 CPUs.
> 
> The existing i.MX SMP code is designed for i.MX6
> series SoCs which have cortex-a9 ARM core, but i.MX7D
> has 2 cortex-a7 ARM core, so we need to add runtime
> check for those differences between cortex-a9 and
> cortex-a7.
> 
> Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
> 

Can't you just point i.MX7D to start from secondary_startup
rather than v7_secondary_startup?

 ENTRY(v7_secondary_startup)
+       .word   0xc070                  @ 0xc07 is cortex-a7 id
+       .word   0xfff0                  @ mask for core type
+

This looks like you are trying to execute instructions that are
actually data. Does this work?

On a side note, could you rename v7_secondary_startup to
imx6_secondary_startup? The name sounds overly generic
on a multiplatform kernel.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
