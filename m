From: Richard Kojedzinszky <richard.kojedzinszky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM: dts: sun7i: BPI-M1+ and Lamobo-R1 fixes
Date: Sun, 20 Nov 2016 14:09:14 -0800 (PST)
Message-ID: <e1e70fec-7a09-4899-b3a7-e0431d2e642a@googlegroups.com>
References: <1467796250-22010-1-git-send-email-wens@csie.org>
Reply-To: richard.kojedzinszky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_7643_702317274.1479679754279"
Return-path: <linux-sunxi+bncBD2JJSMIC4IKXQOIYECRUBGG5TPU6-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <1467796250-22010-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_7643_702317274.1479679754279
Content-Type: multipart/alternative;
	boundary="----=_Part_7644_293954286.1479679754279"

------=_Part_7644_293954286.1479679754279
Content-Type: text/plain; charset=UTF-8

Hi there,

I own a sinovoip's bananapi m1+, and using the latest dts and latest 
mainline kernel the os does not boot up, the mmc does not get initialized. 
I had to make mmc0 and mmc3 compatible with
"allwinner,sun5i-a13-mmc", then the device booted up well. It turned out to 
me that actually the MMC_CAP_1_8V_DDR flag 
in drivers/mmc/host/sunxi-mmc.c:1249 caused the wrong behaviour. If I just 
remove that capability, the board also boots up well. I dont know what have 
I found.

And also, as a board has usb ports in it, I had to enable the usb phy. I 
have a local dts which works for me now, should not it be included in 
mainline?

I have attached my dts which makes my device boot up well.

Regards,
On Wednesday, July 6, 2016 at 11:11:00 AM UTC+2, Chen-Yu Tsai wrote:
>
> Hi Maxime, 
>
> These are a bunch of fixes I did to get my boards running. Some of them 
> are cleanups, while others enable hardware that we already support on 
> other boards, such as USB or the audio codec. 
>
> Regards 
> ChenYu 
>
> Chen-Yu Tsai (9): 
>   ARM: dts: sun7i: lamobo-r1: Fix USB-based WiFi module power 
>   ARM: dts: sun7i: lamobo-r1: Remove usb1 vbus regulator 
>   ARM: dts: sun7i: lamobo-r1: Fix GPIO flags in reg_ahci_5v 
>   ARM: dts: sun7i: lamobo-r1: Enable audio codec 
>   ARM: dts: sun7i: bananapi-m1-plus: Reindent whole file using tabs 
>   ARM: dts: sun7i: bananapi-m1-plus: Unify suffix for board specific 
>     labels 
>   ARM: dts: sun7i: bananapi-m1-plus: red LED is power LED 
>   ARM: dts: sun7i: bananapi-m1-plus: Add PMIC regulators and OPPs for 
>     cpufreq 
>   ARM: dts: sun7i: bananapi-m1-plus: Enable USB OTG 
>
>  arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts | 342 
> ++++++++++++++--------- 
>  arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts        |  20 +- 
>  2 files changed, 218 insertions(+), 144 deletions(-) 
>
> -- 
> 2.8.1 
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_7644_293954286.1479679754279
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>I own a sinovoip&#39;s banana=
pi m1+, and using the latest dts and latest mainline kernel the os does not=
 boot up, the mmc does not get initialized. I had to make mmc0 and mmc3 com=
patible with</div><div>&quot;allwinner,sun5i-a13-mmc&quot;, then the device=
 booted up well. It turned out to me that actually the=C2=A0MMC_CAP_1_8V_DD=
R flag in=C2=A0drivers/mmc/host/sunxi-mmc.c:1249 caused the wrong behaviour=
. If I just remove that capability, the board also boots up well. I dont kn=
ow what have I found.<br></div><div><br></div><div>And also, as a board has=
 usb ports in it, I had to enable the usb phy. I have a local dts which wor=
ks for me now, should not it be included in mainline?</div><div><br></div><=
div>I have attached my dts which makes my device boot up well.</div><div><b=
r></div><div>Regards,</div><div>On Wednesday, July 6, 2016 at 11:11:00 AM U=
TC+2, Chen-Yu Tsai wrote:<blockquote class=3D"gmail_quote" style=3D"margin:=
 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">Hi Ma=
xime,
<br>
<br>These are a bunch of fixes I did to get my boards running. Some of them
<br>are cleanups, while others enable hardware that we already support on
<br>other boards, such as USB or the audio codec.
<br>
<br>Regards
<br>ChenYu
<br>
<br>Chen-Yu Tsai (9):
<br>=C2=A0 ARM: dts: sun7i: lamobo-r1: Fix USB-based WiFi module power
<br>=C2=A0 ARM: dts: sun7i: lamobo-r1: Remove usb1 vbus regulator
<br>=C2=A0 ARM: dts: sun7i: lamobo-r1: Fix GPIO flags in reg_ahci_5v
<br>=C2=A0 ARM: dts: sun7i: lamobo-r1: Enable audio codec
<br>=C2=A0 ARM: dts: sun7i: bananapi-m1-plus: Reindent whole file using tab=
s
<br>=C2=A0 ARM: dts: sun7i: bananapi-m1-plus: Unify suffix for board specif=
ic
<br>=C2=A0 =C2=A0 labels
<br>=C2=A0 ARM: dts: sun7i: bananapi-m1-plus: red LED is power LED
<br>=C2=A0 ARM: dts: sun7i: bananapi-m1-plus: Add PMIC regulators and OPPs =
for
<br>=C2=A0 =C2=A0 cpufreq
<br>=C2=A0 ARM: dts: sun7i: bananapi-m1-plus: Enable USB OTG
<br>
<br>=C2=A0arch/arm/boot/dts/sun7i-a20-<wbr>bananapi-m1-plus.dts | 342 +++++=
+++++++++---------
<br>=C2=A0arch/arm/boot/dts/sun7i-a20-<wbr>lamobo-r1.dts =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A020 +-
<br>=C2=A02 files changed, 218 insertions(+), 144 deletions(-)
<br>
<br>--=20
<br>2.8.1
<br>
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_7644_293954286.1479679754279--

------=_Part_7643_702317274.1479679754279
Content-Type: application/octet-stream;
	name=sun7i-a20-bananapi-m1-plus-local.dts
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=sun7i-a20-bananapi-m1-plus-local.dts
X-Attachment-Id: f7c9abda-395f-44a0-964f-a8d13cc18a86
Content-ID: <f7c9abda-395f-44a0-964f-a8d13cc18a86>

#include "sun7i-a20-bananapi-m1-plus.dts"

&mmc0 {
	compatible = "allwinner,sun5i-a13-mmc";
};

&mmc3 {
	compatible = "allwinner,sun5i-a13-mmc";
};

&usbphy {
	status = "okay";
};

------=_Part_7643_702317274.1479679754279--
