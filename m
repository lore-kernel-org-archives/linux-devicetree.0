From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Thu, 5 May 2016 10:43:44 +0200
Message-ID: <572B07C0.7080601@schinagl.nl>
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
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------070101080301000702070106"
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBQ4PVS4QKGQERK2VWSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <4375220a-f939-4ed0-a6d7-2cf887b07509-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--------------070101080301000702070106
Content-Type: text/plain; charset=UTF-8; format=flowed

Hey Christo,

On 04-05-16 21:40, Christo Radev wrote:
> Hi Oliver,
>
> I start performance tests for eMMC, SD/MMC, USB, SATA SSD devices and 
> will post the result when ready.
>
> As a beginning I can say that eMMC is accessed via 4-bit bus without 
> matter of the patch used.
> There you are the content of /sys/kernel/debug/mmcX/ios (where X is 
> number of eMMC or SD/MMC device).
> |
> BootedfromSD card with8-bit patched kernel
> root@egpr:~# dmesg | grep mmc
> [3.599625]sunxi-mmc 1c0f000.mmc:GotCD GPIO
> [3.631883]sunxi-mmc 1c0f000.mmc:base:0xf08da000irq:26
> [3.669058]mmc0:host does notsupport reading read-only switch,assuming 
> write-enable
> [3.671674]sunxi-mmc 1c11000.mmc:base:0xf08de000irq:27
> [3.672064]mmc0:newhigh speed SDHC card at address 0007
> [3.673068]mmcblk0:mmc0:0007SD04G 3.71GiB
> [3.674785] mmcblk0:p1
> [3.682261]sunxi-mmc 1c11000.mmc:smc 1err,cmd 8,RTO !!
> [3.689280]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.690146]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.690977]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.691808]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.745505]mmc1:MAN_BKOPS_EN bit isnotset
> [3.749187]sunxi-mmc 1c11000.mmc:smc 1err,cmd 8,RD EBE !!
> [3.749229]sunxi-mmc 1c11000.mmc:data error,sending stop command
> [3.749247]sunxi-mmc 1c11000.mmc:send stop command failed
> [3.749268]mmc1:switchto bus width 2failed
> [3.753586]mmc1:newhigh speed MMC card at address 0001
> [3.754479]mmcblk1:mmc1:0001P1XXXX 3.60GiB
> [3.754961]mmcblk1boot0:mmc1:0001P1XXXX partition 116.0MiB
> [3.755604]mmcblk1boot1:mmc1:0001P1XXXX partition 216.0MiB
> [3.757045] mmcblk1:p1
> [4.216879]EXT4-fs (mmcblk0p1):mounted filesystem withwriteback data 
> mode.Opts:(null)
> [7.907002]EXT4-fs (mmcblk0p1):re-mounted.Opts:commit=600,errors=remount-ro
>
> root@egpr:~# cat /sys/kernel/debug/mmc0/ios
> clock:50000000Hz
> vdd:21(3.3~3.4V)
> bus mode:2(push-pull)
> chip select:0(don't care)
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
> power mode:2(on)
> bus width:2(4bits)
> timing spec:1(mmc high-speed)
> signal voltage:0(3.30V)
> driver type:0(driver type B)
>
> BootedfromSATA SSD with4-bit patched kernel
> [3.598868]sunxi-mmc 1c0f000.mmc:GotCD GPIO
> [3.631154]sunxi-mmc 1c0f000.mmc:base:0xf08da000irq:26
> [3.668313]mmc0:host does notsupport reading read-only switch,assuming 
> write-enable
> [3.670908]sunxi-mmc 1c11000.mmc:base:0xf08de000irq:27
> [3.671324]mmc0:newhigh speed SDHC card at address 0007
> [3.672302]mmcblk0:mmc0:0007SD04G 3.71GiB
> [3.674067] mmcblk0:p1
> [3.681882]sunxi-mmc 1c11000.mmc:smc 1err,cmd 8,RTO !!
> [3.686129]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.686996]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.687843]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.688672]sunxi-mmc 1c11000.mmc:smc 1err,cmd 55,RTO !!
> [3.724762]mmc1:MAN_BKOPS_EN bit isnotset
> [3.731196]mmc1:newhigh speed MMC card at address 0001
> [3.732141]mmcblk1:mmc1:0001P1XXXX 3.60GiB
> [3.732553]mmcblk1boot0:mmc1:0001P1XXXX partition 116.0MiB
> [3.732960]mmcblk1boot1:mmc1:0001P1XXXX partition 216.0MiB
> [3.734186] mmcblk1:p1
>
> root@egpr:~# cat /sys/kernel/debug/mmc0/ios
> clock:50000000Hz
> vdd:21(3.3~3.4V)
> bus mode:2(push-pull)
> chip select:0(don't care)
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
> power mode:2(on)
> bus width:2(4bits)
> timing spec:1(mmc high-speed)
> signal voltage:0(3.30V)
> driver type:0(driver type B)
> |
>
> The brief performance test using dd shows the similar results to both 
> 4- and 8-bit patches
> |
> eMMC 8-bit patch R/W test withdd
> root@egpr:/mnt# dd if=/dev/zero of=1GBfilebs=1Mcount=1K
> 1024+0records in
> 1024+0records out
> 1073741824bytes (1.1GB)copied,79.9305s,13.4MB/s
> root@egpr:/mnt# dd of=/dev/nullif=1GBfile
> 2097152+0records in
> 2097152+0records out
> 1073741824bytes (1.1GB)copied,49.5899s,21.7MB/s
>
> eMMC 4-bit patch R/W test withdd
> root@egpr:/mnt# dd if=/dev/zero of=1GBfilebs=1Mcount=1K
> 1024+0records in
> 1024+0records out
> 1073741824bytes (1.1GB)copied,78.7925s,13.6MB/s
> root@egpr:/mnt# dd of=/dev/nullif=1GBfile
> 2097152+0records in
> 2097152+0records out
> 1073741824bytes (1.1GB)copied,53.8002s,20.0MB/s
> |
>
> In my opinion 8-bit access to eMMC is broken in Allwinned A20 or in 
> the mmc driver.
Nah, it's not broken. But Allwinner 'forgot' to map the mmc controller 
pins to the mux and thus the additional 4 bits are not on the actual 
pins. It is sad and wasn't necessary, I'm sure it's just a small over 
sight, which is costing us performance now. But we get a big improvement 
by using the latest 4.6-rc1+ kernel by using HS-DDR mode. In my early 
tests I saw 40 MB/s read and 17 MB/s write speeds. It would be nice to 
imagine what the additional 8 bits would have brought us, but alas.

As I said however, the Lime2 PCB brings out all 8 bits and if we ever 
get a pin-compatible A40, there is a chance it will have 8 bit emmc. The 
Lime2 does not have 1.8 3.3 switcher on the vqmmc lines however, but I 
am not sure if we need this at all for higher speeds.

If 8 bit would give us double the bandwith, it could be we'd get 80 
MB/s/40 MB/s in theory, but I think that's already beyond the current 
chip anyway.

Comparing it to the current NAND chips, which top ou at 4MB/s read if 
memory serves me, eMMC makes the boards quite capable :)

olliver
>
> Best regards
> Chris
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--------------070101080301000702070106
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type=
">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hey Christo,<br>
    <br>
    <div class=3D"moz-cite-prefix">On 04-05-16 21:40, Christo Radev wrote:<=
br>
    </div>
    <blockquote
      cite=3D"mid:4375220a-f939-4ed0-a6d7-2cf887b07509-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">Hi Oliver,<br>
        <br>
        I start performance tests for eMMC, SD/MMC, USB, SATA SSD
        devices and will post the result when ready.<br>
        <br>
        As a beginning I can say that eMMC is accessed via 4-bit bus
        without matter of the patch used.<br>
        There you are the content of /sys/kernel/debug/mmcX/ios (where X
        is number of eMMC or SD/MMC device).<br>
        <div class=3D"prettyprint" style=3D"background-color: rgb(250, 250,
          250); border-color: rgb(187, 187, 187); border-style: solid;
          border-width: 1px; word-wrap: break-word;"><code
            class=3D"prettyprint">
            <div class=3D"subprettyprint"><span style=3D"color: #606;"
                class=3D"styled-by-prettify">Booted</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">from</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> SD car=
d
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">with</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">8</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">bit
                patched kernel<br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:~</span><span style=3D"color:
                #800;" class=3D"styled-by-prettify"># dmesg | grep mmc</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.59962=
5</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Got</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> CD GPI=
O<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.63188=
3</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">base</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0xf08da=
000</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> irq</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">26</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.66905=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> host
                does </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">not</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"> support reading read</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">only </=
span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">switch<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                assuming write</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">-</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify">enable<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67167=
4</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">base</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0xf08de=
000</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> irq</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">27</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67206=
4</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">new</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> high
                speed SDHC card at address </span><span style=3D"color:
                #066;" class=3D"styled-by-prettify">0007</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67306=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk=
0</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0007</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> SD04G =
</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.71</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">GiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67478=
5</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                =C2=A0mmcblk0</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> p1<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68226=
1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">8</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68928=
0</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.69014=
6</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.69097=
7</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.69180=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.74550=
5</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                MAN_BKOPS_EN bit </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">is</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">not</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">set</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.74918=
7</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">8</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RD EBE
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">!!</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.74922=
9</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> data
                error</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">,</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> sending stop command<b=
r>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.74924=
7</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> send
                stop command failed<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.74926=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">switch<=
/span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> to bus
                width </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> failed<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.75358=
6</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">new</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> high
                speed MMC card at address </span><span style=3D"color:
                #066;" class=3D"styled-by-prettify">0001</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.75447=
9</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk=
1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">3.60</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">GiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.75496=
1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                mmcblk1boot0</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> mmc1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
                partition </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">16.0</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">MiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.75560=
4</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                mmcblk1boot1</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> mmc1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
                partition </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">16.0</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">MiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.75704=
5</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                =C2=A0mmcblk1</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> p1<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">4.21687=
9</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> EXT4</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">fs </sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmcblk0=
p1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">):</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mounte=
d
                filesystem </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">with</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                writeback data mode</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">.</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Opts</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">null</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">7.90700=
2</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> EXT4</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">fs </sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmcblk0=
p1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">):</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> re</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mounted=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">.</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Opts</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> commit=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">600</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">errors<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify">remount=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">ro<br>
                <br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:~</span><span style=3D"color:
                #800;" class=3D"styled-by-prettify"># cat
                /sys/kernel/debug/mmc0/ios</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
                clock</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">5000000=
0</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Hz</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                vdd</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">21</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.3</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">~</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.4</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> V</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                bus mode</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 <=
/span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">push</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">pull</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                chip </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">select</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">don</sp=
an><span
                style=3D"color: #080;" class=3D"styled-by-prettify">'t care=
)<br>
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
                chip select: =C2=A0 =C2=A00 (don'</span><span style=3D"colo=
r: #000;"
                class=3D"styled-by-prettify">t care</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                power mode</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><=
span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">on</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                bus width</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">4</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bits</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                timing spec</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc hig=
h</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">speed</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                signal voltage</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.30</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> V</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                driver type</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">driver
                type B</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">)</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
                <br>
              </span><span style=3D"color: #606;"
                class=3D"styled-by-prettify">Booted</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">from</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> SATA
                SSD </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">with</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">4</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">bit
                patched kernel<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.59886=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Got</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> CD GPI=
O<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.63115=
4</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c0f000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">base</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0xf08da=
000</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> irq</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">26</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.66831=
3</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> host
                does </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">not</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"> support reading read</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">only </=
span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">switch<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                assuming write</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">-</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify">enable<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67090=
8</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">base</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0xf08de=
000</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> irq</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">27</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67132=
4</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">new</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> high
                speed SDHC card at address </span><span style=3D"color:
                #066;" class=3D"styled-by-prettify">0007</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67230=
2</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk=
0</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0007</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> SD04G =
</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.71</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">GiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.67406=
7</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                =C2=A0mmcblk0</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> p1<br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68188=
2</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">8</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68612=
9</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68699=
6</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68784=
3</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.68867=
2</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> sunxi<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc </s=
pan><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1c11000=
.mmc</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> smc </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> err</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> cmd </=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">55</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> RTO </=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">!!</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.72476=
2</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                MAN_BKOPS_EN bit </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">is</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">not</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">set</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.73119=
6</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">new</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> high
                speed MMC card at address </span><span style=3D"color:
                #066;" class=3D"styled-by-prettify">0001</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.73214=
1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmcblk=
1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> mmc1</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">3.60</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">GiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.73255=
3</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                mmcblk1boot0</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> mmc1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
                partition </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">16.0</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">MiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.73296=
0</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                mmcblk1boot1</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> mmc1</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0001</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> P1XXXX
                partition </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">16.0</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">MiB</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">[</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">3.73418=
6</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">]</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">
                =C2=A0mmcblk1</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> p1<br>
                <br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:~</span><span style=3D"color:
                #800;" class=3D"styled-by-prettify"># cat
                /sys/kernel/debug/mmc0/ios</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
                clock</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">5000000=
0</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #606;" class=3D"styled-by-prettify">Hz</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                vdd</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">21</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.3</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">~</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.4</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> V</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                bus mode</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 <=
/span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">push</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">pull</s=
pan><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                chip </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">select</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">:</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">don</sp=
an><span
                style=3D"color: #080;" class=3D"styled-by-prettify">'t care=
)<br>
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
                chip select: =C2=A0 =C2=A00 (don'</span><span style=3D"colo=
r: #000;"
                class=3D"styled-by-prettify">t care</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                power mode</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 </span><=
span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">on</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                bus width</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0</=
span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">2</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">4</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bits</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                timing spec</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">1</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">mmc hig=
h</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">speed</=
span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                signal voltage</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">3.30</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> V</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                driver type</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span><s=
pan
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">driver
                type B</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">)</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span></div>
          </code></div>
        <br>
        The brief performance test using dd shows the similar results to
        both 4- and 8-bit patches<br>
        <div class=3D"prettyprint" style=3D"background-color: rgb(250, 250,
          250); border-color: rgb(187, 187, 187); border-style: solid;
          border-width: 1px; word-wrap: break-word;"><code
            class=3D"prettyprint">
            <div class=3D"subprettyprint"><span style=3D"color: #000;"
                class=3D"styled-by-prettify">eMMC </span><span
                style=3D"color: #066;" class=3D"styled-by-prettify">8</span=
><span
                style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">bit
                patch R</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">/</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify">W test </span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">with</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> dd<br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #080;" class=3D"styled-by-prettify">/mnt# dd if=3D/</span><=
span
                style=3D"color: #000;" class=3D"styled-by-prettify">dev</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">zero of=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1GBfile=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bs</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1M</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> count<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1K</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1024</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">in</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1024</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">out</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1073741824</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bytes =
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1.1</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> GB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> copied=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">79.9305=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> s</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">13.4</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> MB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">s<br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #080;" class=3D"styled-by-prettify">/mnt# dd of=3D/</span><=
span
                style=3D"color: #000;" class=3D"styled-by-prettify">dev</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">null</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">if</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1GBfile=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2097152</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">in</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2097152</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">out</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1073741824</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bytes =
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1.1</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> GB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> copied=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">49.5899=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> s</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">21.7</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> MB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">s<br>
                <br>
                eMMC </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">4</span><span style=3D"color:
                #660;" class=3D"styled-by-prettify">-</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify">bit
                patch R</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">/</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify">W test </span><span
                style=3D"color: #008;" class=3D"styled-by-prettify">with</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> dd<br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #080;" class=3D"styled-by-prettify">/mnt# dd if=3D/</span><=
span
                style=3D"color: #000;" class=3D"styled-by-prettify">dev</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">zero of=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1GBfile=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bs</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1M</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> count<=
/span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1K</spa=
n><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1024</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">in</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1024</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">out</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1073741824</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bytes =
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1.1</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> GB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> copied=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">78.7925=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> s</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">13.6</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> MB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">s<br>
                root@egpr</span><span style=3D"color: #660;"
                class=3D"styled-by-prettify">:</span><span style=3D"color:
                #080;" class=3D"styled-by-prettify">/mnt# dd of=3D/</span><=
span
                style=3D"color: #000;" class=3D"styled-by-prettify">dev</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">null</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #008;" class=3D"styled-by-prettify">if</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1GBfile=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2097152</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">in</span><span style=3D"color:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">2097152</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">+</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">0</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> record=
s
              </span><span style=3D"color: #008;"
                class=3D"styled-by-prettify">out</span><span style=3D"color=
:
                #000;" class=3D"styled-by-prettify"><br>
              </span><span style=3D"color: #066;"
                class=3D"styled-by-prettify">1073741824</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> bytes =
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">(</span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">1.1</sp=
an><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> GB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">)</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> copied=
</span><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">53.8002=
</span><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> s</spa=
n><span
                style=3D"color: #660;" class=3D"styled-by-prettify">,</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> </span=
><span
                style=3D"color: #066;" class=3D"styled-by-prettify">20.0</s=
pan><span
                style=3D"color: #000;" class=3D"styled-by-prettify"> MB</sp=
an><span
                style=3D"color: #660;" class=3D"styled-by-prettify">/</span=
><span
                style=3D"color: #000;" class=3D"styled-by-prettify">s<br>
              </span></div>
          </code></div>
        <br>
        In my opinion 8-bit access to eMMC is broken in Allwinned A20 or
        in the mmc driver.<br>
      </div>
    </blockquote>
    Nah, it's not broken. But Allwinner 'forgot' to map the mmc
    controller pins to the mux and thus the additional 4 bits are not on
    the actual pins. It is sad and wasn't necessary, I'm sure it's just
    a small over sight, which is costing us performance now. But we get
    a big improvement by using the latest 4.6-rc1+ kernel by using
    HS-DDR mode. In my early tests I saw 40 MB/s read and 17 MB/s write
    speeds. It would be nice to imagine what the additional 8 bits would
    have brought us, but alas.<br>
    <br>
    As I said however, the Lime2 PCB brings out all 8 bits and if we
    ever get a pin-compatible A40, there is a chance it will have 8 bit
    emmc. The Lime2 does not have 1.8 3.3 switcher on the vqmmc lines
    however, but I am not sure if we need this at all for higher speeds.<br=
>
    <br>
    If 8 bit would give us double the bandwith, it could be we'd get 80
    MB/s/40 MB/s in theory, but I think that's already beyond the
    current chip anyway.<br>
    <br>
    Comparing it to the current NAND chips, which top ou at 4MB/s read
    if memory serves me, eMMC makes the boards quite capable :)<br>
    <br>
    olliver<br>
    <blockquote
      cite=3D"mid:4375220a-f939-4ed0-a6d7-2cf887b07509-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr"><br>
        Best regards<br>
        Chris<br>
        <br>
      </div>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--------------070101080301000702070106--
