From: Yao Yuan <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 1/4] ARM: dts: vf610: relicense vf???.dtsi under GPLv2/X11
Date: Sat, 5 Dec 2015 06:09:47 +0000
Message-ID: <BLUPR03MB134302C5956BB070A295C98830B0@BLUPR03MB134.namprd03.prod.outlook.com>
References: <1448323069-23208-1-git-send-email-stefan@agner.ch>
 <1448323069-23208-2-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448323069-23208-2-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, Stoica Cosmin Stefan <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Frank <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Duan Andy <fugang.duan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/24/2015 07:57 AM, Stefan Agner wrote:
GPLv2-only devicetrees make reuse difficult for software components licensed under a different license.

The consensus is that a GPL/X11 dual-license should allow all necessary uses, so relicense the vfxxx.dtsi, vf500.dtsi and vf610.dtsi files to this combination.

CCs were acquired using (updated some email addresses):
git shortlog -sne --no-merges arch/arm/boot/dts/vf???.dtsi

CC: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
CC: Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
CC: Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
CC: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
CC: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Acked-by: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 arch/arm/boot/dts/vf500.dtsi | 40 ++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/vf610.dtsi | 40 ++++++++++++++++++++++++++++++++++++----
 arch/arm/boot/dts/vfxxx.dtsi | 40 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 108 insertions(+), 12 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
