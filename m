From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Wed, 4 May 2016 12:40:37 -0700 (PDT)
Message-ID: <4375220a-f939-4ed0-a6d7-2cf887b07509@googlegroups.com>
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
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_2503_592380833.1462390837681"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBNVAVG4QKGQEP3N5V2Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <572A10B3.2020803-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_2503_592380833.1462390837681
Content-Type: multipart/alternative;
	boundary="----=_Part_2504_1157666277.1462390837684"

------=_Part_2504_1157666277.1462390837684
Content-Type: text/plain; charset=UTF-8

Hi Oliver,

I start performance tests for eMMC, SD/MMC, USB, SATA SSD devices and will 
post the result when ready.

As a beginning I can say that eMMC is accessed via 4-bit bus without matter 
of the patch used.
There you are the content of /sys/kernel/debug/mmcX/ios (where X is number 
of eMMC or SD/MMC device).
Booted from SD card with 8-bit patched kernel
root@egpr:~# dmesg | grep mmc
[    3.599625] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    3.631883] sunxi-mmc 1c0f000.mmc: base:0xf08da000 irq:26
[    3.669058] mmc0: host does not support reading read-only switch, 
assuming write-enable
[    3.671674] sunxi-mmc 1c11000.mmc: base:0xf08de000 irq:27
[    3.672064] mmc0: new high speed SDHC card at address 0007
[    3.673068] mmcblk0: mmc0:0007 SD04G 3.71 GiB
[    3.674785]  mmcblk0: p1
[    3.682261] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RTO !!
[    3.689280] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.690146] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.690977] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.691808] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.745505] mmc1: MAN_BKOPS_EN bit is not set
[    3.749187] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RD EBE !!
[    3.749229] sunxi-mmc 1c11000.mmc: data error, sending stop command
[    3.749247] sunxi-mmc 1c11000.mmc: send stop command failed
[    3.749268] mmc1: switch to bus width 2 failed
[    3.753586] mmc1: new high speed MMC card at address 0001
[    3.754479] mmcblk1: mmc1:0001 P1XXXX 3.60 GiB
[    3.754961] mmcblk1boot0: mmc1:0001 P1XXXX partition 1 16.0 MiB
[    3.755604] mmcblk1boot1: mmc1:0001 P1XXXX partition 2 16.0 MiB
[    3.757045]  mmcblk1: p1
[    4.216879] EXT4-fs (mmcblk0p1): mounted filesystem with writeback data 
mode. Opts: (null)
[    7.907002] EXT4-fs (mmcblk0p1): re-mounted. Opts: commit=600,errors=
remount-ro

root@egpr:~# cat /sys/kernel/debug/mmc0/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
root@egpr:~# cat /sys/kernel/debug/mmc1/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    1 (mmc high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

Booted from SATA SSD with 4-bit patched kernel
[    3.598868] sunxi-mmc 1c0f000.mmc: Got CD GPIO
[    3.631154] sunxi-mmc 1c0f000.mmc: base:0xf08da000 irq:26
[    3.668313] mmc0: host does not support reading read-only switch, 
assuming write-enable
[    3.670908] sunxi-mmc 1c11000.mmc: base:0xf08de000 irq:27
[    3.671324] mmc0: new high speed SDHC card at address 0007
[    3.672302] mmcblk0: mmc0:0007 SD04G 3.71 GiB
[    3.674067]  mmcblk0: p1
[    3.681882] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RTO !!
[    3.686129] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.686996] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.687843] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.688672] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
[    3.724762] mmc1: MAN_BKOPS_EN bit is not set
[    3.731196] mmc1: new high speed MMC card at address 0001
[    3.732141] mmcblk1: mmc1:0001 P1XXXX 3.60 GiB
[    3.732553] mmcblk1boot0: mmc1:0001 P1XXXX partition 1 16.0 MiB
[    3.732960] mmcblk1boot1: mmc1:0001 P1XXXX partition 2 16.0 MiB
[    3.734186]  mmcblk1: p1

root@egpr:~# cat /sys/kernel/debug/mmc0/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)
root@egpr:~# cat /sys/kernel/debug/mmc1/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    1 (mmc high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

The brief performance test using dd shows the similar results to both 4- 
and 8-bit patches
eMMC 8-bit patch R/W test with dd
root@egpr:/mnt# dd if=/dev/zero of=1GBfile bs=1M count=1K
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 79.9305 s, 13.4 MB/s
root@egpr:/mnt# dd of=/dev/null if=1GBfile
2097152+0 records in
2097152+0 records out
1073741824 bytes (1.1 GB) copied, 49.5899 s, 21.7 MB/s

eMMC 4-bit patch R/W test with dd
root@egpr:/mnt# dd if=/dev/zero of=1GBfile bs=1M count=1K
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 78.7925 s, 13.6 MB/s
root@egpr:/mnt# dd of=/dev/null if=1GBfile
2097152+0 records in
2097152+0 records out
1073741824 bytes (1.1 GB) copied, 53.8002 s, 20.0 MB/s

In my opinion 8-bit access to eMMC is broken in Allwinned A20 or in the mmc 
driver.

Best regards
Chris

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_2504_1157666277.1462390837684
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oliver,<br><br>I start performance tests for eMMC, SD/M=
MC, USB, SATA SSD devices and will post the result when ready.<br><br>As a =
beginning I can say that eMMC is accessed via 4-bit bus without matter of t=
he patch used.<br>There you are the content of /sys/kernel/debug/mmcX/ios (=
where X is number of eMMC or SD/MMC device).<br><div class=3D"prettyprint" =
style=3D"background-color: rgb(250, 250, 250); border-color: rgb(187, 187, =
187); border-style: solid; border-width: 1px; word-wrap: break-word;"><code=
 class=3D"prettyprint"><div class=3D"subprettyprint"><span style=3D"color: =
#606;" class=3D"styled-by-prettify">Booted</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=
=3D"styled-by-prettify">from</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> SD card </span><span style=3D"color: #008;" class=3D"sty=
led-by-prettify">with</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">bit patched kern=
el<br>root@egpr</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">:~</span><span style=3D"color: #800;" class=3D"styled-by-prettify"># d=
mesg | grep mmc</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.59=
9625</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">1c0f000.mmc</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" class=
=3D"styled-by-prettify">Got</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> CD GPIO<br></span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">3.631883</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000.mmc</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #008;" class=3D"styled-by-prettify">base</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">0xf08da000</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> irq</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">26</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.66905=
8</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
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
y-prettify">3.671674</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #008;" class=3D"styled-by-prettify">base</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">:</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">0xf08de000</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> irq</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">27</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.67206=
4</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">new</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> high speed SDHC card at address </span><span st=
yle=3D"color: #066;" class=3D"styled-by-prettify">0007</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">3.673068</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> mmcblk0</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0007</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> SD04=
G </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.71</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #606;" class=3D"styled-by-prettify">GiB</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">3.674785</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0mmcblk0</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> p1<br></span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">3.682261</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> smc </span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> err</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> cmd </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">8</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> RT=
O </span><span style=3D"color: #660;" class=3D"styled-by-prettify">!!</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">3.689280</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify">mmc </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> smc </span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> er=
r</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </span><span =
style=3D"color: #066;" class=3D"styled-by-prettify">55</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> RTO </span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">!!</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">3.690146</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> smc </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> err</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> cmd </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">55</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> RTO </span><span style=3D"color: #660;" class=3D"styled-by-prettify">!!<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">3.690977</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> smc </span><span style=3D"color: #066;" class=3D"styled-by=
-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> err</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">55</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> RTO </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">!!</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">3.691808</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </sp=
an><span style=3D"color: #066;" class=3D"styled-by-prettify">1c11000.mmc</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> smc </span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> err</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> cmd </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">55</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> RTO </span><span style=3D"color: #660;" class=3D"styled-by-prettify">!!<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">3.745505</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> mmc1</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> MAN_BKOPS_EN bit </span><span style=3D"color: =
#008;" class=3D"styled-by-prettify">is</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"s=
tyled-by-prettify">not</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettif=
y">set</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">3.749187</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> smc </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> err</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> cmd =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">8</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> RD EBE </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">!!</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">3.749229</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1c=
11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> data erro=
r</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> sending stop comm=
and<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.74924=
7</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> send stop command failed<br></span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">3.749268</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> mmc1</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by-=
prettify">switch</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> to bus width </span><span style=3D"color: #066;" class=3D"styled-by-=
prettify">2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> failed<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.7=
53586</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #008;" class=3D"styled-by-prettify">new</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> high speed MMC card at address </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">0001</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">3.754479</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> mmcblk1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> P1XX=
XX </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.60</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #606;" class=3D"styled-by-prettify">GiB</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">3.754961</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> mmcblk1boot0</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
P1XXXX partition </span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> <=
/span><span style=3D"color: #066;" class=3D"styled-by-prettify">16.0</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #606;" class=3D"styled-by-prettify">MiB</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">3.755604</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> mmcblk1boot1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> P1XX=
XX partition </span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">16.0</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">MiB</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">3.757045</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> =C2=A0mmcblk1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> p1<br></span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">4.216879</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> EXT=
4</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">fs </span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">mmcblk0p1</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">):</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> mounted filesystem </span><span style=3D"c=
olor: #008;" class=3D"styled-by-prettify">with</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> writeback data mode</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #606;" =
class=3D"styled-by-prettify">Opts</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">(</span><span style=3D"color: #008;" class=3D"styled-by-prettify">nul=
l</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">7.907002</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> EXT4</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">fs </span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">mmcblk0p1</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">):</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
re</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">mounted</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #606;" class=3D"styled-by-prettify">Opts</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> commit</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">600</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify">er=
rors</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">remount</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify">ro<br><br>root@egpr</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:~</span><span s=
tyle=3D"color: #800;" class=3D"styled-by-prettify"># cat /sys/kernel/debug/=
mmc0/ios</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><b=
r>clock</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">50000000</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #606;" class=3D"styled-by-prettif=
y">Hz</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>v=
dd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">21</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.3</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">~</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">3.4</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> V</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br>bus mode</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color: #066;" class=3D"styled-=
by-prettify">2</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">push</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">pull</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"><br>chip </span><span style=3D"color: #008;=
" class=3D"styled-by-prettify">select</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">don=
</span><span style=3D"color: #080;" class=3D"styled-by-prettify">&#39;t car=
e)<br>power mode: =C2=A0 =C2=A0 2 (on)<br>bus width: =C2=A0 =C2=A0 =C2=A02 =
(4 bits)<br>timing spec: =C2=A0 =C2=A02 (sd high-speed)<br>signal voltage: =
0 (3.30 V)<br>driver type: =C2=A0 =C2=A00 (driver type B)<br>root@egpr:~# c=
at /sys/kernel/debug/mmc1/ios<br>clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05=
0000000 Hz<br>vdd: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A021 (3.3 ~ 3.4 V=
)<br>bus mode: =C2=A0 =C2=A0 =C2=A0 2 (push-pull)<br>chip select: =C2=A0 =
=C2=A00 (don&#39;</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">t care</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>po=
wer mode</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 </span><span style=3D"color: #066;" class=3D"styled-by-prettify">2</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify">on</span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br>bus width</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">2</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">4</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> bits<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"><br>timing spec</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify">mmc high</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">speed</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"><br>signal voltage</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">3.30</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> V</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"><br>driver type</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">driver t=
ype B</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"><br><br></span=
><span style=3D"color: #606;" class=3D"styled-by-prettify">Booted</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #008;" class=3D"styled-by-prettify">from</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> SATA SSD </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">with</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">4</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">bit patched kernel<br></span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">3.598868</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy"> sunxi</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000.mmc</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Got</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"> CD GPIO<br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">3.631154</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1c0f000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #008;" class=3D"styled-by-prettify">base</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">0xf08da000</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> irq</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">26</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">3.668313</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> host does =
</span><span style=3D"color: #008;" class=3D"styled-by-prettify">not</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> support reading =
read</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">only </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">switch</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> assuming write</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">enable<br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">3.670908</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #008;" class=3D"styled-by-prettify">base</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span styl=
e=3D"color: #066;" class=3D"styled-by-prettify">0xf08de000</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> irq</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">27</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">[</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">3.671324</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">]</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> mmc0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">new</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> high speed SDHC card at ad=
dress </span><span style=3D"color: #066;" class=3D"styled-by-prettify">0007=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">3.672302</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> mmcblk0</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify"> mmc0</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">:</span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">0007</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> SD04G </span><span style=3D"color: #066;" class=3D"styled-by-p=
rettify">3.71</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #606;" class=3D"styled-by-prettify">GiB</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">3.674067</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">]</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> =C2=A0mmcblk0</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> p1<br></span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">3.681882</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prettify">1c=
11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> smc </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">8</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.68612=
9</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> smc </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> err</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> cmd </span><span style=3D"color: #066;" class=3D"styled-by-prettify">55</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">!!</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">3.686996</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> smc </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">55</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.68784=
3</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">mmc </span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">1c11000.mmc</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> smc </span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> err</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> cmd </span><span style=3D"color: #066;" class=3D"styled-by-prettify">55</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">!!</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">3.688672</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> sunxi</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">mmc </span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
1c11000.mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>:</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> smc </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">1</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> err</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> cmd </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">55</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> RTO </span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">!!</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">[</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.72476=
2</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> MAN_BKOPS_EN bit </span><span s=
tyle=3D"color: #008;" class=3D"styled-by-prettify">is</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
08;" class=3D"styled-by-prettify">not</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"st=
yled-by-prettify">set</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">[</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=
=A0 =C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
3.731196</span><span style=3D"color: #660;" class=3D"styled-by-prettify">]<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">new</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> high speed MMC card at address </span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">0001</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"colo=
r: #066;" class=3D"styled-by-prettify">3.732141</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> mmcblk1</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> P1=
XXXX </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.60<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #606;" class=3D"styled-by-prettify">GiB</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color:=
 #066;" class=3D"styled-by-prettify">3.732553</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> mmcblk1boot0</span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
 P1XXXX partition </span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">1</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">16.0</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span st=
yle=3D"color: #606;" class=3D"styled-by-prettify">MiB</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066=
;" class=3D"styled-by-prettify">3.732960</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> mmcblk1boot1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> mmc1</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">:</span><span style=3D"color: #066;" class=3D"styled-by-prettify"=
>0001</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> P1XX=
XX partition </span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">2</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </spa=
n><span style=3D"color: #066;" class=3D"styled-by-prettify">16.0</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #606;" class=3D"styled-by-prettify">MiB</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #6=
60;" class=3D"styled-by-prettify">[</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">3.734186</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">]</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> =C2=A0mmcblk1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> p1<br><br>root@egpr</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">:~</span><span style=3D"color: #800;" class=3D"sty=
led-by-prettify"># cat /sys/kernel/debug/mmc0/ios</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"><br>clock</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">50000000</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #606;" class=3D"styled-by-prettify">Hz</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"><br>vdd</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">21</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">3.3</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">~</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3.4=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> V</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br>bus mode</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 </span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">2</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">push</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">pull</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=
chip </span><span style=3D"color: #008;" class=3D"styled-by-prettify">selec=
t</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</sp=
an><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">don</span><span style=3D"color: #080;" cl=
ass=3D"styled-by-prettify">&#39;t care)<br>power mode: =C2=A0 =C2=A0 2 (on)=
<br>bus width: =C2=A0 =C2=A0 =C2=A02 (4 bits)<br>timing spec: =C2=A0 =C2=A0=
2 (sd high-speed)<br>signal voltage: 0 (3.30 V)<br>driver type: =C2=A0 =C2=
=A00 (driver type B)<br>root@egpr:~# cat /sys/kernel/debug/mmc1/ios<br>cloc=
k: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050000000 Hz<br>vdd: =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A021 (3.3 ~ 3.4 V)<br>bus mode: =C2=A0 =C2=A0 =C2=A0 =
2 (push-pull)<br>chip select: =C2=A0 =C2=A00 (don&#39;</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">t care</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br>power mode</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">2</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">(</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify">on</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>bus wid=
th</span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =
=C2=A0</span><span style=3D"color: #066;" class=3D"styled-by-prettify">2</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">4</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> bits</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"><br>timing spec</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">:</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> =C2=A0 =C2=A0</span><span style=3D"color: #066;" class=3D=
"styled-by-prettify">1</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc hi=
gh</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify">speed</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br>signal voltage</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #0=
66;" class=3D"styled-by-prettify">0</span><span style=3D"color: #000;" clas=
s=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-by-pre=
ttify">3.30</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> V</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>driver type<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">:</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span=
><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify">driver type B</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">)</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify"><br></span></div></code></div><br>The brief perfo=
rmance test using dd shows the similar results to both 4- and 8-bit patches=
<br><div class=3D"prettyprint" style=3D"background-color: rgb(250, 250, 250=
); border-color: rgb(187, 187, 187); border-style: solid; border-width: 1px=
; word-wrap: break-word;"><code class=3D"prettyprint"><div class=3D"subpret=
typrint"><span style=3D"color: #000;" class=3D"styled-by-prettify">eMMC </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">8</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">bit patch R</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">W test </span><span style=3D"color: #=
008;" class=3D"styled-by-prettify">with</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> dd<br>root@egpr</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #080;" cla=
ss=3D"styled-by-prettify">/mnt# dd if=3D/</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">dev</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">zero of</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prett=
ify">1GBfile</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> bs</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">1M</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> count</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D=
"color: #066;" class=3D"styled-by-prettify">1K</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;"=
 class=3D"styled-by-prettify">1024</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> records </span><span style=3D"color: #008;" class=3D"styled-by-prett=
ify">in</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #066;" class=3D"styled-by-prettify">1024</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span s=
tyle=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> records </span><span style=3D"co=
lor: #008;" class=3D"styled-by-prettify">out</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" c=
lass=3D"styled-by-prettify">1073741824</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> bytes </span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">1.1</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> GB</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> copied=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">79.9305</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"> s</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">13.4</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"> MB</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">s<br=
>root@egpr</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
:</span><span style=3D"color: #080;" class=3D"styled-by-prettify">/mnt# dd =
of=3D/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">dev<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">null</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #008;" class=3D"styled-by-prettify">if</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" clas=
s=3D"styled-by-prettify">1GBfile</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" class=3D"st=
yled-by-prettify">2097152</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">+</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> re=
cords </span><span style=3D"color: #008;" class=3D"styled-by-prettify">in</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><=
span style=3D"color: #066;" class=3D"styled-by-prettify">2097152</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">0</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> records </span><span style=3D"color:=
 #008;" class=3D"styled-by-prettify">out</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1073741824</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> bytes </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">1.1</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> GB</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> copied</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"=
color: #066;" class=3D"styled-by-prettify">49.5899</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> s</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">21.7</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> MB</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">s<br><b=
r>eMMC </span><span style=3D"color: #066;" class=3D"styled-by-prettify">4</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">bit patch R</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">W test </span><span style=3D=
"color: #008;" class=3D"styled-by-prettify">with</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> dd<br>root@egpr</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color: #=
080;" class=3D"styled-by-prettify">/mnt# dd if=3D/</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">dev</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">zero of</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"styled=
-by-prettify">1GBfile</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> bs</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettify">1M<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> count</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span=
 style=3D"color: #066;" class=3D"styled-by-prettify">1K</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">1024</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> records </span><span style=3D"color: #008;" class=3D"styl=
ed-by-prettify">in</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">1024</span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> records </span><span =
style=3D"color: #008;" class=3D"styled-by-prettify">out</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"co=
lor: #066;" class=3D"styled-by-prettify">1073741824</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"> bytes </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">1.1</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> GB</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> copied</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">78.7925</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"> s</span><span s=
tyle=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"c=
olor: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #06=
6;" class=3D"styled-by-prettify">13.6</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify"> MB</span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">s<br>root@egpr</span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">:</span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">/mnt# dd of=3D/</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">dev</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">/</span><span style=3D"color: #008;" class=3D"styled-by-prettify">null<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #008;" class=3D"styled-by-prettify">if</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #066;" class=3D"styled-by-prettify">1GBfile</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">2097152</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"> records </span><span style=3D"color: #008;" class=3D"styled-by-p=
rettify">in</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br></span><span style=3D"color: #066;" class=3D"styled-by-prettify">20971=
52</span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> records </span><span styl=
e=3D"color: #008;" class=3D"styled-by-prettify">out</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #=
066;" class=3D"styled-by-prettify">1073741824</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> bytes </span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">1.1</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> GB</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">)</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
> copied</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,<=
/span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><sp=
an style=3D"color: #066;" class=3D"styled-by-prettify">53.8002</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> s</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">20.0</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> MB</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">s<br></span></div></code></div><br>In my opinion 8-bit access to eMMC i=
s broken in Allwinned A20 or in the mmc driver.<br><br>Best regards<br>Chri=
s<br><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_2504_1157666277.1462390837684--

------=_Part_2503_592380833.1462390837681--
