From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: vf610: relicense vf???.dtsi under GPLv2/X11
Date: Tue, 24 Nov 2015 14:01:58 +0800
Message-ID: <20151124060158.GG11999@tiger>
References: <1448323069-23208-1-git-send-email-stefan@agner.ch>
 <1448323069-23208-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448323069-23208-2-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 23, 2015 at 03:57:46PM -0800, Stefan Agner wrote:
> GPLv2-only devicetrees make reuse difficult for software components
> licensed under a different license.
> 
> The consensus is that a GPL/X11 dual-license should allow all necessary
> uses, so relicense the vfxxx.dtsi, vf500.dtsi and vf610.dtsi files to
> this combination.
> 
> CCs were acquired using (updated some email addresses):
> git shortlog -sne --no-merges arch/arm/boot/dts/vf???.dtsi
> 
> CC: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> CC: Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
> CC: Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> CC: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> CC: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> CC: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
