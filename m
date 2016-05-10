From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 10 May 2016 20:46:37 +0200
Message-ID: <57322C8D.5060806@schinagl.nl>
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
 <9745a80b-5444-43f7-b772-68684c96c9e5@googlegroups.com>
Reply-To: oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090809000806060801090403"
Return-path: <linux-sunxi+bncBDC2JNWXZAJBBEWZZC4QKGQEI2PIX2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <9745a80b-5444-43f7-b772-68684c96c9e5-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
--------------090809000806060801090403
Content-Type: text/plain; charset=UTF-8; format=flowed

Hey Christo,

On 10-05-16 19:25, Christo Radev wrote:
> Hi Olliver,
>
> I try to build Armbian with kernel 4.5.0-rc6 by adding the patch as 
> discussed here 
> <https://groups.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQAJ>.
> In addition I have to add following as well:
> |
> diff --git a/arch/arm/boot/dts/Makefileb/arch/arm/boot/dts/Makefile
> index 95c1923..9d6cfa8100644
> ---a/arch/arm/boot/dts/Makefile
> +++b/arch/arm/boot/dts/Makefile
> @@-695,6+696,7@@dtb-$(CONFIG_MACH_SUN7I)+=\
>      sun7i-a20-olimex-som-evb.dtb \
>      sun7i-a20-olinuxino-lime.dtb \
>      sun7i-a20-olinuxino-lime2.dtb \
> +   sun7i-a20-olinuxino-lime2-emmc.dtb \
>      sun7i-a20-olinuxino-micro.dtb \
>      sun7i-a20-orangepi.dtb \
>      sun7i-a20-orangepi-mini.dtb \
> |
> to be able to compile the new sun7i-a20-olinuxino-lime2-emmc.dts file.
Good point, I actually forgot that bit in my own Makefile.
>
> After booting I have renamed it to sun7i-a20-olinuxino-lime2.dts and 
> reboot lime-eMMC board.
why rename it to dts? i'm sure you mean dtb, and I'm guessing because 
armbian loads that per default.
>
> Unfortunately, I get some error messages:
> |
> root@lime2:~# dmesg | grep mmc
> [0.000000]Kernelcommand line:console=tty1 root=/dev/mmcblk0p1 rootwait 
> rootfstype=ext4 cgroup_enable=memory 
> swapaccount=1sunxi_ve_mem_reserve=0sunxi_g2d_mem_reserve=0sunxi_no_mali_mem_reserve 
> sunxi_fb_mem_reserve=16hdmi.audio=EDID:0disp.screen0_output_mode=1920x1080p60panic=10consoleblank=0enforcing=0loglevel=1
> [3.721024]sunxi-mmc 1c0f000.mmc:GotCD GPIO
> [3.758926]sunxi-mmc 1c0f000.mmc:base:0xf08dc000irq:26
> [3.759832]sunxi-mmc 1c11000.mmc:allocated mmc-pwrseq
> [4.528643]sunxi-mmc 1c11000.mmc:fatal err update clk timeout
> [4.535700]mmc0:host does notsupport reading read-only switch,assuming 
> write-enable
> [4.538253]mmc0:newhigh speed SDHC card at address 0002
> [4.539066]mmcblk0:mmc0:0002000003.70GiB
> [4.540959] mmcblk0:p1
> [4.548773]sunxi-mmc 1c11000.mmc:base:0xf08f2000irq:27
> [6.418686]sunxi-mmc 1c11000.mmc:fatal err update clk timeout
> [6.600359]EXT4-fs (mmcblk0p1):mounted filesystem withwriteback data 
> mode.Opts:(null)
> [7.168650]sunxi-mmc 1c11000.mmc:fatal err update clk timeout
> [7.918646]sunxi-mmc 1c11000.mmc:fatal err update clk timeout
> [9.875182]EXT4-fs (mmcblk0p1):re-mounted.Opts:commit=600,errors=remount-ro
> |
>
> Where could be the problem?
Not exactly sure, are you using the correct lime ;)

It does look like the correct dtb was used, since the second mmc 
controller is available. Maybe the bootloader prepares/inits something 
that is missing? sounds unlikly but possible. Maybe armbian does more 
changes?
>
> Best regards
> Chris
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--------------090809000806060801090403
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
    <div class=3D"moz-cite-prefix">On 10-05-16 19:25, Christo Radev wrote:<=
br>
    </div>
    <blockquote
      cite=3D"mid:9745a80b-5444-43f7-b772-68684c96c9e5-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">
        <div>Hi Olliver,<br>
          <br>
          I try to build Armbian with kernel 4.5.0-rc6 by adding <a
            moz-do-not-send=3D"true"
href=3D"https://groups.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQA=
J">the
            patch as discussed here</a>.<br>
          In addition I have to add following as well:<br>
          <div class=3D"prettyprint" style=3D"background-color: rgb(250,
            250, 250); border-color: rgb(187, 187, 187); border-style:
            solid; border-width: 1px; word-wrap: break-word;"><code
              class=3D"prettyprint">
              <div class=3D"subprettyprint"><span style=3D"color: #000;"
                  class=3D"styled-by-prettify">diff </span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">--</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">git a=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arch<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arm</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">boot<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dts</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Makef=
ile</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> b</s=
pan><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arch<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arm</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">boot<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dts</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Makef=
ile</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  index </span><span style=3D"color: #066;"
                  class=3D"styled-by-prettify">95c1923.</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">9d6cf=
a8</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">10064=
4</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">---</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> a</s=
pan><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arch<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arm</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">boot<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dts</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Makef=
ile</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">+++</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> b</s=
pan><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arch<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">arm</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">boot<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dts</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">/</sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Makef=
ile</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">@@</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">695</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">,</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">6</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">+</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">696</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">,</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">7</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">@@</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> dtb<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">$</sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">CONFI=
G_MACH_SUN7I</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">)</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">+=3D<=
/span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">olime=
x</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">som</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">evb</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">olinu=
xino</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">lime<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">olinu=
xino</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">lime2=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">+</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0sun7i</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">a20</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">olinu=
xino</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">lime2=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">emmc<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">olinu=
xino</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">micro=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">orang=
epi</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color: #66=
0;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">a20</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">orang=
epi</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mini<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">dtb <=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">\</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span></div>
            </code></div>
          to be able to compile the new
          sun7i-a20-olinuxino-lime2-emmc.dts file.<br>
        </div>
      </div>
    </blockquote>
    Good point, I actually forgot that bit in my own Makefile.<br>
    <blockquote
      cite=3D"mid:9745a80b-5444-43f7-b772-68684c96c9e5-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          After booting I have renamed it to
          sun7i-a20-olinuxino-lime2.dts and reboot lime-eMMC board.<br>
        </div>
      </div>
    </blockquote>
    why rename it to dts? i'm sure you mean dtb, and I'm guessing
    because armbian loads that per default.<br>
    <blockquote
      cite=3D"mid:9745a80b-5444-43f7-b772-68684c96c9e5-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          Unfortunately, I get some error messages:<br>
          <div class=3D"prettyprint" style=3D"background-color: rgb(250,
            250, 250); border-color: rgb(187, 187, 187); border-style:
            solid; border-width: 1px; word-wrap: break-word;"><code
              class=3D"prettyprint">
              <div class=3D"subprettyprint"><span style=3D"color: #000;"
                  class=3D"styled-by-prettify">root@lime2</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:~</s=
pan><span
                  style=3D"color: #800;" class=3D"styled-by-prettify">#
                  dmesg | grep mmc</span><span style=3D"color: #000;"
                  class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">0.000=
000</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Kerne=
l</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  command line</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">:</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> console</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">tty1
                  root</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #080;" class=3D"styled-by-prettify">/dev/</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmcbl=
k0p1
                  rootwait rootfstype</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #000;" class=3D"styled-by-prettify">ext4 cgroup_enable</s=
pan><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">memor=
y
                  swapaccount</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">1</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  sunxi_ve_mem_reserve</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">0</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  sunxi_g2d_mem_reserve</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">0</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve</span><spa=
n
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">16</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> hdmi=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">audio=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">EDID<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">0</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> disp=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">scree=
n0_output_mode</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1920x=
1080p60</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> pani=
c</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">10</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  consoleblank</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">0</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  enforcing</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">0</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  loglevel</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">1</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">3.721=
024</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c0f0=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Got</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> CD
                  GPIO<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">3.758=
926</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c0f0=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #008;" class=3D"styled-by-prettify">base<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">0xf08=
dc000</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> irq<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">26</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">3.759=
832</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  allocated mmc</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">pwrseq<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.528=
643</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> fata=
l
                  err update clk timeout<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.535=
700</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> host
                  does </span><span style=3D"color: #008;"
                  class=3D"styled-by-prettify">not</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  support reading read</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">only </span><span
                  style=3D"color: #008;" class=3D"styled-by-prettify">switc=
h</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">,</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  assuming write</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">-</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify">enable<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.538=
253</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> mmc0=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #008;" class=3D"styled-by-prettify">new</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> high
                  speed SDHC card at address </span><span style=3D"color:
                  #066;" class=3D"styled-by-prettify">0002</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.539=
066</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  mmcblk0</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">:</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> mmc0</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">0002<=
/span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">00000=
</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">3.70<=
/span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">GiB</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.540=
959</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  =C2=A0mmcblk0</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">:</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> p1<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">4.548=
773</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #008;" class=3D"styled-by-prettify">base<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">0xf08=
f2000</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> irq<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">27</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">6.418=
686</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> fata=
l
                  err update clk timeout<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">6.600=
359</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> EXT4=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">fs </=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmcbl=
k0p1</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">):</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  mounted filesystem </span><span style=3D"color: #008;"
                  class=3D"styled-by-prettify">with</span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  writeback data mode</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">.</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> </span><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Opts<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span
                  style=3D"color: #008;" class=3D"styled-by-prettify">null<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">)</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"><br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">7.168=
650</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> fata=
l
                  err update clk timeout<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">7.918=
646</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> sunx=
i</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmc <=
/span><span
                  style=3D"color: #066;" class=3D"styled-by-prettify">1c110=
00.mmc</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> fata=
l
                  err update clk timeout<br>
                </span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">[</span><span style=3D"color=
:
                  #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</span>=
<span
                  style=3D"color: #066;" class=3D"styled-by-prettify">9.875=
182</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">]</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> EXT4=
</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">fs </=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">(</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mmcbl=
k0p1</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">):</s=
pan><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> re</=
span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">mount=
ed</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">.</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span
                  style=3D"color: #606;" class=3D"styled-by-prettify">Opts<=
/span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">:</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">
                  commit</span><span style=3D"color: #660;"
                  class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or:
                  #066;" class=3D"styled-by-prettify">600</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">,</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">error=
s</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">=3D</=
span><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">remou=
nt</span><span
                  style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span
                  style=3D"color: #000;" class=3D"styled-by-prettify">ro<br=
>
                </span></div>
            </code></div>
          <br>
          Where could be the problem?<br>
        </div>
      </div>
    </blockquote>
    Not exactly sure, are you using the correct lime ;)<br>
    <br>
    It does look like the correct dtb was used, since the second mmc
    controller is available. Maybe the bootloader prepares/inits
    something that is missing? sounds unlikly but possible. Maybe
    armbian does more changes?<br>
    <blockquote
      cite=3D"mid:9745a80b-5444-43f7-b772-68684c96c9e5-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org"
      type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          Best regards<br>
          Chris<br>
          <br>
        </div>
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

--------------090809000806060801090403--
