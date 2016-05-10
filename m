From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 10 May 2016 10:25:40 -0700 (PDT)
Message-ID: <9745a80b-5444-43f7-b772-68684c96c9e5@googlegroups.com>
References: <1461827998-12192-1-git-send-email-oliver@schinagl.nl>
 <CAGb2v66E2TuN3+tYaAbniV3q67waDZOfqKAW14VJz6xZFomZ=Q@mail.gmail.com>
 <57285162.2000704@schinagl.nl>
 <CAGb2v66r9m7qVW6BszeT2wqs0KyEr4x5ivTJYqu2Fes=R9-Ltw@mail.gmail.com>
 <CANCTEQgjiuQXcaw=3Dr5kUsTPc3nsDQf2odwzs4nHvrkREAqrg@mail.gmail.com>
 <5729F07C.3080308@schinagl.nl>
 <948be370-4401-43cb-862e-d4376755a75d@googlegroups.com>
 <5729F6D6.8030100@schinagl.nl>
 <4704fa35-9a2a-4e6e-8fd4-f4778405c598@googlegroups.com>
 <572A0052.9060202@schinagl.nl>
 <2e745ef7-ddc0-40fc-b867-414543690276@googlegroups.com>
 <572A10B3.2020803@schinagl.nl>
 <4375220a-f939-4ed0-a6d7-2cf887b07509@googlegroups.com>
 <9fe7ebb6-6d74-4b73-b6d6-93b79650cdb6@googlegroups.com>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_813_53261897.1462901140978"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBFNTZC4QKGQEKHJ3TIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <9fe7ebb6-6d74-4b73-b6d6-93b79650cdb6-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_813_53261897.1462901140978
Content-Type: multipart/alternative;
	boundary="----=_Part_814_333234956.1462901140980"

------=_Part_814_333234956.1462901140980
Content-Type: text/plain; charset=UTF-8

Hi Olliver,

I try to build Armbian with kernel 4.5.0-rc6 by adding the patch as 
discussed here 
<https://groups.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQAJ>.
In addition I have to add following as well:
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 95c1923..9d6cfa8 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -695,6 +696,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
     sun7i-a20-olimex-som-evb.dtb \
     sun7i-a20-olinuxino-lime.dtb \
     sun7i-a20-olinuxino-lime2.dtb \
+    sun7i-a20-olinuxino-lime2-emmc.dtb \
     sun7i-a20-olinuxino-micro.dtb \
     sun7i-a20-orangepi.dtb \
     sun7i-a20-orangepi-mini.dtb \
to be able to compile the new sun7i-a20-olinuxino-lime2-emmc.dts file.

After booting I have renamed it to sun7i-a20-olinuxino-lime2.dts and reboot 
lime-eMMC board.

Unfortunately, I get some error messages:
root@lime2:~# dmesg | grep mmc
[    0.000000] Kernel command line: console=tty1 root=/dev/mmcblk0p1 
rootwait rootfstype=ext4 cgroup_enable=memory swapaccount=1 
sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve 
sunxi_fb_mem_reserve=16 hdmi.audio=EDID:0 disp.screen0_output_mode=
1920x1080p60 panic=10 consoleblank=0 enforcing=0 loglevel=1
[    3.721024] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    3.758926] sunxi-mmc 1c0f000.mmc: base:0xf08dc000 irq:26
[    3.759832] sunxi-mmc 1c11000.mmc: allocated mmc-pwrseq
[    4.528643] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
[    4.535700] mmc0: host does not support reading read-only switch, 
assuming write-enable
[    4.538253] mmc0: new high speed SDHC card at address 0002
[    4.539066] mmcblk0: mmc0:0002 00000 3.70 GiB
[    4.540959]  mmcblk0: p1
[    4.548773] sunxi-mmc 1c11000.mmc: base:0xf08f2000 irq:27
[    6.418686] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
[    6.600359] EXT4-fs (mmcblk0p1): mounted filesystem with writeback data 
mode. Opts: (null)
[    7.168650] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
[    7.918646] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
[    9.875182] EXT4-fs (mmcblk0p1): re-mounted. Opts: commit=600,errors=
remount-ro

Where could be the problem?

Best regards
Chris

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_814_333234956.1462901140980
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Olliver,<br><br>I try to build Armbian with kernel=
 4.5.0-rc6 by adding <a href=3D"https://groups.google.com/d/msg/linux-sunxi=
/vSC4vx8_ok8/K0jW8bmcAQAJ">the patch as discussed here</a>.<br>In addition =
I have to add following as well:<br><div class=3D"prettyprint" style=3D"bac=
kground-color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border=
-style: solid; border-width: 1px; word-wrap: break-word;"><code class=3D"pr=
ettyprint"><div class=3D"subprettyprint"><span style=3D"color: #000;" class=
=3D"styled-by-prettify">diff </span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">--</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">git a</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">arc=
h</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">arm</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">boot</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">dts</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">/</span><span style=3D"color: #606;" class=3D"styled-by-=
prettify">Makefile</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> b</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">arch</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify">arm</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">boot</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">dts</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">/</span><span style=3D"color: #606;" class=3D"styled-by-pretti=
fy">Makefile</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br>index </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">95c1923.</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
.</span><span style=3D"color: #066;" class=3D"styled-by-prettify">9d6cfa8</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">100644</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">---</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> a</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify">arch</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify">arm</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">boot</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">dts</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #60=
6;" class=3D"styled-by-prettify">Makefile</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">+++</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> b</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>arch</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">arm</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">boot</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify">dts</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">/</span><span style=3D"color: #606;" class=3D"styl=
ed-by-prettify">Makefile</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">695</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">6</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">696</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">,</span><span style=3D"color: #066;" class=3D"styled-by-prettify">7=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> dtb</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">$</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">CONFIG_MACH_SUN7I</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">+=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 </span><span style=3D"color: #660;" class=3D"styled-by-prettify">\</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =
=C2=A0sun7i</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">a20</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify">olimex</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">som</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">evb</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">dtb </span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">\</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=
=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">a20</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">olinuxino</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">lime</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">dtb </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">\</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">olinuxino</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">lime2</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">dtb </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">\</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0sun7i</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">a20</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">olinuxino</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">lime2</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>emmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">dtb </span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">\</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0sun7=
i</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">a20</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">olinuxino</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">micro</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">dtb </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">\</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br>=C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify">a20</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">oran=
gepi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">dtb </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">\</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0sun7=
i</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">a20</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">orangepi</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">mini</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">dtb </span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">\</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span></div></code></div>to be able to compile the new sun7i-a20-olinu=
xino-lime2-emmc.dts file.<br><br>After booting I have renamed it to sun7i-a=
20-olinuxino-lime2.dts and reboot lime-eMMC board.<br><br>Unfortunately, I =
get some error messages:<br><div class=3D"prettyprint" style=3D"background-=
color: rgb(250, 250, 250); border-color: rgb(187, 187, 187); border-style: =
solid; border-width: 1px; word-wrap: break-word;"><code class=3D"prettyprin=
t"><div class=3D"subprettyprint"><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">root@lime2</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">:~</span><span style=3D"color: #800;" class=3D"styled-by-pr=
ettify"># dmesg | grep mmc</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">0.000000</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #606;" class=3D"styled-by-prettify">Kernel</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> command line</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> console</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">tty1 root</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #08=
0;" class=3D"styled-by-prettify">/dev/</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">mmcblk0p1 rootwait rootfstype</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">ext4 cgroup_enable</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">memory swapaccount</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> sunxi_ve_mem_reserve</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> sunxi_g2d_mem_reserve</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">16</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> hdmi</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">audio</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify">EDID</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> di=
sp</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">screen0_output_mo=
de</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">1920x1080p60</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> panic</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">10</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> consoleblank</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> enforcing</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> loglevel</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">3.721024</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">1c0f000.mmc</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=3D"style=
d-by-prettify">Got</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> CD GPIO<br></span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">3.758926</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">1c0f000.mmc</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #00=
8;" class=3D"styled-by-prettify">base</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">0xf08dc000</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> irq</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">26</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">3.759832</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> allocated mmc</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">pwrseq<br></span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">4.528643</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> fatal err update clk timeo=
ut<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">4.53570=
0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> host does </span><span style=3D=
"color: #008;" class=3D"styled-by-prettify">not</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"> support reading read</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify">only </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">switch</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> assuming write</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">enable<br></span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">4.538253</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #008;" class=3D"styled-by-prettify">new</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> high speed SDHC card at add=
ress </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0002<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">4.539066</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> mmcblk0</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> mmc0</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">0002</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">00000</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.70</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #606;" class=3D"styled-by-prettify">GiB</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">4.540959</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0mmcblk0</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> p1<br></span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">4.548773</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sun=
xi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
008;" class=3D"styled-by-prettify">base</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">0xf08f2000</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> irq</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">27</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</sp=
an><span style=3D"color: #066;" class=3D"styled-by-prettify">6.418686</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> fatal err update clk timeout<br></span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">6.600359</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> EXT4</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">fs </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>mmcblk0p1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
):</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> mounted=
 filesystem </span><span style=3D"color: #008;" class=3D"styled-by-prettify=
">with</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> wri=
teback data mode</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #606;" class=3D"styled-by-prettify">Opts</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #008;"=
 class=3D"styled-by-prettify">null</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">7.168650</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span sty=
le=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> fatal err update clk timeout<br><=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">7.918646</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> fatal err update clk timeout<br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">9.875182</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> EXT4</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">fs </span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">m=
mcblk0p1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">):=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> re</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">mounted</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Opts</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> commit</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">600</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">errors</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">remount</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">ro<br></span></div></code></div><b=
r>Where could be the problem?<br><br>Best regards<br>Chris<br><br></div></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_814_333234956.1462901140980--

------=_Part_813_53261897.1462901140978--
