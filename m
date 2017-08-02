From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/5] Add some DT nodes for Mediatek MT2701
Date: Wed, 2 Aug 2017 12:56:14 +0800
Message-ID: <1501649774.9992.4.camel@mtksdaap41>
References: <1501571013-22327-1-git-send-email-erin.lo@mediatek.com>
         <f1ea36ee-0a8b-135a-f5f1-67ba7f6dbbce@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f1ea36ee-0a8b-135a-f5f1-67ba7f6dbbce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Tue, 2017-08-01 at 16:06 +0200, Matthias Brugger wrote:
> Hi Erin,
> 
> On 08/01/2017 09:03 AM, Erin Lo wrote:
> > This patch series based on v4.13-rc1, include MT2701 ethernet/disp bls/display/usb3 function DT nodes.
> > 
> > Chunfeng Yun (1):
> >    arm: dts: mt2701: Add usb3 device nodes
> > 
> > Sean Wang (1):
> >    arm: dts: mt2701: Add ethernet device node
> > 
> > Weiqing Kong (2):
> >    arm: dts: mt2701: Add display bls related nodes for MT2701
> >    arm: dts: mt2701: Add display bls related nodes for MT2701
> > 
> > YT Shen (1):
> >    arm: dts: mt2701: Add display subsystem related nodes for MT2701
> > 
> 
> I took 1/5 and 5/5 in v4.13-next/dts32
> 
> Please reword the commit message on 2/5 and 3/5.
> Also the node should be called pwm instead of bls.
> 
> Regards,
> Matthias
> 

Thanks for your comment.
We will reword pwm instead of bls in next version and send them with 4/5
in recent days.

Regards,
Erin


> >   arch/arm/boot/dts/mt2701-evb.dts |  27 ++++++
> >   arch/arm/boot/dts/mt2701.dtsi    | 189 +++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 216 insertions(+)
> > 
> > --
> > 1.9.1
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
