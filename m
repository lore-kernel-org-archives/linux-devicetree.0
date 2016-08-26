From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Add SMP support for i.MX7D
Date: Fri, 26 Aug 2016 09:43:08 -0300
Message-ID: <CAOMZO5DaL+CKQe0hOHi_Kv8Vt9y0RHyERS8ek78WebxFmjj9rg@mail.gmail.com>
References: <1472209971-32469-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472209971-32469-1-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Fri, Aug 26, 2016 at 8:12 AM, Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org> wrote:
> i.MX7D has 2 Cortex-A7 ARM cores, and it has a different GPC design
> than i.MX6, so this patch set adds a new GPCV2 driver for i.MX7D,
> and also adds runtime check in SMP code to support both Cortex-A9
> and Cortex-A7 ARM cores.
>
> With this patch set, i.MX7D can boot up SMP kernel with 2 CPUs.

Currently mx7d can boot the 2 CPUs if you use PSCI in the bootloader.

Give mainline U-Boot a try and it will boot the 2 CPUs via PSCI.

There was an attempt to add gpcv2 support at:
https://patchwork.kernel.org/patch/6919831/

, and Shawn suggested to go to the PSCI approach.

PSCI for mx7 is still missing suspend support though.

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
