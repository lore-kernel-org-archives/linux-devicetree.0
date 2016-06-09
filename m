From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v3 4/4] soc: Add SoC driver for Freescale Vybrid platform
Date: Thu, 9 Jun 2016 16:08:17 +0530
Message-ID: <20160609103817.GA14965@Sanchayan-Arch.localdomain>
References: <cover.1463737502.git.maitysanchayan@gmail.com>
 <CAL_JsqKCwy=aXveTfnaQuZ5b3Ld9nzABgPfdPm1JX3CBuvzG+Q@mail.gmail.com>
 <20160527063301.GB1554@Sanchayan-Arch.localdomain>
 <9495361.v6aft1QR0M@wuerfel>
 <20160527100817.GA8294@Sanchayan-Arch.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160527100817.GA8294-2b/appYahYDPUjlVagVGR1Kr0EmMEXJSn9A1Ff6Mc9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 16-05-27 15:38:17, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> On 16-05-27 10:31:55, Arnd Bergmann wrote:
> > On Friday, May 27, 2016 12:03:01 PM CEST maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> > > 
> > > So if I understand correctly, the binding at the SoC level is fine.
> > > Keeping that but removing the additional made-up properties, viz. below
> > > 
> > > rom-revision: phandle to the on-chip ROM node
> > > mscm: phandle to the MSCM CPU configuration node
> > > nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> > > nvmem-cell-names: should contain string names "cfg0" and "cfg1"
> > > 
> > > would be fine?
> > > 
> > > We would have something similar to here
> > > http://www.spinics.net/lists/devicetree/msg80655.html
> > > 
> > > but now with the DT binding under SoC bus.
> > > 
> > 
> > 
> > You look up the OTP device as a syscon here, which seems odd since there
> > is already an nvmem driver for it. Shouldn't you use the nvmem API for
> > that?
> > 
> > 	Arnd
> 
> I need the following 
> 
> nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> nvmem-cell-names: should contain string names "cfg0" and "cfg1"
> 
> to be able to use the NVMEM consumer API.
> 
> If I can put them at SoC node level then I certainly can use the NVMEM API.
> 

Would the following be acceptable at the SoC node level

> nvmem-cells: phandles to two OCOTP child nodes ocotp_cfg0 and ocotp_cfg1
> nvmem-cell-names: should contain string names "cfg0" and "cfg1"

Regards,
Sanchayan.
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
