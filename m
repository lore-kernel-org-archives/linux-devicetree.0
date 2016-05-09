From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Mon, 9 May 2016 04:30:37 -0700 (PDT)
Message-ID: <13fce120-e6c9-4e27-a2fe-497da668e83e@googlegroups.com>
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
 <572B07C0.7080601@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_256_657442798.1462793437431"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBXXJYG4QKGQE2LDWGAA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <572B07C0.7080601-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_256_657442798.1462793437431
Content-Type: multipart/alternative;
	boundary="----=_Part_257_1198564685.1462793437433"

------=_Part_257_1198564685.1462793437433
Content-Type: text/plain; charset=UTF-8

Hi Olliver,

Sorry for the delay but I was on a place without Internet access.

Is there something wrong with the logs?

On Thursday, May 5, 2016 at 11:43:49 AM UTC+3, Olliver Schinagl wrote:
>
> Hey Christo,
>
> On 04-05-16 21:40, Christo Radev wrote:
>
> Hi Oliver,
>
> I start performance tests for eMMC, SD/MMC, USB, SATA SSD devices and will 
> post the result when ready.
>
> As a beginning I can say that eMMC is accessed via 4-bit bus without 
> matter of the patch used.
> There you are the content of /sys/kernel/debug/mmcX/ios (where X is number 
> of eMMC or SD/MMC device).
> Booted from SD card with 8-bit patched kernel
> root@egpr:~# dmesg | grep mmc
> [    3.599625] sunxi-mmc 1c0f000.mmc: Got CD GPIO
> [    3.631883] sunxi-mmc 1c0f000.mmc: base:0xf08da000 irq:26
> [    3.669058] mmc0: host does not support reading read-only switch, 
> assuming write-enable
> [    3.671674] sunxi-mmc 1c11000.mmc: base:0xf08de000 irq:27
> [    3.672064] mmc0: new high speed SDHC card at address 0007
> [    3.673068] mmcblk0: mmc0:0007 SD04G 3.71 GiB
> [    3.674785]  mmcblk0: p1
> [    3.682261] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RTO !!
> [    3.689280] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
> [    3.690146] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
> [    3.690977] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
> [    3.691808] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 55, RTO !!
> [    3.745505] mmc1: MAN_BKOPS_EN bit is not set
> [    3.749187] sunxi-mmc 1c11000.mmc: smc 1 err, cmd 8, RD EBE !!
> [    3.749229] sunxi-mmc 1c11000.mmc: data error, sending stop command
> [    3.749247] sunxi-mmc 1c11000.mmc: send stop command failed
> [    3.749268] mmc1: switch to bus width 2 failed
> [    3.753586] mmc1: new high speed MMC card at address 0001
> [    3.754479] mmcblk1: mmc1:0001 P1XXXX 3.60 GiB
> [    3.754961] mmcblk1boot0: mmc1:0001 P1XXXX partition 1 16.0 MiB
> [    3.755604] mmcblk1boot1: mmc1:0001 P1XXXX partition 2 16.0 MiB
> [    3.757045]  mmcblk1: p1
> [    4.216879] EXT4-fs (mmcblk0p1): mounted filesystem with writeback 
> data mode. Opts: (null)
> [    7.907002] EXT4-fs (mmcblk0p1): re-mounted. Opts: commit=600,errors=
> remount-ro
>
> root@egpr:~# cat /sys/kernel/debug/mmc0/ios
> clock:          50000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    2 (sd high-speed)
> signal voltage: 0 (3.30 V)
> driver type:    0 (driver type B)
> root@egpr:~# cat /sys/kernel/debug/mmc1/ios
> clock:          50000000 Hz
> vdd:            21 (3.3 ~ 3.4 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      2 (4 bits)
> timing spec:    1 (mmc high-speed)
> signal voltage: 0 (3.30<span s
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_257_1198564685.1462793437433
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Olliver,<br><br>Sorry for the delay but I was on a plac=
e without Internet access.<br><br>Is there something wrong with the logs?<b=
r><br>On Thursday, May 5, 2016 at 11:43:49 AM UTC+3, Olliver Schinagl wrote=
:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;bo=
rder-left: 1px #ccc solid;padding-left: 1ex;">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hey Christo,<br>
    <br>
    <div>On 04-05-16 21:40, Christo Radev wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Hi Oliver,<br>
        <br>
        I start performance tests for eMMC, SD/MMC, USB, SATA SSD
        devices and will post the result when ready.<br>
        <br>
        As a beginning I can say that eMMC is accessed via 4-bit bus
        without matter of the patch used.<br>
        There you are the content of /sys/kernel/debug/mmcX/ios (where X
        is number of eMMC or SD/MMC device).<br>
        <div style=3D"background-color:rgb(250,250,250);border-color:rgb(18=
7,187,187);border-style:solid;border-width:1px;word-wrap:break-word"><code>
            <div><span style=3D"color:#606">Booted</span><span style=3D"col=
or:#000"> </span><span style=3D"color:#008">from</span><span style=3D"color=
:#000"> SD card
              </span><span style=3D"color:#008">with</span><span style=3D"c=
olor:#000"> </span><span style=3D"color:#066">8</span><span style=3D"color:=
#660">-</span><span style=3D"color:#000">bit
                patched kernel<br>
                root@egpr</span><span style=3D"color:#660">:~</span><span s=
tyle=3D"color:#800"># dmesg | grep mmc</span><span style=3D"color:#000"><br=
>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.599625</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c0f000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> </span><span style=3D"color:#606">Got</span><spa=
n style=3D"color:#000"> CD GPIO<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.631883</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c0f000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> </span><span style=3D"color:#008">base</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#066">0xf08da000</span=
><span style=3D"color:#000"> irq</span><span style=3D"color:#660">:</span><=
span style=3D"color:#066">26</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.669058</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmc0</span><span=
 style=3D"color:#660">:</span><span style=3D"color:#000"> host
                does </span><span style=3D"color:#008">not</span><span styl=
e=3D"color:#000"> support reading read</span><span style=3D"color:#660">-</=
span><span style=3D"color:#000">only </span><span style=3D"color:#008">swit=
ch</span><span style=3D"color:#660">,</span><span style=3D"color:#000">
                assuming write</span><span style=3D"color:#660">-</span><sp=
an style=3D"color:#000">enable<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.671674</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> </span><span style=3D"color:#008">base</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#066">0xf08de000</span=
><span style=3D"color:#000"> irq</span><span style=3D"color:#660">:</span><=
span style=3D"color:#066">27</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.672064</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmc0</span><span=
 style=3D"color:#660">:</span><span style=3D"color:#000"> </span><span styl=
e=3D"color:#008">new</span><span style=3D"color:#000"> high
                speed SDHC card at address </span><span style=3D"color:#066=
">0007</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.673068</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmcblk0</span><s=
pan style=3D"color:#660">:</span><span style=3D"color:#000"> mmc0</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#066">0007</span><span=
 style=3D"color:#000"> SD04G </span><span style=3D"color:#066">3.71</span><=
span style=3D"color:#000"> </span><span style=3D"color:#606">GiB</span><spa=
n style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.674785</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000">
                =C2=A0mmcblk0</span><span style=3D"color:#660">:</span><spa=
n style=3D"color:#000"> p1<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.682261</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">8</span><span=
 style=3D"color:#660">,</span><span style=3D"color:#000"> RTO </span><span =
style=3D"color:#660">!!</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.689280</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">55</span><spa=
n style=3D"color:#660">,</span><span style=3D"color:#000"> RTO </span><span=
 style=3D"color:#660">!!</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.690146</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">55</span><spa=
n style=3D"color:#660">,</span><span style=3D"color:#000"> RTO </span><span=
 style=3D"color:#660">!!</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.690977</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">55</span><spa=
n style=3D"color:#660">,</span><span style=3D"color:#000"> RTO </span><span=
 style=3D"color:#660">!!</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.691808</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">55</span><spa=
n style=3D"color:#660">,</span><span style=3D"color:#000"> RTO </span><span=
 style=3D"color:#660">!!</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.745505</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmc1</span><span=
 style=3D"color:#660">:</span><span style=3D"color:#000">
                MAN_BKOPS_EN bit </span><span style=3D"color:#008">is</span=
><span style=3D"color:#000"> </span><span style=3D"color:#008">not</span><s=
pan style=3D"color:#000"> </span><span style=3D"color:#008">set</span><span=
 style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.749187</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> smc </span><span style=3D"color:#066">1</span><s=
pan style=3D"color:#000"> err</span><span style=3D"color:#660">,</span><spa=
n style=3D"color:#000"> cmd </span><span style=3D"color:#066">8</span><span=
 style=3D"color:#660">,</span><span style=3D"color:#000"> RD EBE
              </span><span style=3D"color:#660">!!</span><span style=3D"col=
or:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.749229</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> data
                error</span><span style=3D"color:#660">,</span><span style=
=3D"color:#000"> sending stop command<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.749247</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><spa=
n style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><span =
style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span><=
span style=3D"color:#000"> send
                stop command failed<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.749268</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmc1</span><span=
 style=3D"color:#660">:</span><span style=3D"color:#000"> </span><span styl=
e=3D"color:#008">switch</span><span style=3D"color:#000"> to bus
                width </span><span style=3D"color:#066">2</span><span style=
=3D"color:#000"> failed<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.753586</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmc1</span><span=
 style=3D"color:#660">:</span><span style=3D"color:#000"> </span><span styl=
e=3D"color:#008">new</span><span style=3D"color:#000"> high
                speed MMC card at address </span><span style=3D"color:#066"=
>0001</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.754479</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> mmcblk1</span><s=
pan style=3D"color:#660">:</span><span style=3D"color:#000"> mmc1</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#066">0001</span><span=
 style=3D"color:#000"> P1XXXX
              </span><span style=3D"color:#066">3.60</span><span style=3D"c=
olor:#000"> </span><span style=3D"color:#606">GiB</span><span style=3D"colo=
r:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.754961</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000">
                mmcblk1boot0</span><span style=3D"color:#660">:</span><span=
 style=3D"color:#000"> mmc1</span><span style=3D"color:#660">:</span><span =
style=3D"color:#066">0001</span><span style=3D"color:#000"> P1XXXX
                partition </span><span style=3D"color:#066">1</span><span s=
tyle=3D"color:#000"> </span><span style=3D"color:#066">16.0</span><span sty=
le=3D"color:#000"> </span><span style=3D"color:#606">MiB</span><span style=
=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.755604</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000">
                mmcblk1boot1</span><span style=3D"color:#660">:</span><span=
 style=3D"color:#000"> mmc1</span><span style=3D"color:#660">:</span><span =
style=3D"color:#066">0001</span><span style=3D"color:#000"> P1XXXX
                partition </span><span style=3D"color:#066">2</span><span s=
tyle=3D"color:#000"> </span><span style=3D"color:#066">16.0</span><span sty=
le=3D"color:#000"> </span><span style=3D"color:#606">MiB</span><span style=
=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.757045</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000">
                =C2=A0mmcblk1</span><span style=3D"color:#660">:</span><spa=
n style=3D"color:#000"> p1<br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.216879</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> EXT4</span><span=
 style=3D"color:#660">-</span><span style=3D"color:#000">fs </span><span st=
yle=3D"color:#660">(</span><span style=3D"color:#000">mmcblk0p1</span><span=
 style=3D"color:#660">):</span><span style=3D"color:#000"> mounted
                filesystem </span><span style=3D"color:#008">with</span><sp=
an style=3D"color:#000">
                writeback data mode</span><span style=3D"color:#660">.</spa=
n><span style=3D"color:#000"> </span><span style=3D"color:#606">Opts</span>=
<span style=3D"color:#660">:</span><span style=3D"color:#000"> </span><span=
 style=3D"color:#660">(</span><span style=3D"color:#008">null</span><span s=
tyle=3D"color:#660">)</span><span style=3D"color:#000"><br>
              </span><span style=3D"color:#660">[</span><span style=3D"colo=
r:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">7.907002</span><spa=
n style=3D"color:#660">]</span><span style=3D"color:#000"> EXT4</span><span=
 style=3D"color:#660">-</span><span style=3D"color:#000">fs </span><span st=
yle=3D"color:#660">(</span><span style=3D"color:#000">mmcblk0p1</span><span=
 style=3D"color:#660">):</span><span style=3D"color:#000"> re</span><span s=
tyle=3D"color:#660">-</span><span style=3D"color:#000">mounted</span><span =
style=3D"color:#660">.</span><span style=3D"color:#000"> </span><span style=
=3D"color:#606">Opts</span><span style=3D"color:#660">:</span><span style=
=3D"color:#000"> commit</span><span style=3D"color:#660">=3D</span><span st=
yle=3D"color:#066">600</span><span style=3D"color:#660">,</span><span style=
=3D"color:#000">errors</span><span style=3D"color:#660">=3D</span><span sty=
le=3D"color:#000">remount</span><span style=3D"color:#660">-</span><span st=
yle=3D"color:#000">ro<br>
                <br>
                root@egpr</span><span style=3D"color:#660">:~</span><span s=
tyle=3D"color:#800"># cat
                /sys/kernel/debug/mmc0/ios</span><span style=3D"color:#000"=
><br>
                clock</span><span style=3D"color:#660">:</span><span style=
=3D"color:#000"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"co=
lor:#066">50000000</span><span style=3D"color:#000"> </span><span style=3D"=
color:#606">Hz</span><span style=3D"color:#000"><br>
                vdd</span><span style=3D"color:#660">:</span><span style=3D=
"color:#000"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=
=3D"color:#066">21</span><span style=3D"color:#000"> </span><span style=3D"=
color:#660">(</span><span style=3D"color:#066">3.3</span><span style=3D"col=
or:#000"> </span><span style=3D"color:#660">~</span><span style=3D"color:#0=
00"> </span><span style=3D"color:#066">3.4</span><span style=3D"color:#000"=
> V</span><span style=3D"color:#660">)</span><span style=3D"color:#000"><br=
>
                bus mode</span><span style=3D"color:#660">:</span><span sty=
le=3D"color:#000"> =C2=A0 =C2=A0 =C2=A0 </span><span style=3D"color:#066">2=
</span><span style=3D"color:#000"> </span><span style=3D"color:#660">(</spa=
n><span style=3D"color:#000">push</span><span style=3D"color:#660">-</span>=
<span style=3D"color:#000">pull</span><span style=3D"color:#660">)</span><s=
pan style=3D"color:#000"><br>
                chip </span><span style=3D"color:#008">select</span><span s=
tyle=3D"color:#660">:</span><span style=3D"color:#000"> =C2=A0 =C2=A0</span=
><span style=3D"color:#066">0</span><span style=3D"color:#000"> </span><spa=
n style=3D"color:#660">(</span><span style=3D"color:#000">don</span><span s=
tyle=3D"color:#080">&#39;t care)<br>
                power mode: =C2=A0 =C2=A0 2 (on)<br>
                bus width: =C2=A0 =C2=A0 =C2=A02 (4 bits)<br>
                timing spec: =C2=A0 =C2=A02 (sd high-speed)<br>
                signal voltage: 0 (3.30 V)<br>
                driver type: =C2=A0 =C2=A00 (driver type B)<br>
                root@egpr:~# cat /sys/kernel/debug/mmc1/ios<br>
                clock: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050000000 Hz<br>
                vdd: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A021 (3.3 ~ 3.4=
 V)<br>
                bus mode: =C2=A0 =C2=A0 =C2=A0 2 (push-pull)<br>
                chip select: =C2=A0 =C2=A00 (don&#39;</span><span style=3D"=
color:#000">t care</span><span style=3D"color:#660">)</span><span style=3D"=
color:#000"><br>
                power mode</span><span style=3D"color:#660">:</span><span s=
tyle=3D"color:#000"> =C2=A0 =C2=A0 </span><span style=3D"color:#066">2</spa=
n><span style=3D"color:#000"> </span><span style=3D"color:#660">(</span><sp=
an style=3D"color:#000">on</span><span style=3D"color:#660">)</span><span s=
tyle=3D"color:#000"><br>
                bus width</span><span style=3D"color:#660">:</span><span st=
yle=3D"color:#000"> =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color:#066">2=
</span><span style=3D"color:#000"> </span><span style=3D"color:#660">(</spa=
n><span style=3D"color:#066">4</span><span style=3D"color:#000"> bits</span=
><span style=3D"color:#660">)</span><span style=3D"color:#000"><br>
                timing spec</span><span style=3D"color:#660">:</span><span =
style=3D"color:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">1</spa=
n><span style=3D"color:#000"> </span><span style=3D"color:#660">(</span><sp=
an style=3D"color:#000">mmc high</span><span style=3D"color:#660">-</span><=
span style=3D"color:#000">speed</span><span style=3D"color:#660">)</span><s=
pan style=3D"color:#000"><br>
                signal voltage</span><span style=3D"color:#660">:</span><sp=
an style=3D"color:#000"> </span><span style=3D"color:#066">0</span><span st=
yle=3D"color:#000"> </span><span style=3D"color:#660">(</span><span style=
=3D"color:#066">3.30</span>&lt;span
                s</div></code></div></div></blockquote></div></blockquote><=
div><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_257_1198564685.1462793437433--

------=_Part_256_657442798.1462793437431--
