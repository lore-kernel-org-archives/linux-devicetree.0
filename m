From: Christo Radev <christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: sunxi: Add a olinuxino-lime2-emmc
Date: Tue, 10 May 2016 12:17:43 -0700 (PDT)
Message-ID: <8afbe753-4e74-4b30-ad7e-a12027d28264@googlegroups.com>
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
 <57322C8D.5060806@schinagl.nl>
Reply-To: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_880_1346132463.1462907864089"
Return-path: <linux-sunxi+bncBD7ORYHCVECRBWHHZC4QKGQEUPM3AMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <57322C8D.5060806-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: christo.radev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, radoslav.kolev-1W28NRE8jL9DPfheJLI6IQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, tsvetan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org
List-Id: devicetree@vger.kernel.org

------=_Part_880_1346132463.1462907864089
Content-Type: multipart/alternative;
	boundary="----=_Part_881_1422485803.1462907864095"

------=_Part_881_1422485803.1462907864095
Content-Type: text/plain; charset=UTF-8

Hi Olliver,

On Tuesday, May 10, 2016 at 9:46:45 PM UTC+3, Olliver Schinagl wrote:
>
> Hey Christo,
>
> On 10-05-16 19:25, Christo Radev wrote:
>
> Hi Olliver,
>
> I try to build Armbian with kernel 4.5.0-rc6 by adding the patch as 
> discussed here 
> <https://groups.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQAJ>.
> In addition I have to add following as well:
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 95c1923..9d6cfa8 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -695,6 +696,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>      sun7i-a20-olimex-som-evb.dtb \
>      sun7i-a20-olinuxino-lime.dtb \
>      sun7i-a20-olinuxino-lime2.dtb \
> +    sun7i-a20-olinuxino-lime2-emmc.dtb \
>      sun7i-a20-olinuxino-micro.dtb \
>      sun7i-a20-orangepi.dtb \
>      sun7i-a20-orangepi-mini.dtb \
> to be able to compile the new sun7i-a20-olinuxino-lime2-emmc.dts file.
>
> Good point, I actually forgot that bit in my own Makefile.
>
>
> After booting I have renamed it to sun7i-a20-olinuxino-lime2.dts and 
> reboot lime-eMMC board.
>
> why rename it to dts? i'm sure you mean dtb, and I'm guessing because 
> armbian loads that per default.
>
Yes, currently I use LIME2 configuration and this way is faster. Later on I 
will make new configuration set for Lime2-eMMC. 

>
> Unfortunately, I get some error messages:
> root@lime2:~# dmesg | grep mmc
> [    0.000000] Kernel command line: console=tty1 root=/dev/mmcblk0p1 
> rootwait rootfstype=ext4 cgroup_enable=memory swapaccount=1 
> sunxi_ve_mem_reserve=0 sunxi_g2d_mem_reserve=0 sunxi_no_mali_mem_reserve 
> sunxi_fb_mem_reserve=16 hdmi.audio=EDID:0 disp.screen0_output_mode=
> 1920x1080p60 panic=10 consoleblank=0 enforcing=0 loglevel=1
> [    3.721024] sunxi-mmc 1c0f000.mmc: Got CD GPIO
> [    3.758926] sunxi-mmc 1c0f000.mmc: base:0xf08dc000 irq:26
> [    3.759832] sunxi-mmc 1c11000.mmc: allocated mmc-pwrseq
> [    4.528643] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
> [    4.535700] mmc0: host does not support reading read-only switch, 
> assuming write-enable
> [    4.538253] mmc0: new high speed SDHC card at address 0002
> [    4.539066] mmcblk0: mmc0:0002 00000 3.70 GiB
> [    4.540959]  mmcblk0: p1
> [    4.548773] sunxi-mmc 1c11000.mmc: base:0xf08f2000 irq:27
> [    6.418686] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
> [    6.600359] EXT4-fs (mmcblk0p1): mounted filesystem with writeback 
> data mode. Opts: (null)
> [    7.168650] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
> [    7.918646] sunxi-mmc 1c11000.mmc: fatal err update clk timeout
> [    9.875182] EXT4-fs (mmcblk0p1): re-mounted. Opts: commit=600,errors=
> remount-ro
>
> Where could be the problem?
>
> Not exactly sure, are you using the correct lime ;)
>
Of course,  I use A20-Olinuxino-Lome2-eMMC boards for testing.

>
> It does look like the correct dtb was used, since the second mmc 
> controller is available. Maybe the bootloader prepares/inits something that 
> is missing? sounds unlikly but possible. Maybe armbian does more changes?
>
For sure in the beginning I have patched and enabled eMMC in the kernel 
only (without any changes in u-boot). And it has worked fine. Later on I 
have patched u-boot to recognize eMMC as second MMC device.

Meanwhile, I have build Armbian dev image with u-boot v2016.05-rc3 and 
kernel 4.6-rc7 using may patch for eMMC:
diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot
/dts/sun7i-a20-olinuxino-lime2.dts
index d5c796c..1f5339d 100644
--- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
+++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
@@ -188,6 +188,15 @@
     status = "okay";
 };
 
+&mmc2 {
+    pinctrl-names = "default";
+    pinctrl-0 = <&mmc2_pins_a>;
+    vmmc-supply = <&reg_vcc3v3>;
+    bus-width = <8>;
+    non-removable;
+    status = "okay";
+};
+
 &ohci0 {
     status = "okay";
 };
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 3d5087b..78668aa 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -504,7 +504,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 
*ext_csd)
                 pr_info("%s: MAN_BKOPS_EN bit is not set\n",
                     mmc_hostname(card->host));
         }
-
+#if 0
         /* check whether the eMMC card supports HPI */
         if (!broken_hpi && (ext_csd[EXT_CSD_HPI_FEATURES] & 0x1)) {
             card->ext_csd.hpi = 1;
@@ -519,7 +519,7 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 
*ext_csd)
             card->ext_csd.out_of_int_time =
                 ext_csd[EXT_CSD_OUT_OF_INTERRUPT_TIME] * 10;
         }
-
+#endif
         card->ext_csd.rel_param = ext_csd[EXT_CSD_WR_REL_PARAM];
         card->ext_csd.rst_n_function = ext_csd[EXT_CSD_RST_N_FUNCTION];
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c b/drivers/pinctrl/
sunxi/pinctrl-sun7i-a20.c
index cf1ce0c..9fc12d2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
@@ -314,19 +314,23 @@ static const struct sunxi_desc_pin sun7i_a20_pins[] = 
{
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ4 */
+          SUNXI_FUNCTION(0x2, "nand0"),        /* NDQ4 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D4 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ5 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ5 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D5 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ6 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ6 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D6 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
-          SUNXI_FUNCTION(0x2, "nand0")),    /* NDQ7 */
+          SUNXI_FUNCTION(0x2, "nand0"),    /* NDQ7 */
+          SUNXI_FUNCTION(0x3, "mmc2")),         /* D7 */
     SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
           SUNXI_FUNCTION(0x0, "gpio_in"),
           SUNXI_FUNCTION(0x1, "gpio_out"),
and it recognizes eMMC without problems.

Using dd for performance measure it gives:
root@egpr:/mnt# dd if=/dev/zero of=1GBfile bs=1M count=1K
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB) copied, 78.7895 s, 13.6 MB/s
root@egpr:/mnt# dd of=/dev/null if=1GBfile
2097152+0 records in
2097152+0 records out
1073741824 bytes (1.1 GB) copied, 28.6025 s, 37.5 MB/s
Compared to my last results write is the same (13.6 vs. 13.5 MB/s) as speed 
but the read is 80% faster (37.5 vs. 20.8 MB/s).


> Best regards
> Chris
>
>
>

-- 
You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

------=_Part_881_1422485803.1462907864095
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Olliver,<br><br>On Tuesday, May 10, 2016 at 9:46:45 PM =
UTC+3, Olliver Schinagl wrote:<blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000">
    Hey Christo,<br>
    <br>
    <div>On 10-05-16 19:25, Christo Radev wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div>Hi Olliver,<br>
          <br>
          I try to build Armbian with kernel 4.5.0-rc6 by adding <a href=3D=
"https://groups.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQAJ" targ=
et=3D"_blank" rel=3D"nofollow" onmousedown=3D"this.href=3D&#39;https://grou=
ps.google.com/d/msg/linux-sunxi/vSC4vx8_ok8/K0jW8bmcAQAJ&#39;;return true;"=
 onclick=3D"this.href=3D&#39;https://groups.google.com/d/msg/linux-sunxi/vS=
C4vx8_ok8/K0jW8bmcAQAJ&#39;;return true;">the
            patch as discussed here</a>.<br>
          In addition I have to add following as well:<br>
          <div style=3D"background-color:rgb(250,250,250);border-color:rgb(=
187,187,187);border-style:solid;border-width:1px;word-wrap:break-word"><cod=
e>
              <div><span style=3D"color:#000">diff </span><span style=3D"co=
lor:#660">--</span><span style=3D"color:#000">git a</span><span style=3D"co=
lor:#660">/</span><span style=3D"color:#000">arch</span><span style=3D"colo=
r:#660">/</span><span style=3D"color:#000">arm</span><span style=3D"color:#=
660">/</span><span style=3D"color:#000">boot</span><span style=3D"color:#66=
0">/</span><span style=3D"color:#000">dts</span><span style=3D"color:#660">=
/</span><span style=3D"color:#606">Makefile</span><span style=3D"color:#000=
"> b</span><span style=3D"color:#660">/</span><span style=3D"color:#000">ar=
ch</span><span style=3D"color:#660">/</span><span style=3D"color:#000">arm<=
/span><span style=3D"color:#660">/</span><span style=3D"color:#000">boot</s=
pan><span style=3D"color:#660">/</span><span style=3D"color:#000">dts</span=
><span style=3D"color:#660">/</span><span style=3D"color:#606">Makefile</sp=
an><span style=3D"color:#000"><br>
                  index </span><span style=3D"color:#066">95c1923.</span><s=
pan style=3D"color:#660">.</span><span style=3D"color:#066">9d6cfa8</span><=
span style=3D"color:#000"> </span><span style=3D"color:#066">100644</span><=
span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">---</span><span style=3D"=
color:#000"> a</span><span style=3D"color:#660">/</span><span style=3D"colo=
r:#000">arch</span><span style=3D"color:#660">/</span><span style=3D"color:=
#000">arm</span><span style=3D"color:#660">/</span><span style=3D"color:#00=
0">boot</span><span style=3D"color:#660">/</span><span style=3D"color:#000"=
>dts</span><span style=3D"color:#660">/</span><span style=3D"color:#606">Ma=
kefile</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">+++</span><span style=3D"=
color:#000"> b</span><span style=3D"color:#660">/</span><span style=3D"colo=
r:#000">arch</span><span style=3D"color:#660">/</span><span style=3D"color:=
#000">arm</span><span style=3D"color:#660">/</span><span style=3D"color:#00=
0">boot</span><span style=3D"color:#660">/</span><span style=3D"color:#000"=
>dts</span><span style=3D"color:#660">/</span><span style=3D"color:#606">Ma=
kefile</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">@@</span><span style=3D"c=
olor:#000"> </span><span style=3D"color:#660">-</span><span style=3D"color:=
#066">695</span><span style=3D"color:#660">,</span><span style=3D"color:#06=
6">6</span><span style=3D"color:#000"> </span><span style=3D"color:#660">+<=
/span><span style=3D"color:#066">696</span><span style=3D"color:#660">,</sp=
an><span style=3D"color:#066">7</span><span style=3D"color:#000"> </span><s=
pan style=3D"color:#660">@@</span><span style=3D"color:#000"> dtb</span><sp=
an style=3D"color:#660">-</span><span style=3D"color:#000">$</span><span st=
yle=3D"color:#660">(</span><span style=3D"color:#000">CONFIG_MACH_SUN7I</sp=
an><span style=3D"color:#660">)</span><span style=3D"color:#000"> </span><s=
pan style=3D"color:#660">+=3D</span><span style=3D"color:#000"> </span><spa=
n style=3D"color:#660">\</span><span style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">olimex</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">som</span><span style=3D"color:#660">-</s=
pan><span style=3D"color:#000">evb</span><span style=3D"color:#660">.</span=
><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\</span><=
span style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">olinuxino</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">lime</span><span style=3D"color:#660">=
.</span><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\<=
/span><span style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">olinuxino</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">lime2</span><span style=3D"color:#660"=
>.</span><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\=
</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">+</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660">-</span><spa=
n style=3D"color:#000">a20</span><span style=3D"color:#660">-</span><span s=
tyle=3D"color:#000">olinuxino</span><span style=3D"color:#660">-</span><spa=
n style=3D"color:#000">lime2</span><span style=3D"color:#660">-</span><span=
 style=3D"color:#000">emm<wbr>c</span><span style=3D"color:#660">.</span><s=
pan style=3D"color:#000">dtb </span><span style=3D"color:#660">\</span><spa=
n style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">olinuxino</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">micro</span><span style=3D"color:#660"=
>.</span><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\=
</span><span style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">orangepi</span><span style=3D"color:#660"=
>.</span><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\=
</span><span style=3D"color:#000"><br>
                  =C2=A0 =C2=A0 =C2=A0sun7i</span><span style=3D"color:#660=
">-</span><span style=3D"color:#000">a20</span><span style=3D"color:#660">-=
</span><span style=3D"color:#000">orangepi</span><span style=3D"color:#660"=
>-</span><span style=3D"color:#000">mini</span><span style=3D"color:#660">.=
</span><span style=3D"color:#000">dtb </span><span style=3D"color:#660">\</=
span><span style=3D"color:#000"><br>
                </span></div>
            </code></div>
          to be able to compile the new
          sun7i-a20-olinuxino-lime2-<wbr>emmc.dts file.<br>
        </div>
      </div>
    </blockquote>
    Good point, I actually forgot that bit in my own Makefile.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          After booting I have renamed it to
          sun7i-a20-olinuxino-lime2.dts and reboot lime-eMMC board.<br>
        </div>
      </div>
    </blockquote>
    why rename it to dts? i&#39;m sure you mean dtb, and I&#39;m guessing
    because armbian loads that per default.<br></div></blockquote><div>Yes,=
 currently I use LIME2 configuration and this way is faster. Later on I wil=
l make new configuration set for Lime2-eMMC. <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin: 0;margin-left: 0.8ex;border-left: 1px #ccc s=
olid;padding-left: 1ex;"><div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          Unfortunately, I get some error messages:<br>
          <div style=3D"background-color:rgb(250,250,250);border-color:rgb(=
187,187,187);border-style:solid;border-width:1px;word-wrap:break-word"><cod=
e>
              <div><span style=3D"color:#000">root@lime2</span><span style=
=3D"color:#660">:~</span><span style=3D"color:#800">#
                  dmesg | grep mmc</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">0.000000</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> </span><span s=
tyle=3D"color:#606">Kernel</span><span style=3D"color:#000">
                  command line</span><span style=3D"color:#660">:</span><sp=
an style=3D"color:#000"> console</span><span style=3D"color:#660">=3D</span=
><span style=3D"color:#000">tty1
                  root</span><span style=3D"color:#660">=3D</span><span sty=
le=3D"color:#080">/dev/</span><span style=3D"color:#000">mmcblk0p1
                  rootwait rootfstype</span><span style=3D"color:#660">=3D<=
/span><span style=3D"color:#000">ext4 cgroup_enable</span><span style=3D"co=
lor:#660">=3D</span><span style=3D"color:#000">memory
                  swapaccount</span><span style=3D"color:#660">=3D</span><s=
pan style=3D"color:#066">1</span><span style=3D"color:#000">
                  sunxi_ve_mem_reserve</span><span style=3D"color:#660">=3D=
</span><span style=3D"color:#066">0</span><span style=3D"color:#000">
                  sunxi_g2d_mem_reserve</span><span style=3D"color:#660">=
=3D</span><span style=3D"color:#066">0</span><span style=3D"color:#000">
                  sunxi_no_mali_mem_reserve sunxi_fb_mem_reserve</span><spa=
n style=3D"color:#660">=3D</span><span style=3D"color:#066">16</span><span =
style=3D"color:#000"> hdmi</span><span style=3D"color:#660">.</span><span s=
tyle=3D"color:#000">audio</span><span style=3D"color:#660">=3D</span><span =
style=3D"color:#000">EDID</span><span style=3D"color:#660">:</span><span st=
yle=3D"color:#066">0</span><span style=3D"color:#000"> disp</span><span sty=
le=3D"color:#660">.</span><span style=3D"color:#000">screen0_output_mode</s=
pan><span style=3D"color:#660">=3D</span><span style=3D"color:#066">1920x<w=
br>1080p60</span><span style=3D"color:#000"> panic</span><span style=3D"col=
or:#660">=3D</span><span style=3D"color:#066">10</span><span style=3D"color=
:#000">
                  consoleblank</span><span style=3D"color:#660">=3D</span><=
span style=3D"color:#066">0</span><span style=3D"color:#000">
                  enforcing</span><span style=3D"color:#660">=3D</span><spa=
n style=3D"color:#066">0</span><span style=3D"color:#000">
                  loglevel</span><span style=3D"color:#660">=3D</span><span=
 style=3D"color:#066">1</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.721024</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c0f000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> </span><span style=3D"color:#606">Got</span><s=
pan style=3D"color:#000"> CD
                  GPIO<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.758926</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c0f000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> </span><span style=3D"color:#008">base</span><=
span style=3D"color:#660">:</span><span style=3D"color:#066">0xf08dc000</sp=
an><span style=3D"color:#000"> irq</span><span style=3D"color:#660">:</span=
><span style=3D"color:#066">26</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">3.759832</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000">
                  allocated mmc</span><span style=3D"color:#660">-</span><s=
pan style=3D"color:#000">pwrseq<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.528643</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> fatal
                  err update clk timeout<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.535700</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> mmc0</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#000"> host
                  does </span><span style=3D"color:#008">not</span><span st=
yle=3D"color:#000">
                  support reading read</span><span style=3D"color:#660">-</=
span><span style=3D"color:#000">only </span><span style=3D"color:#008">swit=
ch</span><span style=3D"color:#660">,</span><span style=3D"color:#000">
                  assuming write</span><span style=3D"color:#660">-</span><=
span style=3D"color:#000">enable<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.538253</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> mmc0</span><sp=
an style=3D"color:#660">:</span><span style=3D"color:#000"> </span><span st=
yle=3D"color:#008">new</span><span style=3D"color:#000"> high
                  speed SDHC card at address </span><span style=3D"color:#0=
66">0002</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.539066</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000">
                  mmcblk0</span><span style=3D"color:#660">:</span><span st=
yle=3D"color:#000"> mmc0</span><span style=3D"color:#660">:</span><span sty=
le=3D"color:#066">0002</span><span style=3D"color:#000"> </span><span style=
=3D"color:#066">00000</span><span style=3D"color:#000"> </span><span style=
=3D"color:#066">3.70</span><span style=3D"color:#000"> </span><span style=
=3D"color:#606">GiB</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.540959</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000">
                  =C2=A0mmcblk0</span><span style=3D"color:#660">:</span><s=
pan style=3D"color:#000"> p1<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">4.548773</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> </span><span style=3D"color:#008">base</span><=
span style=3D"color:#660">:</span><span style=3D"color:#066">0xf08f2000</sp=
an><span style=3D"color:#000"> irq</span><span style=3D"color:#660">:</span=
><span style=3D"color:#066">27</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">6.418686</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> fatal
                  err update clk timeout<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">6.600359</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> EXT4</span><sp=
an style=3D"color:#660">-</span><span style=3D"color:#000">fs </span><span =
style=3D"color:#660">(</span><span style=3D"color:#000">mmcblk0p1</span><sp=
an style=3D"color:#660">):</span><span style=3D"color:#000">
                  mounted filesystem </span><span style=3D"color:#008">with=
</span><span style=3D"color:#000">
                  writeback data mode</span><span style=3D"color:#660">.</s=
pan><span style=3D"color:#000"> </span><span style=3D"color:#606">Opts</spa=
n><span style=3D"color:#660">:</span><span style=3D"color:#000"> </span><sp=
an style=3D"color:#660">(</span><span style=3D"color:#008">null</span><span=
 style=3D"color:#660">)</span><span style=3D"color:#000"><br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">7.168650</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> fatal
                  err update clk timeout<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">7.918646</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> sunxi</span><s=
pan style=3D"color:#660">-</span><span style=3D"color:#000">mmc </span><spa=
n style=3D"color:#066">1c11000.mmc</span><span style=3D"color:#660">:</span=
><span style=3D"color:#000"> fatal
                  err update clk timeout<br>
                </span><span style=3D"color:#660">[</span><span style=3D"co=
lor:#000"> =C2=A0 =C2=A0</span><span style=3D"color:#066">9.875182</span><s=
pan style=3D"color:#660">]</span><span style=3D"color:#000"> EXT4</span><sp=
an style=3D"color:#660">-</span><span style=3D"color:#000">fs </span><span =
style=3D"color:#660">(</span><span style=3D"color:#000">mmcblk0p1</span><sp=
an style=3D"color:#660">):</span><span style=3D"color:#000"> re</span><span=
 style=3D"color:#660">-</span><span style=3D"color:#000">mounted</span><spa=
n style=3D"color:#660">.</span><span style=3D"color:#000"> </span><span sty=
le=3D"color:#606">Opts</span><span style=3D"color:#660">:</span><span style=
=3D"color:#000">
                  commit</span><span style=3D"color:#660">=3D</span><span s=
tyle=3D"color:#066">600</span><span style=3D"color:#660">,</span><span styl=
e=3D"color:#000">errors</span><span style=3D"color:#660">=3D</span><span st=
yle=3D"color:#000">remount</span><span style=3D"color:#660">-</span><span s=
tyle=3D"color:#000">ro<br>
                </span></div>
            </code></div>
          <br>
          Where could be the problem?<br>
        </div>
      </div>
    </blockquote>
    Not exactly sure, are you using the correct lime ;)<br></div></blockquo=
te><div>Of course,=C2=A0 I use A20-Olinuxino-Lome2-eMMC boards for testing.=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left:=
 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><div bgcolor=3D"#FFF=
FFF" text=3D"#000000">
    <br>
    It does look like the correct dtb was used, since the second mmc
    controller is available. Maybe the bootloader prepares/inits
    something that is missing? sounds unlikly but possible. Maybe
    armbian does more changes?<br></div></blockquote><div>For sure in the b=
eginning I have patched and enabled eMMC in the kernel only (without any ch=
anges in u-boot). And it has worked fine. Later on I have patched u-boot to=
 recognize eMMC as second MMC device.<br><br>Meanwhile, I have build Armbia=
n dev image with u-boot v2016.05-rc3 and kernel 4.6-rc7 using may patch for=
 eMMC:<br><div class=3D"prettyprint" style=3D"background-color: rgb(250, 25=
0, 250); border-color: rgb(187, 187, 187); border-style: solid; border-widt=
h: 1px; word-wrap: break-word;"><code class=3D"prettyprint"><div class=3D"s=
ubprettyprint"><span style=3D"color: #000;" class=3D"styled-by-prettify">di=
ff </span><span style=3D"color: #660;" class=3D"styled-by-prettify">--</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">git a</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">arch</span><span style=3D"co=
lor: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000=
;" class=3D"styled-by-prettify">arm</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">boot</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
>dts</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">sun7i</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">a20</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">olinuxino</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify">lime2</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">dts b</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">arch</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">arm</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">boot</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">dts</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">sun7i</span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">a20</s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">olinuxino</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">lime2</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify">dts<br>index d5c796c</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">..</span><span style=3D"color: #066;=
" class=3D"styled-by-prettify">1f5339d</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"> </span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">100644</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">---</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
"> a</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">arch</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">arm</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">boot</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">dts</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
sun7i</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify">a20</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">olinuxino</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">lime2</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">dts<br></span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">+++</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> b</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">arc=
h</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify">arm</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">boot</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">dts</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">sun7i</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">a20<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify">olinuxino</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">lime2</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #00=
0;" class=3D"styled-by-prettify">dts<br></span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">-</span><span style=3D"color: #066;" class=3D"styled-by-pret=
tify">188</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,=
</span><span style=3D"color: #066;" class=3D"styled-by-prettify">6</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">188</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">,</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">15</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><=
br>=C2=A0 =C2=A0 =C2=A0status </span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pretti=
fy">&quot;okay&quot;</span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"=
><br>=C2=A0</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>};</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=
=A0<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+&a=
mp;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc2 </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">{</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0pinctrl</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">names </span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #080;" class=3D=
"styled-by-prettify">&quot;default&quot;</span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">;</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"style=
d-by-prettify">+</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> =C2=A0 =C2=A0pinctrl</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">-</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">0</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">&lt;&amp;</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">mmc2_pins_a</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">&gt;;</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> =C2=A0 =C2=A0vmmc</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">supply </span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">&lt;&amp;</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify">reg_vcc3v3</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">&gt;;</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0bus</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">width </span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">&lt;</span><span style=3D"color: =
#066;" class=3D"styled-by-prettify">8</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">&gt;;</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">+</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"> =C2=A0 =C2=A0non</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">-</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">removable</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">;</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0stat=
us </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #080;" class=3D"styled-by-prettify">&quot;okay&quot;</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">;</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">+};</span><span style=3D"color: =
#000;" class=3D"styled-by-prettify"><br></span><span style=3D"color: #660;"=
 class=3D"styled-by-prettify">+</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"><br>=C2=A0</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">&amp;</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">ohci0 </span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">{</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0status </span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pr=
ettify">&quot;okay&quot;</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">;</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br>=C2=A0</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">};</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
>diff </span><span style=3D"color: #660;" class=3D"styled-by-prettify">--</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify">git a</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">drivers</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">core</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">c b</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">drivers</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">core</span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">.</span><span style=3D"color: #000;" class=3D"styled-by-prettify">c<br>in=
dex </span><span style=3D"color: #066;" class=3D"styled-by-prettify">3d5087=
b</span><span style=3D"color: #660;" class=3D"styled-by-prettify">..</span>=
<span style=3D"color: #066;" class=3D"styled-by-prettify">78668aa</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">100644</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">---</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> a</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">mmc</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">core</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">mmc</span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify">c<br></span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">+++</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> b</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">drivers</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">mmc</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">core</span><span style=3D"=
color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">mmc</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify">c<br></span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</s=
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">504</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"=
styled-by-prettify">504</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">,</span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">7</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D=
"color: #008;" class=3D"styled-by-prettify">static</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;=
" class=3D"styled-by-prettify">int</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"> mmc_decode_ext_csd</span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">(</span><span style=3D"color: #008;" class=
=3D"styled-by-prettify">struct</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> mmc_card </span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">*</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify">card</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> u8 =
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">*</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">ext_csd</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">)</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_info</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #080;" class=
=3D"styled-by-prettify">&quot;%s: MAN_BKOPS_EN bit is not set\n&quot;</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span st=
yle=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmc_hostname</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">(</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">card</span><span style=3D"c=
olor: #660;" class=3D"styled-by-prettify">-&gt;</span><span style=3D"color:=
 #000;" class=3D"styled-by-prettify">host</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">));</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">}</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify"><br></span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">+</span><span style=3D"color: #800;" class=3D"style=
d-by-prettify">#if 0</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color=
: #800;" class=3D"styled-by-prettify">/* check whether the eMMC card suppor=
ts HPI */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #008;" cl=
ass=3D"styled-by-prettify">if</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">(!</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">broken_hpi </span><span style=3D"color: #660;" class=3D"styled-by-prettif=
y">&amp;&amp;</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">(</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify">ext_csd</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify">EXT_CSD_HPI_FEATURES</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">]</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"col=
or: #660;" class=3D"styled-by-prettify">&amp;</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">0x1</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">))</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">{</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">-&gt;</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify">ext_csd</span><span style=3D"color: #660;=
" class=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">hpi </span><span style=3D"color: #660;" class=3D"st=
yled-by-prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">1</span><span style=3D"color: #660;" class=3D"styled-by-prettify">;</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">519</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">7</span><span style=3D"color: #000;" class=3D"styled-by-pret=
tify"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">519</span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">7</span><span style=3D"color=
: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" =
class=3D"styled-by-prettify">@@</span><span style=3D"color: #000;" class=3D=
"styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-b=
y-prettify">static</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #008;" class=3D"styled-by-prettify">i=
nt</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc_dec=
ode_ext_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>(</span><span style=3D"color: #008;" class=3D"styled-by-prettify">struct</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> mmc_card </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">*</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">card</span><span styl=
e=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"colo=
r: #000;" class=3D"styled-by-prettify"> u8 </span><span style=3D"color: #66=
0;" class=3D"styled-by-prettify">*</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">ext_csd</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">)</span><span style=3D"color: #000;" class=3D"styled-b=
y-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">-&gt;</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify">ext_csd</span><span st=
yle=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"co=
lor: #000;" class=3D"styled-by-prettify">out_of_int_time </span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext_csd</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">[</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">EXT_CSD_OUT_OF_INTERRUPT_TIME</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">]</span><span style=3D"color: #000;" =
class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D"=
styled-by-prettify">*</span><span style=3D"color: #000;" class=3D"styled-by=
-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">10</span><span style=3D"color: #660;" class=3D"styled-by-prettify">;</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0</span><span style=3D"color: #660;" class=3D"styled=
-by-prettify">}</span><span style=3D"color: #000;" class=3D"styled-by-prett=
ify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span st=
yle=3D"color: #800;" class=3D"styled-by-prettify">#endif</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0card</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">-&gt;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">e=
xt_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">rel_param </s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> ext_csd</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">EXT_CSD_WR_REL_PARAM</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">];</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0card</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">-&gt;</span><span style=3D"color: #000;" class=3D"styled-by-prettify">e=
xt_csd</span><span style=3D"color: #660;" class=3D"styled-by-prettify">.</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify">rst_n_functio=
n </span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"> ext_csd</span>=
<span style=3D"color: #660;" class=3D"styled-by-prettify">[</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify">EXT_CSD_RST_N_FUNCTION</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">];</span><span=
 style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0<br>diff </s=
pan><span style=3D"color: #660;" class=3D"styled-by-prettify">--</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify">git a</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">drivers</span><span style=3D"color:=
 #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" c=
lass=3D"styled-by-prettify">pinctrl</span><span style=3D"color: #660;" clas=
s=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styl=
ed-by-prettify">sunxi</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify=
">pinctrl</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-=
</span><span style=3D"color: #000;" class=3D"styled-by-prettify">sun7i</spa=
n><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify">a20</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">c b</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify">pinctrl</span><span style=3D"color: #660;" class=3D"styled-by-pretti=
fy">/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">sunxi=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span=
 style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D=
"color: #000;" class=3D"styled-by-prettify">sun7i</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">.</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">c<br>index cf1ce0c</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">..</span><span style=3D"color: #066;" class=3D"styl=
ed-by-prettify">9fc12d2</span><span style=3D"color: #000;" class=3D"styled-=
by-prettify"> </span><span style=3D"color: #066;" class=3D"styled-by-pretti=
fy">100644</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
<br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">---</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"> a</span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify">drivers</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify">pinctrl</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=
=3D"styled-by-prettify">sunxi</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">pinctrl</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify">su=
n7i</span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span=
><span style=3D"color: #000;" class=3D"styled-by-prettify">a20</span><span =
style=3D"color: #660;" class=3D"styled-by-prettify">.</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">c<br></span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">+++</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"> b</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">/</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">drivers</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y">pinctrl</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
/</span><span style=3D"color: #000;" class=3D"styled-by-prettify">sunxi</sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">/</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify">pinctrl</span><span sty=
le=3D"color: #660;" class=3D"styled-by-prettify">-</span><span style=3D"col=
or: #000;" class=3D"styled-by-prettify">sun7i</span><span style=3D"color: #=
660;" class=3D"styled-by-prettify">-</span><span style=3D"color: #000;" cla=
ss=3D"styled-by-prettify">a20</span><span style=3D"color: #660;" class=3D"s=
tyled-by-prettify">.</span><span style=3D"color: #000;" class=3D"styled-by-=
prettify">c<br></span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">@@</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><spa=
n style=3D"color: #066;" class=3D"styled-by-prettify">314</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color=
: #066;" class=3D"styled-by-prettify">19</span><span style=3D"color: #000;"=
 class=3D"styled-by-prettify"> </span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">+</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">314</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #066;" class=3D"styled-by-prettify">23</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><spa=
n style=3D"color: #660;" class=3D"styled-by-prettify">@@</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=3D"color=
: #008;" class=3D"styled-by-prettify">static</span><span style=3D"color: #0=
00;" class=3D"styled-by-prettify"> </span><span style=3D"color: #008;" clas=
s=3D"styled-by-prettify">const</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> </span><span style=3D"color: #008;" class=3D"styled-by=
-prettify">struct</span><span style=3D"color: #000;" class=3D"styled-by-pre=
ttify"> sunxi_desc_pin sun7i_a20_pins</span><span style=3D"color: #660;" cl=
ass=3D"styled-by-prettify">[]</span><span style=3D"color: #000;" class=3D"s=
tyled-by-prettify"> </span><span style=3D"color: #660;" class=3D"styled-by-=
prettify">=3D</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #660;" class=3D"styled-by-prettify">{</spa=
n><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=
=A0 =C2=A0SUNXI_PIN</span><span style=3D"color: #660;" class=3D"styled-by-p=
rettify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">=
SUNXI_PINCTRL_PIN</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #000;" class=3D"styled-by-prettify">C<=
/span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><sp=
an style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span style=
=3D"color: #066;" class=3D"styled-by-prettify">12</span><span style=3D"colo=
r: #660;" class=3D"styled-by-prettify">),</span><span style=3D"color: #000;=
" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify">0x=
0</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span styl=
e=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_in&quot;</span><=
span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span sty=
le=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"style=
d-by-prettify">0x1</span><span style=3D"color: #660;" class=3D"styled-by-pr=
ettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
</span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio=
_out&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">=
),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></sp=
an><span style=3D"color: #660;" class=3D"styled-by-prettify">-</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-by-pr=
ettify">0x2</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span>=
<span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;nand0&quot;=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)),</span>=
<span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0</s=
pan><span style=3D"color: #800;" class=3D"styled-by-prettify">/* NDQ4 */</s=
pan><span style=3D"color: #000;" class=3D"styled-by-prettify"><br></span><s=
pan style=3D"color: #660;" class=3D"styled-by-prettify">+</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D"styled-by=
-prettify">(</span><span style=3D"color: #066;" class=3D"styled-by-prettify=
">0x2</span><span style=3D"color: #660;" class=3D"styled-by-prettify">,</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> </span><span =
style=3D"color: #080;" class=3D"styled-by-prettify">&quot;nand0&quot;</span=
><span style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span s=
tyle=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettify">/* N=
DQ4 */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=
</span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><s=
pan style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x3</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;mmc2&qu=
ot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span><span style=3D"color: #800;" class=3D"styled-by-prett=
ify">/* D4 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0SUNXI_PIN</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">SUNXI_PINCTRL_PIN</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">C</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">13</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_in=
&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">0x1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">&quot;gpio_out&quot;</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">),</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&=
quot;nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">)),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettif=
y">/* NDQ5 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;=
nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettify">/* =
NDQ5 */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x3</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;mmc2&qu=
ot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span><span style=3D"color: #800;" class=3D"styled-by-prett=
ify">/* D5 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0SUNXI_PIN</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">SUNXI_PINCTRL_PIN</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">C</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">14</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_in=
&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">0x1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">&quot;gpio_out&quot;</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">),</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&=
quot;nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">)),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettif=
y">/* NDQ6 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;=
nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettify">/* =
NDQ6 */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x3</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;mmc2&qu=
ot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span><span style=3D"color: #800;" class=3D"styled-by-prett=
ify">/* D6 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0SUNXI_PIN</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">SUNXI_PINCTRL_PIN</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">C</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">15</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_in=
&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">0x1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">&quot;gpio_out&quot;</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">),</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify=
">-</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660=
;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=
=3D"styled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"sty=
led-by-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&=
quot;nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">)),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =
=C2=A0 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettif=
y">/* NDQ7 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" c=
lass=3D"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"s=
tyled-by-prettify">0x2</span><span style=3D"color: #660;" class=3D"styled-b=
y-prettify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"> </span><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;=
nand0&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify"=
>),</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0=
 =C2=A0</span><span style=3D"color: #800;" class=3D"styled-by-prettify">/* =
NDQ7 */</span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br=
></span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</span><=
span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x3</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;mmc2&qu=
ot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">)),</sp=
an><span style=3D"color: #000;" class=3D"styled-by-prettify"> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 </span><span style=3D"color: #800;" class=3D"styled-by-prett=
ify">/* D7 */</span><span style=3D"color: #000;" class=3D"styled-by-prettif=
y"><br>=C2=A0 =C2=A0 =C2=A0SUNXI_PIN</span><span style=3D"color: #660;" cla=
ss=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"sty=
led-by-prettify">SUNXI_PINCTRL_PIN</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">(</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify">C</span><span style=3D"color: #660;" class=3D"styled-by-pret=
tify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">16</span><sp=
an style=3D"color: #660;" class=3D"styled-by-prettify">),</span><span style=
=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color: #660;" class=3D=
"styled-by-prettify">(</span><span style=3D"color: #066;" class=3D"styled-b=
y-prettify">0x0</span><span style=3D"color: #660;" class=3D"styled-by-prett=
ify">,</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> </s=
pan><span style=3D"color: #080;" class=3D"styled-by-prettify">&quot;gpio_in=
&quot;</span><span style=3D"color: #660;" class=3D"styled-by-prettify">),</=
span><span style=3D"color: #000;" class=3D"styled-by-prettify"><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SUNXI_FUNCTION</span><span style=3D"color=
: #660;" class=3D"styled-by-prettify">(</span><span style=3D"color: #066;" =
class=3D"styled-by-prettify">0x1</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">,</span><span style=3D"color: #000;" class=3D"style=
d-by-prettify"> </span><span style=3D"color: #080;" class=3D"styled-by-pret=
tify">&quot;gpio_out&quot;</span><span style=3D"color: #660;" class=3D"styl=
ed-by-prettify">),</span><span style=3D"color: #000;" class=3D"styled-by-pr=
ettify"><br></span></div></code></div>and it recognizes eMMC without proble=
ms.<br><br>Using dd for performance measure it gives:<br><div class=3D"pret=
typrint" style=3D"background-color: rgb(250, 250, 250); border-color: rgb(1=
87, 187, 187); border-style: solid; border-width: 1px; word-wrap: break-wor=
d;"><code class=3D"prettyprint"><div class=3D"subprettyprint"><span style=
=3D"color: #000;" class=3D"styled-by-prettify">root@egpr</span><span style=
=3D"color: #660;" class=3D"styled-by-prettify">:</span><span style=3D"color=
: #080;" class=3D"styled-by-prettify">/mnt# dd if=3D/</span><span style=3D"=
color: #000;" class=3D"styled-by-prettify">dev</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">/</span><span style=3D"color: #000;" cl=
ass=3D"styled-by-prettify">zero of</span><span style=3D"color: #660;" class=
=3D"styled-by-prettify">=3D</span><span style=3D"color: #066;" class=3D"sty=
led-by-prettify">1GBfile</span><span style=3D"color: #000;" class=3D"styled=
-by-prettify"> bs</span><span style=3D"color: #660;" class=3D"styled-by-pre=
ttify">=3D</span><span style=3D"color: #066;" class=3D"styled-by-prettify">=
1M</span><span style=3D"color: #000;" class=3D"styled-by-prettify"> count</=
span><span style=3D"color: #660;" class=3D"styled-by-prettify">=3D</span><s=
pan style=3D"color: #066;" class=3D"styled-by-prettify">1K</span><span styl=
e=3D"color: #000;" class=3D"styled-by-prettify"><br></span><span style=3D"c=
olor: #066;" class=3D"styled-by-prettify">1024</span><span style=3D"color: =
#660;" class=3D"styled-by-prettify">+</span><span style=3D"color: #066;" cl=
ass=3D"styled-by-prettify">0</span><span style=3D"color: #000;" class=3D"st=
yled-by-prettify"> records </span><span style=3D"color: #008;" class=3D"sty=
led-by-prettify">in</span><span style=3D"color: #000;" class=3D"styled-by-p=
rettify"><br></span><span style=3D"color: #066;" class=3D"styled-by-prettif=
y">1024</span><span style=3D"color: #660;" class=3D"styled-by-prettify">+</=
span><span style=3D"color: #066;" class=3D"styled-by-prettify">0</span><spa=
n style=3D"color: #000;" class=3D"styled-by-prettify"> records </span><span=
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
pan><span style=3D"color: #066;" class=3D"styled-by-prettify">78.7895</span=
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
an style=3D"color: #066;" class=3D"styled-by-prettify">28.6025</span><span =
style=3D"color: #000;" class=3D"styled-by-prettify"> s</span><span style=3D=
"color: #660;" class=3D"styled-by-prettify">,</span><span style=3D"color: #=
000;" class=3D"styled-by-prettify"> </span><span style=3D"color: #066;" cla=
ss=3D"styled-by-prettify">37.5</span><span style=3D"color: #000;" class=3D"=
styled-by-prettify"> MB</span><span style=3D"color: #660;" class=3D"styled-=
by-prettify">/</span><span style=3D"color: #000;" class=3D"styled-by-pretti=
fy">s<br></span></div></code></div>Compared to my last results write is the=
 same (13.6 vs. 13.5 MB/s) as speed but the read is 80% faster (37.5 vs. 20=
.8 MB/s).<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0=
;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;"><div bg=
color=3D"#FFFFFF" text=3D"#000000">
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
          Best regards<br>
          Chris<br>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;linux-sunxi&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org">linux-s=
unxi+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

------=_Part_881_1422485803.1462907864095--

------=_Part_880_1346132463.1462907864089--
