From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: vf610: relicense the device trees under GPLv2/X11
Date: Mon, 23 Nov 2015 15:57:45 -0800
Message-ID: <1448323069-23208-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GPLv2 license makes it impractical for other software components
licensed under another license to use our device trees. To fix this,
and make our device tree usable by other software components, relicense
them under a GPLv2/X11 dual-license.

In order to get this accepted, we *need* all contributors to the Vybrid
device tree files to send an ack to the patches applying on a file they
contributed on.

I think some Freescale email addresses are not valid anymore, can someone
from Freescale make an ack on their behalf?

The needed Acked-by by device tree are:

vf???.dtsi:
  Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
  Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
  Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
  Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
  Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
  Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
  Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

vf610-colibri:
  Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
  Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
  Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

vf610-cosmic:
  Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
  Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
  Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
  Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

vf610-twr:
  Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
  Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
  Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
  Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
  Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

CC: Bhuvanchandra DV <bhuvanchandra.dv-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
CC: Bill Pringlemeir <bpringle-rieW9WUcm8FFJ04o6PK0Fg@public.gmane.org>
CC: Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
CC: Cosmin Stoica <cosminstefan.stoica-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Frank Li <Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
CC: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
CC: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
CC: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
CC: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Stefan Agner (4):
  ARM: dts: vf610: relicense vf???.dtsi under GPLv2/X11
  ARM: dts: vf610-colibri: relicense vf*colibri* under GPLv2/X11
  ARM: dts: vf610-cosmic: relicense vf610-cosmic.dts under GPLv2/X11
  ARM: dts: vf610-twr: relicense vf610-twr.dts under GPLv2/X11

 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi   | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf-colibri.dtsi           | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf500-colibri-eval-v3.dts | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf500-colibri.dtsi        | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf500.dtsi                | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf610-colibri-eval-v3.dts | 42 +++++++++++++++++++++++++----
 arch/arm/boot/dts/vf610-colibri.dtsi        | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf610-cosmic.dts          | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf610-twr.dts             | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vf610.dtsi                | 40 ++++++++++++++++++++++++---
 arch/arm/boot/dts/vfxxx.dtsi                | 40 ++++++++++++++++++++++++---
 11 files changed, 397 insertions(+), 45 deletions(-)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
