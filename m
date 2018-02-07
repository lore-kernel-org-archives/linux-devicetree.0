From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] of_pci_irq: add a check to fallback to standard
 device tree parsing
Date: Wed, 7 Feb 2018 09:58:08 +0800
Message-ID: <1517968688.31641.12.camel@mtkswgap22>
References: <31c765c53e85e41bfc001d110d69e46c9967f4e7.1516961656.git.ryder.lee@mediatek.com>
         <CAL_JsqLZqrxxpuEnoWEGkT2WCuyjqn0bM1DP8PdAwnQsso8kOA@mail.gmail.com>
         <1517563970.24622.9.camel@mtkswgap22>
         <1517866584.2312.140.camel@kernel.crashing.org>
         <1517884738.16010.27.camel@mtkswgap22>
         <1517889903.2312.151.camel@kernel.crashing.org>
         <1517891471.20869.6.camel@mtkswgap22>
         <1517892624.2312.167.camel@kernel.crashing.org>
         <1517895732.23319.21.camel@mtkswgap22>
         <1517956309.2312.172.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517956309.2312.172.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Arnd

On Wed, 2018-02-07 at 09:31 +1100, Benjamin Herrenschmidt wrote:
> On Tue, 2018-02-06 at 13:42 +0800, Ryder Lee wrote:
> > Thanks for explanation.
> > 
> > So I guess the better way to achieve my aim - one IRQ per slot that is
> > connected to all INTx and get propagated through the bridges (and for
> > those root ports own interrupts (PME ..)} is to add interrupt-map
> > properties in both parent and root port nodes.
> > 
> > Something like this: https://patchwork.kernel.org/patch/9970923// ,right?
> 
> Yup.
> 
> Cheers,
> Ben.
> 

Do you have any thoughts on the original approach? If you are okay with
it, I will resend the DT patch.

Thanks.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
