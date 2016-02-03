From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Re: [PATCH v2 0/4] ARM: dts: vf610: relicense the device trees under
 GPLv2/X11
Date: Tue, 02 Feb 2016 17:00:23 -0800
Message-ID: <5311c9f5234f774dc34118a564f48a4c@agner.ch>
References: <1449525076-23569-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449525076-23569-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

For patches 1, 2 and 4 I think we have enough Acks to consider it safe
to change the license.

For Patch 3, the Cosmic board, I can not get an Ack nor a Nack from Matt
Porter, unfortunately... But IMHO it should not hold us back from
merging the rest, what do you think?

--
Stefan

On 2015-12-07 13:51, Stefan Agner wrote:
> I collected the Acks I received so far and removed them from the list
> below. Several Freescale addresses are no longer valid (the once
> starting with --)... I would interprete the Ack from Yuan Yao as an
> Ack from Freescale.
> 
> Matt, you introduced the vf610-cosmic.dts board, is it possible to
> get an ack for this too? I think you did not receive v1 of this patch
> due to an old email address, sorry about that.
> 
> vf???.dtsi:
>   --Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> vf610-colibri:
>   <all done>
> 
> vf610-cosmic:
>   Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> 
> vf610-twr:
>   --Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>   --Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> CC: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> CC: Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
> --CC: Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> CC: Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> --CC: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> --CC: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> --CC: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> CC: Matt Porter <mporter-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> CC: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> CC: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> --CC: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Stefan Agner (4):
>   ARM: dts: vf610: relicense vf???.dtsi under GPLv2/X11
>   ARM: dts: vf610-colibri: relicense vf*colibri* under GPLv2/X11
>   ARM: dts: vf610-cosmic: relicense vf610-cosmic.dts under GPLv2/X11
>   ARM: dts: vf610-twr: relicense vf610-twr.dts under GPLv2/X11
> 
>  arch/arm/boot/dts/vf-colibri-eval-v3.dtsi   | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf-colibri.dtsi           | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf500-colibri-eval-v3.dts | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf500-colibri.dtsi        | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf500.dtsi                | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf610-colibri-eval-v3.dts | 42 +++++++++++++++++++++++++----
>  arch/arm/boot/dts/vf610-colibri.dtsi        | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf610-cosmic.dts          | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf610-twr.dts             | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vf610.dtsi                | 40 ++++++++++++++++++++++++---
>  arch/arm/boot/dts/vfxxx.dtsi                | 40 ++++++++++++++++++++++++---
>  11 files changed, 397 insertions(+), 45 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
