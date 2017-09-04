From: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-binding: net: wireless: add
 bcm43430-fmac
Date: Mon, 4 Sep 2017 16:42:30 +0200
Message-ID: <20170904144230.yuadvqiruj73q5t3@AntonyAntony.local>
References: <20170829214309.34466-1-antony@phenome.org>
 <CAGb2v66=JvS9wHkUNBwd+vHwx4NAQsaWyhx1OyEokSZizo+7-g@mail.gmail.com>
 <20170830120218.ms3xuhp4qsibistv@AntonyAntony.local>
 <20170901164911.aiu5ej5u546z5kow@rob-hp-laptop>
 <bb53a79e-8045-3c9b-8c98-8d4815c3b57a@broadcom.com>
 <20170901204030.2zpsoa4i53tdegs3@AntonyAntony.local>
 <8af0e096-f4b1-213f-d543-fa711e1961ad@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8af0e096-f4b1-213f-d543-fa711e1961ad-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Antony Antony <antony-AVhj06Q78b5AfugRpC6u6w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arend,

On Fri, Sep 01, 2017 at 11:30:59PM +0200, Arend van Spriel wrote:
> > > Hi Rob,
> > > 
> > > Actually the Broadcom wifi chips themselves are discoverable. So once the
> > > driver has access to the register space of the device it can determine the
> > > actual chip, its revision, and exactly what cores (and their revision) are
> > > present in the chip. Hence there is a single compatible string as there is
> > > no need to convey the same information through device tree data.
> > 
> > In my expereince this how it seems to work.
> > 
> > I jsut discovered s/brcm,bcm4329-fmac/brcm/ can load the broadcom driver.
> > 
> > brcmf: wifi@1 {
> > 	reg = <1>;
> > 	compatible = "brcm";
> > };
> > 
> > This looks better to me. Maxime, Would this work?
> 
> I have no idea what you are saying here. To what exactly do you apply that
> substitute. In brcmfmac I have: 

Thanks for pointing me to the relevent code. I was asking about DT support I 
submitted. 

> 
>         if (!np || bus_type != BRCMF_BUSTYPE_SDIO ||
>             !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
>                 return;
> 
> In my perception using "brcm" goes against DT compatible naming convention.

It seems the driver has a special place holder, bcm4329-fmac.
I am still wondering what is acceptable in the DT. 

compatible = ""brcm,bcm4329-fmac";
or 
compatible = "brcm";

The last one does not generate any warnings.
Here it the DT I am proposing. https://patchwork.kernel.org/patch/9937263/

regards,
-antony
